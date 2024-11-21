using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Windows.Media.Imaging;

namespace SecureLaunchConfirmer.App
{
    internal class IconExtractor
    {
        [DllImport("shell32.dll", CharSet = CharSet.Auto)]
        private static extern IntPtr SHGetFileInfo(string pszPath, uint dwFileAttributes, ref SHFILEINFO psfi, uint cbFileInfo, uint uFlags);

        [StructLayout(LayoutKind.Sequential)]
        private struct SHFILEINFO
        {
            public IntPtr hIcon;
            public int iIcon;
            public uint dwAttributes;
            [MarshalAs(UnmanagedType.ByValTStr, SizeConst = 260)]
            public string szDisplayName;
            [MarshalAs(UnmanagedType.ByValTStr, SizeConst = 80)]
            public string szTypeName;
        }

        private const uint SHGFI_SYSICONINDEX = 0x4000; // Gets the index of the system image list.
        private const uint SHGFI_ICON = 0x000000100;
        private const uint SHGFI_LARGEICON = 0x000000000; // Large icon
        private const uint SHGFI_SMALLICON = 0x000000001; // Small icon
        private const uint SHGFI_USEFILEATTRIBUTES = 0x000000010;
        private const int ILD_TRANSPARENT = 0x1;

        public static Icon? ExtractIcon(string path, bool largeIcon = true)
        {
            SHFILEINFO shinfo = new SHFILEINFO();
            uint flags = SHGFI_ICON | (largeIcon ? SHGFI_LARGEICON : SHGFI_SMALLICON);
            SHGetFileInfo(path, 0, ref shinfo, (uint)Marshal.SizeOf(shinfo), flags);

            Icon? icon = Icon.FromHandle(shinfo.hIcon).Clone() as Icon;
            DestroyIcon(shinfo.hIcon); // Clean up native icon to prevent memory leaks
            return icon;
        }

        public static BitmapImage ExtractHighQualityIcon(string filePath)
        {
            IntPtr hImageList = IntPtr.Zero;
            SHFILEINFO shinfo = new SHFILEINFO();

            hImageList = SHGetFileInfo(filePath, 0, ref shinfo, (uint)Marshal.SizeOf(shinfo), SHGFI_SYSICONINDEX | SHGFI_LARGEICON);

            if (hImageList == IntPtr.Zero)
                throw new InvalidOperationException("Failed to retrieve image list.");
            IImageList imageList = (IImageList)Marshal.GetObjectForIUnknown(hImageList);

            IntPtr hIcon = IntPtr.Zero;
            imageList.GetIcon(shinfo.iIcon, ILD_TRANSPARENT, out hIcon);

            if (hIcon == IntPtr.Zero)
                throw new InvalidOperationException("Failed to retrieve icon.");

            Icon icon = Icon.FromHandle(hIcon);

            using (MemoryStream stream = new MemoryStream())
            {
                icon.Save(stream);
                stream.Seek(0, SeekOrigin.Begin);
                BitmapImage bitmap = new BitmapImage();
                bitmap.BeginInit();
                bitmap.StreamSource = stream;
                bitmap.CacheOption = BitmapCacheOption.OnLoad;
                bitmap.EndInit();
                return bitmap;
            }
        }

        [ComImport]
        [Guid("46EB5926-582E-4017-9FDF-E8998DAA0950")]
        [InterfaceType(ComInterfaceType.InterfaceIsIUnknown)]
        private interface IImageList
        {
            [PreserveSig]
            int GetIcon(int i, int flags, out IntPtr picon);
            // Other methods omitted for simplicity
        }

        [DllImport("user32.dll", CharSet = CharSet.Auto)]
        private extern static bool DestroyIcon(IntPtr handle);
    }
}
