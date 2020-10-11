program UsbHidTest;

uses
  Forms,
  frmMain in 'frmMain.pas' {fmMain},
  uUsb in 'uUsb.pas',
  uRes in 'uRes.pas',
  uMisc in 'uMisc.pas',
  frmAbout in 'frmAbout.pas' {fmAbout};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfmMain, fmMain);
  Application.Run;
end.
