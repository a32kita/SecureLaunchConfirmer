using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SecureLaunchConfirmer.Common
{
    public class InstalledBrowser
    {
        /// <summary>
        /// ブラウザの名前を取得または設定します
        /// </summary>
        public string? Name { get; set; }

        /// <summary>
        /// ブラウザの実行ファイルのパスを取得または設定します
        /// </summary>
        public string? Path { get; set; }

        /// <summary>
        /// このブラウザがデフォルト ブラウザであるかどうかを取得または設定します。
        /// </summary>
        public bool IsDefaultBrowser { get; set; }
    }
}
