[Setup]
AppName=Secure Launch Confirmer
AppVersion=1.0
DefaultDirName={pf}\SecureLaunchConfirmer
DefaultGroupName=Secure Launch Confirmer

[Files]
Source: "..\src\SecureLaunchConfirmer.App\bin\Debug\net6.0-windows\*"; DestDir: "{app}"

[Registry]
; Register the browser
Root: HKLM; Subkey: "Software\Clients\StartMenuInternet\SecureLaunchConfirmer"; ValueType: string; ValueName: ""; ValueData: "Secure Launch Confirmer"; Flags: createvalueifdoesntexist
Root: HKLM; Subkey: "Software\Clients\StartMenuInternet\SecureLaunchConfirmer\DefaultIcon"; ValueType: string; ValueName: ""; ValueData: "{app}\SecureLaunchConfirmer.App.exe,0"; Flags: createvalueifdoesntexist
Root: HKLM; Subkey: "Software\Clients\StartMenuInternet\SecureLaunchConfirmer\shell\open\command"; ValueType: string; ValueName: ""; ValueData: """{app}\SecureLaunchConfirmer.App.exe"" ""%1"""; Flags: createvalueifdoesntexist

; Register the browser capabilities
Root: HKLM; Subkey: "Software\SecureLaunchConfirmer\Capabilities"; ValueType: string; ValueName: "ApplicationDescription"; ValueData: "Secure Launch Confirmer is a secure web browser."; Flags: createvalueifdoesntexist
Root: HKLM; Subkey: "Software\SecureLaunchConfirmer\Capabilities"; ValueType: string; ValueName: "ApplicationName"; ValueData: "Secure Launch Confirmer"; Flags: createvalueifdoesntexist
Root: HKLM; Subkey: "Software\SecureLaunchConfirmer\Capabilities\FileAssociations"; ValueType: string; ValueName: ".htm"; ValueData: "SecureLaunchConfirmerHTML"; Flags: createvalueifdoesntexist
Root: HKLM; Subkey: "Software\SecureLaunchConfirmer\Capabilities\FileAssociations"; ValueType: string; ValueName: ".html"; ValueData: "SecureLaunchConfirmerHTML"; Flags: createvalueifdoesntexist
Root: HKLM; Subkey: "Software\SecureLaunchConfirmer\Capabilities\URLAssociations"; ValueType: string; ValueName: "http"; ValueData: "SecureLaunchConfirmerURL"; Flags: createvalueifdoesntexist
Root: HKLM; Subkey: "Software\SecureLaunchConfirmer\Capabilities\URLAssociations"; ValueType: string; ValueName: "https"; ValueData: "SecureLaunchConfirmerURL"; Flags: createvalueifdoesntexist

; Register in Default Programs
Root: HKLM; Subkey: "Software\RegisteredApplications"; ValueType: string; ValueName: "Secure Launch Confirmer"; ValueData: "Software\SecureLaunchConfirmer\Capabilities"; Flags: createvalueifdoesntexist

[Icons]
Name: "{group}\Secure Launch Confirmer"; Filename: "{app}\SecureLaunchConfirmer.App.exe"
Name: "{group}\{cm:UninstallProgram,Secure Launch Confirmer}"; Filename: "{uninstallexe}"

[Code]
function InitializeSetup(): Boolean;
begin
  // Request administrative privileges for the installer
  if not IsAdminLoggedOn then
  begin
    MsgBox('This installer requires administrative privileges. Please run as an administrator.', mbError, MB_OK);
    Result := False;
  end else
    Result := True;
end;
