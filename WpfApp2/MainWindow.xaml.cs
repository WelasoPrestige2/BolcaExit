using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows;

namespace WpfApp2
{
    public partial class MainWindow : Window
    {
        

        public MainWindow()
        {
            InitializeComponent();
           
            DBConnect.entobj = new BolcaEntities6();
        }

       

        private void Login_Click(object sender, RoutedEventArgs e)
        {
           try
            {
                var userobj = DBConnect.entobj.User.FirstOrDefault(x => x.Login == txtUsername.Text && x.Password == txtPassword.Password);
                if (userobj == null)
                {
                    MessageBox.Show("Такой пользователь не найден!",
               "Уведомление",
               MessageBoxButton.OK,
               MessageBoxImage.Information);
                }
                else
                {
                    switch (userobj.IdRole)
                    {
                        case 1:
                            MessageBox.Show("Здравствуйте, администратор!" + userobj.Login,
               "Уведомление",
               MessageBoxButton.OK,
               MessageBoxImage.Information);
                            BolcaWindow bolcaWindow = new BolcaWindow();
                            bolcaWindow.Show();
                            this.Hide();
                            break;
                        case 2:
                            MessageBox.Show("Здравствуйте, пользователь!" + userobj.Login,
               "Уведомление",
               MessageBoxButton.OK,
               MessageBoxImage.Information);
                            BolcaWindow bolcaWindow2 = new BolcaWindow();
                            bolcaWindow2.Show();
                            this.Hide();
                            break;

                    }
                } 
                    
                   
            }
            catch (Exception ex)
            {

            }
        }

        private void Register_Click(object sender, RoutedEventArgs e)
        {
            if (DBConnect.entobj.User.Count(x => x.Login == txtUsername.Text) > 0)
            {
                MessageBox.Show("Такой пользователь уже есть!",
                "Уведомление",
                MessageBoxButton.OK,
                MessageBoxImage.Information);
                return;
            }
            else
            {
                try
                {
                    User userObj = new User()
                    {
                        Login = txtUsername.Text,
                        Password = txtPassword.Password,
                        IdRole = 2
                    };
                    DBConnect.entobj.User.Add(userObj);
                    DBConnect.entobj.SaveChanges();

                    MessageBox.Show("Пользователь создан!",
                    "Уведомление",
                    MessageBoxButton.OK,
                    MessageBoxImage.Information);
                }
                catch
                {

                }
            
            }
            }
    }
}
