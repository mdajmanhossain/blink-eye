#define MyAppName "Blink Eye"
#define MyAppVersion "1.4"
#define MyAppPublisher "Noman Dhoni"
#define MyAppURL "https://blinkeye.vercel.app/"
#define MyAppExeName "BlinkEye.exe"

[Setup]
; NOTE: The value of AppId uniquely identifies this application. Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{63B54945-8F59-4E5A-A170-A446A28BF68A}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={autopf}\{#MyAppName}
DisableProgramGroupPage=yes
LicenseFile=C:\Users\Abdullah\Desktop\blink-eye\LICENSE.txt
; Uncomment the following line to run in non administrative install mode (install for current user only.)
;PrivilegesRequired=lowest
OutputDir=C:\Users\Abdullah\Desktop\New folder
OutputBaseFilename=Blink_Eye_Windows_64_V1.4
SetupIconFile=C:\Users\Abdullah\Desktop\blink-eye\blink-eye-logo.ico
Compression=lzma
SolidCompression=yes
WizardStyle=modern
UninstallDisplayIcon={app}\blink-eye-logo.ico
VersionInfoVersion={#MyAppVersion}
VersionInfoCompany={#MyAppPublisher}
SetupLogging=yes

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked
Name: "autostarticon"; Description: "{cm:AutoStartProgram,{#MyAppName}}"; GroupDescription: "{cm:AdditionalIcons}";

[Files]
Source: "C:\Users\Abdullah\Desktop\blink-eye\dist\{#MyAppExeName}"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\Abdullah\Desktop\blink-eye\blink-eye-logo.ico"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\Abdullah\Desktop\blink-eye\blink-eye-logo.png"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\Abdullah\Desktop\blink-eye\blink-eye-reminder-btn.png"; DestDir: "{app}"; Flags: ignoreversion
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{autoprograms}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{autodesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon
Name: "{commonstartup}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Parameters: "/auto"; Tasks: autostarticon

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent

[UninstallRun]
Filename: "{win}\explorer.exe"; Parameters: "https://blinkeye.vercel.app/goodbye"; Flags: shellexec; RunOnceId: "OpenUninstallFeedback"

