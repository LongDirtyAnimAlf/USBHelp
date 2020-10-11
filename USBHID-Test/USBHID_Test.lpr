program USBHID_Test;

{$IFDEF LINUX}
  {$IFDEF FPC_CROSSCOMPILING}
    {$linklib libc_nonshared.a}
  {$ENDIF}
{$ENDIF}

{$define UseCThreads}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms,
  //runtimetypeinfocontrols,
  Main_unit
  //Apropos_unit
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource := True;
  Application.Initialize;
  Application.CreateForm(TMain_Form, Main_Form);
  Application.Run;
end.

