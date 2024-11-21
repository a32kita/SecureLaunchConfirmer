using System.Diagnostics;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

using SecureLaunchConfirmer.Common;

namespace SecureLaunchConfirmer.App
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            LoadBrowsers();
            // コマンドライン引数からURLを取得
            string[] args = Environment.GetCommandLineArgs();
            if (args.Length > 1)
            {
                UrlTextBox.Text = args[1];
            }
        }

        private void LoadBrowsers()
        {
            var browsers = BrowserInstallingChecker.GetInstalledBrowsers().OrderByDescending(b => b.IsDefaultBrowser);

            BrowserListView.ItemsSource = browsers;
        }

        private void ContinueButton_Click(object sender, RoutedEventArgs e)
        {
            if (BrowserListView.SelectedItem is InstalledBrowser selectedBrowser)
            {
                string url = UrlTextBox.Text;
                if (!string.IsNullOrEmpty(url))
                {
                    // 選択されたブラウザでURLを開く
                    Process.Start(new ProcessStartInfo(selectedBrowser.Path, url) { UseShellExecute = true });
                    System.Windows.Application.Current.Shutdown();
                }
            }
            else
            {
                System.Windows.MessageBox.Show("ブラウザを選択してください。", "エラー", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
    }
}