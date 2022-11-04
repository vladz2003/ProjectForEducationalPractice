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
using System.Windows.Shapes;

namespace MedicineProject.Windows
{
    /// <summary>
    /// Логика взаимодействия для VoidDescriptionPatient.xaml
    /// </summary>
    public partial class VoidDescriptionPatient : Window
    {
        public VoidDescriptionPatient()
        {
            InitializeComponent();
            DBGridModel.ItemsSource = Entities.ClinicalHospitalRecordsEntities1
                                                .GetContext()
                                                .DescriptionPatient
                                                .Where(x => x.id == 1)
                                                .ToList();
        }
    }
}
