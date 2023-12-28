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
    /// Логика взаимодействия для DobWindow.xaml
    /// </summary>
    public partial class DobWindow : Window
    {
        public DobWindow()
        {
            InitializeComponent();
        }

        private void TextBox_TextChanged(object sender, TextChangedEventArgs e)
        {

        }

        private void Add_Click(object sender, RoutedEventArgs e)
        {
            if (DBConnect.entobj.Patients.Count(x => x.Imya == Im.Text) > 0)
            {
                MessageBox.Show("Такой пациент уже есть!",
                "Уведомление",
                MessageBoxButton.OK,
                MessageBoxImage.Information);
                return;
            }
            else
            {
                try
                {
                    Patients patientsObj = new Patients()
                    {
                        Imya = Im.Text,
                        Age = Voz.Text,
                        Diagnoz = Dia.Text,
                        IDvr = Convert.ToInt32(Kod.Text)
                    };
                    DBConnect.entobj.Patients.Add(patientsObj);
                    DBConnect.entobj.SaveChanges();

                    MessageBox.Show("Пациент создан!",
                    "Уведомление",
                    MessageBoxButton.OK,
                    MessageBoxImage.Information);
                }

                catch (Exception ex)
                {

                }
            }
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            PatientWindow mainWindow = new PatientWindow();
            mainWindow.Show();
            this.Close();
        }
    }
}

