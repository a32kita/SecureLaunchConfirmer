using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SecureLaunchConfirmer.Common
{
    public class BrowserInstallingChecker
    {
        public static List<InstalledBrowser> GetInstalledBrowsers()
        {
            var browsers = new List<InstalledBrowser>();

            // Check for Edge
            string edgePath = GetBrowserPathFromRegistry(@"SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\msedge.exe", "");
            if (!string.IsNullOrEmpty(edgePath))
            {
                browsers.Add(new InstalledBrowser
                {
                    Name = "Edge",
                    Path = edgePath,
                    IsDefaultBrowser = IsDefaultBrowser("Edge")
                });
            }

            // Check for Firefox
            string firefoxPath = GetBrowserPathFromRegistry(@"SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\firefox.exe", "");
            if (!string.IsNullOrEmpty(firefoxPath))
            {
                browsers.Add(new InstalledBrowser
                {
                    Name = "Firefox",
                    Path = firefoxPath,
                    IsDefaultBrowser = IsDefaultBrowser("Firefox")
                });
            }

            // Check for Chrome
            string chromePath = GetBrowserPathFromRegistry(@"SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\chrome.exe", "");
            if (!string.IsNullOrEmpty(chromePath))
            {
                browsers.Add(new InstalledBrowser
                {
                    Name = "Chrome",
                    Path = chromePath,
                    IsDefaultBrowser = IsDefaultBrowser("Chrome")
                });
            }

            return browsers;
        }

        private static string GetBrowserPathFromRegistry(string registryPath, string valueName)
        {
            var unknownBrowser = String.Empty;

            try
            {
                using (RegistryKey? key = Registry.LocalMachine.OpenSubKey(registryPath))
                {
                    if (key != null)
                    {
                        return key.GetValue(valueName)?.ToString() ?? unknownBrowser;
                    }
                }
            }
            catch (Exception)
            {
                // Log exception or handle it as needed
            }

            return unknownBrowser;
        }

        private static bool IsDefaultBrowser(string browserName)
        {
            string userChoicePath = @"HKEY_CURRENT_USER\Software\Microsoft\Windows\Shell\Associations\UrlAssociations\http\UserChoice";
            string? progId = (string?)Registry.GetValue(userChoicePath, "ProgId", null);

            if (progId == null)
                return false;

            switch (browserName)
            {
                case "Edge":
                    return progId != null && progId.Contains("MSEdgeHTM");
                case "Firefox":
                    return progId != null && progId.Contains("FirefoxURL");
                case "Chrome":
                    return progId != null && progId.Contains("ChromeHTML");
                default:
                    return false;
            }
        }
    }
}
