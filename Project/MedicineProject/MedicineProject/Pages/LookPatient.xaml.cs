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
using Word = Microsoft.Office.Interop.Word;

namespace MedicineProject.Pages
{
    /// <summary>
    /// Логика взаимодействия для LookPatient.xaml
    /// </summary>
    public partial class LookPatient : Page
    {
        public LookPatient()
        {
            InitializeComponent();
            RefreshData();
        }

        /// <summary>
        /// Описание больного.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnDescr_Click(object sender, RoutedEventArgs e)
        {
            Windows.VoidDescriptionPatient vDP = new Windows.VoidDescriptionPatient();
            vDP.Show();
        }

        /// <summary>
        /// Выписка больного.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnEnd_Click(object sender, RoutedEventArgs e)
        {
            Windows.VoidEndOfThreatment vEoT = new Windows.VoidEndOfThreatment();
            vEoT.Show();
        }

        /// <summary>
        /// Добавление Данных.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void AddBtn_Click(object sender, RoutedEventArgs e)
        {
            Classes.Manager.MainFrame.Navigate(new Pages.AddAndEditDataPage(null));
        }

        /// <summary>
        /// Удаление данных.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void DeleteBtn_Click(object sender, RoutedEventArgs e)
        {
            var deleteData = DBGridModel.SelectedItems.Cast<Entities.MedicineCard>().ToList();

            if (MessageBox.Show($"Вы уверены в том, что хотите удалить {deleteData.Count()} элемент(-а / -ов)?", "Внимание!", MessageBoxButton.YesNo, MessageBoxImage.Question) == MessageBoxResult.Yes)
            {
                Entities.ClinicalHospitalRecordsEntities1.GetContext().MedicineCard.RemoveRange(deleteData);
                Entities.ClinicalHospitalRecordsEntities1.GetContext().SaveChanges();
                MessageBox.Show("Информация удалена успешно", "Внимание!", MessageBoxButton.OK, MessageBoxImage.Information);
                RefreshData();
            }
        }

        /// <summary>
        /// Обновление данных.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnEdit_Click(object sender, RoutedEventArgs e)
        {
            Classes.Manager.MainFrame.Navigate(new Pages.AddAndEditDataPage((sender as Button).DataContext as Entities.MedicineCard));
        }

        /// <summary>
        /// Обновление данных в таблице.
        /// </summary>
        public void RefreshData()
        {
            DBGridModel.ItemsSource = Entities.ClinicalHospitalRecordsEntities1.GetContext().MedicineCard.OrderBy(x => x.FIO).ToList();
        }

        /// <summary>
        /// Сохранение таблицы в Word.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void SaveWordBtn_Click(object sender, RoutedEventArgs e)
        {
            var medicine = Entities.ClinicalHospitalRecordsEntities1.GetContext().MedicineCard.OrderBy(x => x.FIO).ToList();
            Word.Application app = new Word.Application();
            Word.Document document = app.Documents.Add();
            int startRowIndex = 1;
            Word.Paragraph paragraph = document.Paragraphs.Add();
            Word.Range range = paragraph.Range;
            range.Text = "Список медицинских карт";
            paragraph.set_Style("Заголовок 1");
            range.InsertParagraphAfter();
            Word.Paragraph tableParagraph = document.Paragraphs.Add();
            Word.Range tableRange = tableParagraph.Range;
            Word.Table table = document.Tables.Add(tableRange, medicine.Count() + 1, 6);
            Word.Range cellRange;
            cellRange = table.Cell(1, 1).Range;
            cellRange.Text = "Фамилия Имя Отчество";
            cellRange = table.Cell(1, 2).Range;
            cellRange.Text = "Возраст";
            cellRange = table.Cell(1, 3).Range;
            cellRange.Text = "Пол";
            cellRange = table.Cell(1, 4).Range;
            cellRange.Text = "Предварительный диагноз";
            cellRange = table.Cell(1, 5).Range;
            cellRange.Text = "Поступление больного";
            cellRange = table.Cell(1, 6).Range;
            cellRange.Text = "Дата поступления";
            startRowIndex++;
            foreach (var item in medicine)
            {
                cellRange = table.Cell(startRowIndex, 1).Range;
                cellRange.Text = item.FIO;
                cellRange = table.Cell(startRowIndex, 2).Range;
                cellRange.Text = Convert.ToString(item.Age);
                cellRange = table.Cell(startRowIndex, 3).Range;
                cellRange.Text = item.Gender;
                cellRange = table.Cell(startRowIndex, 4).Range;
                cellRange.Text = item.PreliminaryDiagnosis;
                cellRange = table.Cell(startRowIndex, 5).Range;
                cellRange.Text = Convert.ToString(item.EntryMethod.MethodName);
                cellRange = table.Cell(startRowIndex, 6).Range;
                cellRange.Text = item.RecieptDate.ToShortDateString();
                startRowIndex++;
            }
            app.Visible = true;
            document.SaveAs2(@"C:\WordFile.docx");
            document.SaveAs2(@"C:\WordFile.pdf", Word.WdExportFormat.wdExportFormatPDF);
        }

        /// <summary>
        /// Обновление данных.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void RefreshBtn_Click(object sender, RoutedEventArgs e)
        {
            RefreshData();
        }
    }
}
