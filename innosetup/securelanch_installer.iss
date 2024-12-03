[Setup]
AppName=Secure Launch Confirmer
AppVersion=1.0
DefaultDirName={pf}\SecureLaunchConfirmer
DefaultGroupName=Secure Launch Confirmer
OutputBaseFilename=SecureLaunchConfirmer_setup

[Files]
Source: "..\src\SecureLaunchConfirmer.App\bin\Debug\net6.0-windows\*"; DestDir: "{app}"

[Registry]
; アプリケーション名を登録
Root: HKLM; Subkey: "SOFTWARE\Clients\StartMenuInternet\SecureLaunchConfirmer"; ValueType: string; ValueName: ""; ValueData: "Secure Launch Confirmer"; Flags: createvalueifdoesntexist uninsdeletekey
Root: HKLM; Subkey: "SOFTWARE\Clients\StartMenuInternet\SecureLaunchConfirmer"; ValueType: string; ValueName: "LocalizedString"; ValueData: "Secure Launch Confirmer"; Flags: createvalueifdoesntexist uninsdeletekey

; アイコンの登録
Root: HKLM; Subkey: "SOFTWARE\Clients\StartMenuInternet\SecureLaunchConfirmer\DefaultIcon"; ValueType: string; ValueName: ""; ValueData: "{app}\SecureLaunchConfirmer.App.exe,0"; Flags: createvalueifdoesntexist uninsdeletekey

; 実行コマンドの登録
Root: HKLM; Subkey: "SOFTWARE\Clients\StartMenuInternet\SecureLaunchConfirmer\shell\open\command"; ValueType: string; ValueName: ""; ValueData: """{app}\SecureLaunchConfirmer.App.exe"" ""%1"""; Flags: createvalueifdoesntexist uninsdeletekey

; プロトコルハンドリング (HTTP)
Root: HKCR; Subkey: "SecureLaunchConfirmer.HTTP"; ValueType: string; ValueName: ""; ValueData: "Secure Launch Confirmer"; Flags: createvalueifdoesntexist uninsdeletekey
Root: HKCR; Subkey: "SecureLaunchConfirmer.HTTP"; ValueType: string; ValueName: "URL Protocol"; ValueData: ""; Flags: createvalueifdoesntexist uninsdeletekey
Root: HKCR; Subkey: "SecureLaunchConfirmer.HTTP\shell\open\command"; ValueType: string; ValueName: ""; ValueData: """{app}\SecureLaunchConfirmer.App.exe"" ""%1"""; Flags: createvalueifdoesntexist uninsdeletekey

; プロトコルハンドリング (HTTPS)
Root: HKCR; Subkey: "SecureLaunchConfirmer.HTTPS"; ValueType: string; ValueName: ""; ValueData: "Secure Launch Confirmer"; Flags: createvalueifdoesntexist uninsdeletekey
Root: HKCR; Subkey: "SecureLaunchConfirmer.HTTPS"; ValueType: string; ValueName: "URL Protocol"; ValueData: ""; Flags: createvalueifdoesntexist uninsdeletekey
Root: HKCR; Subkey: "SecureLaunchConfirmer.HTTPS\shell\open\command"; ValueType: string; ValueName: ""; ValueData: """{app}\SecureLaunchConfirmer.App.exe"" ""%1"""; Flags: createvalueifdoesntexist uninsdeletekey

; 拡張子ハンドリング (HTML)
Root: HKCR; Subkey: "SecureLaunchConfirmer.HTML"; ValueType: string; ValueName: ""; ValueData: "Secure Launch Confirmer"; Flags: createvalueifdoesntexist uninsdeletekey
Root: HKCR; Subkey: "SecureLaunchConfirmer.HTML"; ValueType: string; ValueName: "URL Protocol"; ValueData: ""; Flags: createvalueifdoesntexist uninsdeletekey
Root: HKCR; Subkey: "SecureLaunchConfirmer.HTML\shell\open\command"; ValueType: string; ValueName: ""; ValueData: """{app}\SecureLaunchConfirmer.App.exe"" ""%1"""; Flags: createvalueifdoesntexist uninsdeletekey

; RegisteredApplications に登録
Root: HKLM; Subkey: "SOFTWARE\RegisteredApplications"; ValueType: string; ValueName: "SecureLaunchConfirmer"; ValueData: "SOFTWARE\Clients\StartMenuInternet\SecureLaunchConfirmer"; Flags: createvalueifdoesntexist uninsdeletevalue

; HTTP プロトコルを指定
Root: HKLM; Subkey: "SOFTWARE\Classes\http"; ValueType: string; ValueName: ""; ValueData: "SecureLaunchConfirmer.HTTP"; Flags: createvalueifdoesntexist uninsdeletevalue

; HTTPS プロトコルを指定
Root: HKLM; Subkey: "SOFTWARE\Classes\https"; ValueType: string; ValueName: ""; ValueData: "SecureLaunchConfirmer.HTTPS"; Flags: createvalueifdoesntexist uninsdeletevalue

