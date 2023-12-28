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

namespace WpfApp2
{
    /// <summary>
    /// Логика взаимодействия для PatientWindow.xaml
    /// </summary>
    public partial class PatientWindow : Window
    {
        public PatientWindow()
        {
            InitializeComponent();
            Spisok.ItemsSource = DBConnect.entobj.Patients.ToList();
        }

        private void Add_Click(object sender, RoutedEventArgs e)
        {
            DobWindow dobWindow = new DobWindow();
            dobWindow.Show();
            this.Close();
           
        }

        private void Spisok_IsVisibleChanged(object sender, DependencyPropertyChangedEventArgs e)
        {

        }
    }
}