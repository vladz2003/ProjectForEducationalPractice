using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace MedicineProject.Pages
{
    /// <summary>
    /// Логика взаимодействия для AddAndEditDataPage.xaml
    /// </summary>
    public partial class AddAndEditDataPage : Page
    {
        private Entities.MedicineCard _medicineCard = new Entities.MedicineCard();
        public AddAndEditDataPage(Entities.MedicineCard medicineCard)
        {
            InitializeComponent();

            if (medicineCard != null)
            {
                _medicineCard = medicineCard;
            }    
            DataContext = _medicineCard;
            entryBox.ItemsSource = Entities.ClinicalHospitalRecordsEntities1.GetContext().EntryMethod.ToList();

        }

        /// <summary>
        /// Сохранение данных в Базу Данных.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void SaveData_Click(object sender, RoutedEventArgs e)
        {
            StringBuilder errror = new StringBuilder();

            if (string.IsNullOrEmpty(_medicineCard.FIO))
            {
                errror.AppendLine("Пожалуйста, введите ФИО пациента!");
            }
            if (_medicineCard.Age < 18)
            {
                errror.AppendLine("К сожалению, это взрослое отделение больницы!");
            }
            if (string.IsNullOrEmpty(_medicineCard.Gender))
            {
                errror.AppendLine("Пожалуйста, выберите пол!");
            }
            if (string.IsNullOrEmpty(_medicineCard.PreliminaryDiagnosis))
            {
                errror.AppendLine("Пожалуйста, введите диагноз пациента!");
            }
            if (_medicineCard.EntryMethod == null)
            {
                errror.AppendLine("Пожалуйста, выберите тип поступления больного!");
            }
            if (DateTime.Parse(dateTB.Text) > DateTime.Now)
            {
                errror.AppendLine("Пациента нельзя положить из будущего!");
            }

            if (errror.Length > 0)
            {
                MessageBox.Show(errror.ToString(),"Произошла ошибка!",MessageBoxButton.OK,MessageBoxImage.Error);
                return;
            }

            if (_medicineCard.id == 0)
            {
                Entities.ClinicalHospitalRecordsEntities1.GetContext().MedicineCard.Add(_medicineCard);
            }

            try
            {
                Entities.ClinicalHospitalRecordsEntities1.GetContext().SaveChanges();
                MessageBox.Show("Информация сохранена успешно!","Внимание!",MessageBoxButton.OK,MessageBoxImage.Information);
                Classes.Manager.MainFrame.GoBack();
            }

            catch (Exception ex)
            {
                MessageBox.Show($"Во время сохранения данных произошла ошибка! Текст ошибки: {ex.Message}","Внимание!",MessageBoxButton.OK,MessageBoxImage.Information);
            }
        }
    }
}