; Capabilities セクションの追加
Root: HKLM; Subkey: "SOFTWARE\Clients\StartMenuInternet\SecureLaunchConfirmer\Capabilities"; Flags: createvalueifdoesntexist
Root: HKLM; Subkey: "SOFTWARE\Clients\StartMenuInternet\SecureLaunchConfirmer\Capabilities"; ValueType: string; ValueName: "ApplicationDescription"; ValueData: "Secure Launch Confirmer - A secure launcher"; Flags: createvalueifdoesntexist uninsdeletekey
Root: HKLM; Subkey: "SOFTWARE\Clients\StartMenuInternet\SecureLaunchConfirmer\Capabilities"; ValueType: string; ValueName: "ApplicationName"; ValueData: "Secure Launch Confirmer"; Flags: createvalueifdoesntexist uninsdeletekey

Root: HKLM; Subkey: "SOFTWARE\Clients\StartMenuInternet\SecureLaunchConfirmer\Capabilities\Startmenu"; ValueType: string; ValueName: "StartMenuInternet"; ValueData: "Secure Launch Confirmer"; Flags: createvalueifdoesntexist uninsdeletekey

; HTTP プロトコルの関連付け
Root: HKLM; Subkey: "SOFTWARE\Clients\StartMenuInternet\SecureLaunchConfirmer\Capabilities\URLAssociations"; Flags: createvalueifdoesntexist
Root: HKLM; Subkey: "SOFTWARE\Clients\StartMenuInternet\SecureLaunchConfirmer\Capabilities\URLAssociations"; ValueType: string; ValueName: "ftp"; ValueData: "SecureLaunchConfirmer.HTTP"; Flags: createvalueifdoesntexist uninsdeletekey
Root: HKLM; Subkey: "SOFTWARE\Clients\StartMenuInternet\SecureLaunchConfirmer\Capabilities\URLAssociations"; ValueType: string; ValueName: "http"; ValueData: "SecureLaunchConfirmer.HTTP"; Flags: createvalueifdoesntexist uninsdeletekey
Root: HKLM; Subkey: "SOFTWARE\Clients\StartMenuInternet\SecureLaunchConfirmer\Capabilities\URLAssociations"; ValueType: string; ValueName: "https"; ValueData: "SecureLaunchConfirmer.HTTPS"; Flags: createvalueifdoesntexist uninsdeletekey
Root: HKLM; Subkey: "SOFTWARE\Clients\StartMenuInternet\SecureLaunchConfirmer\Capabilities\URLAssociations"; ValueType: string; ValueName: "irc"; ValueData: "SecureLaunchConfirmer.HTTP"; Flags: createvalueifdoesntexist uninsdeletekey
Root: HKLM; Subkey: "SOFTWARE\Clients\StartMenuInternet\SecureLaunchConfirmer\Capabilities\URLAssociations"; ValueType: string; ValueName: "mailto"; ValueData: "SecureLaunchConfirmer.HTTP"; Flags: createvalueifdoesntexist uninsdeletekey
Root: HKLM; Subkey: "SOFTWARE\Clients\StartMenuInternet\SecureLaunchConfirmer\Capabilities\URLAssociations"; ValueType: string; ValueName: "mms"; ValueData: "SecureLaunchConfirmer.HTTP"; Flags: createvalueifdoesntexist uninsdeletekey
Root: HKLM; Subkey: "SOFTWARE\Clients\StartMenuInternet\SecureLaunchConfirmer\Capabilities\URLAssociations"; ValueType: string; ValueName: "news"; ValueData: "SecureLaunchConfirmer.HTTP"; Flags: createvalueifdoesntexist uninsdeletekey
Root: HKLM; Subkey: "SOFTWARE\Clients\StartMenuInternet\SecureLaunchConfirmer\Capabilities\URLAssociations"; ValueType: string; ValueName: "nntp"; ValueData: "SecureLaunchConfirmer.HTTP"; Flags: createvalueifdoesntexist uninsdeletekey
Root: HKLM; Subkey: "SOFTWARE\Clients\StartMenuInternet\SecureLaunchConfirmer\Capabilities\URLAssociations"; ValueType: string; ValueName: "sms"; ValueData: "SecureLaunchConfirmer.HTTP"; Flags: createvalueifdoesntexist uninsdeletekey
Root: HKLM; Subkey: "SOFTWARE\Clients\StartMenuInternet\SecureLaunchConfirmer\Capabilities\URLAssociations"; ValueType: string; ValueName: "smsto"; ValueData: "SecureLaunchConfirmer.HTTP"; Flags: createvalueifdoesntexist uninsdeletekey
Root: HKLM; Subkey: "SOFTWARE\Clients\StartMenuInternet\SecureLaunchConfirmer\Capabilities\URLAssociations"; ValueType: string; ValueName: "snews"; ValueData: "SecureLaunchConfirmer.HTTP"; Flags: createvalueifdoesntexist uninsdeletekey
Root: HKLM; Subkey: "SOFTWARE\Clients\StartMenuInternet\SecureLaunchConfirmer\Capabilities\URLAssociations"; ValueType: string; ValueName: "tel"; ValueData: "SecureLaunchConfirmer.HTTP"; Flags: createvalueifdoesntexist uninsdeletekey
Root: HKLM; Subkey: "SOFTWARE\Clients\StartMenuInternet\SecureLaunchConfirmer\Capabilities\URLAssociations"; ValueType: string; ValueName: "urn"; ValueData: "SecureLaunchConfirmer.HTTP"; Flags: createvalueifdoesntexist uninsdeletekey
Root: HKLM; Subkey: "SOFTWARE\Clients\StartMenuInternet\SecureLaunchConfirmer\Capabilities\URLAssociations"; ValueType: string; ValueName: "webcal"; ValueData: "SecureLaunchConfirmer.HTTP"; Flags: createvalueifdoesntexist uninsdeletekey

; MIME タイプやファイル拡張子の関連付けがある場合 (オプション)
Root: HKLM; Subkey: "SOFTWARE\Clients\StartMenuInternet\SecureLaunchConfirmer\Capabilities\FileAssociations"; Flags: createvalueifdoesntexist
Root: HKLM; Subkey: "SOFTWARE\Clients\StartMenuInternet\SecureLaunchConfirmer\Capabilities\FileAssociations"; ValueType: string; ValueName: ".htm"; ValueData: "SecureLaunchConfirmer.HTML"; Flags: createvalueifdoesntexist uninsdeletekey
Root: HKLM; Subkey: "SOFTWARE\Clients\StartMenuInternet\SecureLaunchConfirmer\Capabilities\FileAssociations"; ValueType: string; ValueName: ".html"; ValueData: "SecureLaunchConfirmer.HTML"; Flags: createvalueifdoesntexist uninsdeletekey
Root: HKLM; Subkey: "SOFTWARE\Clients\StartMenuInternet\SecureLaunchConfirmer\Capabilities\FileAssociations"; ValueType: string; ValueName: ".mht"; ValueData: "SecureLaunchConfirmer.HTML"; Flags: createvalueifdoesntexist uninsdeletekey
Root: HKLM; Subkey: "SOFTWARE\Clients\StartMenuInternet\SecureLaunchConfirmer\Capabilities\FileAssociations"; ValueType: string; ValueName: ".mhtml"; ValueData: "SecureLaunchConfirmer.HTML"; Flags: createvalueifdoesntexist uninsdeletekey
Root: HKLM; Subkey: "SOFTWARE\Clients\StartMenuInternet\SecureLaunchConfirmer\Capabilities\FileAssociations"; ValueType: string; ValueName: ".pdf"; ValueData: "SecureLaunchConfirmer.HTML"; Flags: createvalueifdoesntexist uninsdeletekey
Root: HKLM; Subkey: "SOFTWARE\Clients\StartMenuInternet\SecureLaunchConfirmer\Capabilities\FileAssociations"; ValueType: string; ValueName: ".shtml"; ValueData: "SecureLaunchConfirmer.HTML"; Flags: createvalueifdoesntexist uninsdeletekey
Root: HKLM; Subkey: "SOFTWARE\Clients\StartMenuInternet\SecureLaunchConfirmer\Capabilities\FileAssociations"; ValueType: string; ValueName: ".svg"; ValueData: "SecureLaunchConfirmer.HTML"; Flags: createvalueifdoesntexist uninsdeletekey
Root: HKLM; Subkey: "SOFTWARE\Clients\StartMenuInternet\SecureLaunchConfirmer\Capabilities\FileAssociations"; ValueType: string; ValueName: ".webp"; ValueData: "SecureLaunchConfirmer.HTML"; Flags: createvalueifdoesntexist uninsdeletekey
Root: HKLM; Subkey: "SOFTWARE\Clients\StartMenuInternet\SecureLaunchConfirmer\Capabilities\FileAssociations"; ValueType: string; ValueName: ".xht"; ValueData: "SecureLaunchConfirmer.HTML"; Flags: createvalueifdoesntexist uninsdeletekey
Root: HKLM; Subkey: "SOFTWARE\Clients\StartMenuInternet\SecureLaunchConfirmer\Capabilities\FileAssociations"; ValueType: string; ValueName: ".xhtml"; ValueData: "SecureLaunchConfirmer.HTML"; Flags: createvalueifdoesntexist uninsdeletekey
Root: HKLM; Subkey: "SOFTWARE\Clients\StartMenuInternet\SecureLaunchConfirmer\Capabilities\FileAssociations"; ValueType: string; ValueName: ".xml"; ValueData: "SecureLaunchConfirmer.HTML"; Flags: createvalueifdoesntexist uninsdeletekey


[Icons]
Name: "{group}\Secure Launch Confirmer"; Filename: "{app}\SecureLaunchConfirmer.App.exe"
Name: "{group}\{cm:UninstallProgram,Secure Launch Confirmer}"; Filename: "{uninstallexe}"

[Code]
function InitializeSetup(): Boolean;
begin
  // Request administrative privileges for the installer
  if not IsAdmin then
  begin
    MsgBox('This installer requires administrative privileges. Please run as an administrator.', mbError, MB_OK);
    Result := False;
  end else
    Result := True;
end;
