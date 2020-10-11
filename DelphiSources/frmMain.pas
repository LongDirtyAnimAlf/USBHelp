unit frmMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ButtonGroup, StdCtrls, ComCtrls, JvComponentBase,
  JvHidControllerClass, ExtCtrls, rmSwitch, VrControls, VrLeds,
  VrCheckLed, ActnList, Menus, AdvEdit, advlued;

type

  THidReport = packed record
    ReportID: byte;
    Data: array [0 .. 64] of byte;
  end;

  TfmMain = class(TForm)
    lbHidDevices: TListBox;
    Label1: TLabel;
    btnHidEnum: TButton;
    lblDeviceState: TLabel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label17: TLabel;
    Label16: TLabel;
    Label15: TLabel;
    Label14: TLabel;
    Label13: TLabel;
    Label12: TLabel;
    Label11: TLabel;
    Label10: TLabel;
    lblVolts: TLabel;
    lblDataIn: TLabel;
    lblDataOut: TLabel;
    HidCtl1: TJvHidDeviceController;
    sw1: TVrCheckLed;
    VrLed1: TVrLed;
    VrLed2: TVrLed;
    VrLed3: TVrLed;
    VrLed4: TVrLed;
    VrLed5: TVrLed;
    VrLed6: TVrLed;
    VrLed7: TVrLed;
    VrLed8: TVrLed;
    sw2: TVrCheckLed;
    sw3: TVrCheckLed;
    sw4: TVrCheckLed;
    sw5: TVrCheckLed;
    sw6: TVrCheckLed;
    sw7: TVrCheckLed;
    sw8: TVrCheckLed;
    VrLed64: TVrLed;
    Label2: TLabel;
    MainMenu1: TMainMenu;
    ActionList1: TActionList;
    ActAppClose: TAction;
    ActAppReadme: TAction;
    ActAppAbout: TAction;
    ActAppHelpIndex: TAction;
    Fichier1: TMenuItem;
    Aide1: TMenuItem;
    Quitter1: TMenuItem;
    Indexdelaide1: TMenuItem;
    N1: TMenuItem;
    Lisezmoi1: TMenuItem;
    N2: TMenuItem;
    Apropos1: TMenuItem;
    sw64: TVrCheckLed;
    edSw1: TEdit;
    edSw2: TEdit;
    edSw3: TEdit;
    edSw4: TEdit;
    edSw5: TEdit;
    edSw6: TEdit;
    edSw7: TEdit;
    edSw8: TEdit;
    edSw64: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnHidEnumClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure HidCtl1Arrival(HidDev: TJvHidDevice);
    procedure HidCtl1DeviceChange(Sender: TObject);
    procedure HidCtl1DeviceData(HidDev: TJvHidDevice; ReportID: byte;
      const Data: Pointer; Size: Word);
    procedure HidCtl1DeviceUnplug(HidDev: TJvHidDevice);
    procedure HidCtl1DeviceDataError(HidDev: TJvHidDevice; Error: Cardinal);
    function HidCtl1Enumerate(HidDev: TJvHidDevice;
      const Idx: Integer): Boolean;
    procedure HidCtl1Removal(HidDev: TJvHidDevice);
    procedure sw1Click(Sender: TObject);
    procedure ActAppCloseExecute(Sender: TObject);
    procedure ActAppReadmeExecute(Sender: TObject);
    procedure ActAppAboutExecute(Sender: TObject);
    procedure sw7Change(Sender: TObject);
  protected
    {
    procedure HidData(HidDev: TJvHidDevice; ReportID: byte;
      const Data: Pointer; Size: Word);
    }
  private
    procedure Data_Read;
    procedure Data_Send;
    {
    procedure HidCtlDeviceArrival(HidDev: TJvHidDevice);
    procedure HidCtlDeviceRemoval(HidDev: TJvHidDevice);
    procedure HidCtlDeviceChange(Sender: TObject);
    function HidCtlEnumerate(HidDev: TJvHidDevice; const Idx: Integer): Boolean;
    procedure HidCtlDeviceData(HidDev: TJvHidDevice; ReportID: byte;
      const Data: Pointer; Size: Word);
    procedure HidCtlDeviceDataError(HidDev: TJvHidDevice; Error: Cardinal);
    procedure HidCtlDeviceUnplug(HidDev: TJvHidDevice);
    }
    procedure Device_Init;
    function  Hid_MyDevDetected(const cDev: TJvHidDevice): Boolean;
    procedure App_GuiRefresh;
    procedure Debug_DoTests;
    procedure App_ExecuteFile(sFile: string);
    procedure App_InitPath;
    { Déclarations privées }
  public
    { Déclarations publiques }
    // HidCtl: TJvHidDeviceController;  // created at design time (not runtime)
    MyHidDev: TJvHidDevice;
    procedure Hid_Reset(bPM: Boolean);
  end;

var
  fmMain: TfmMain;
  AppPath: string;
  AppIniFile: string;
  AppReadmeFile: string;
  AppHelpFile: string;
  //sOpenedFile: string;
  s: string;
  i: Integer;
  HidDataIn: THidReport;
  HidDataOut: THidReport;
  Written: DWord;

implementation

{$R *.dfm}

uses
  uRes, uMisc, uUsb,
  ESBPCSExe, ESBPCSConvert,
  frmAbout;

procedure TfmMain.App_InitPath;
begin
  AppPath := ExtractFilePath(Application.ExeName);
  AppIniFile := ChangeFileExt(Application.ExeName, '.ini');
  AppReadmeFile := AppPath + 'a_lire.txt';
  AppHelpFile := ChangeFileExt(Application.ExeName, '.hlp');
  //OpenDialog1.InitialDir := AppPath;
  //SaveDialog1.InitialDir := AppPath;
  //sOpenedFile := '';
end;

procedure TfmMain.App_ExecuteFile(sFile: string);
begin
  try
    if FileExists(sFile) then
      ESBPCSExe.ExeFile(sFile)
    {
    else
      showmessage(format('Fichier "%s" non localisé.', [sFile]))
    }
    ;
  except
  end;
end;

procedure TfmMain.Device_Init;
begin
  bHIDDevConnected := false;
  // MyHidDev := nil;
  HidDataIn.ReportID := 0;
  HidDataOut.ReportID := 0;
  for i := 0 to 63 do
  begin
    HidDataIn.Data[i] := $00;
    HidDataOut.Data[i] := $00;
  end;
  // MyHidDev.WriteFile(HidDataOut, MyHidDev.Caps.OutputReportByteLength, Written);
end;

procedure TfmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  // HidCtl.Free;
  MyHidDev := nil;
end;

procedure TfmMain.FormCreate(Sender: TObject);
begin
  App_InitPath;
  Device_Init;
  {
    HidCtl := TJvHidDeviceController.Create(self);
    try
    HidCtl.OnArrival:= HidCtlDeviceArrival;
    HidCtl.OnDeviceChange := HidCtlDeviceChange;
    HidCtl.OnDeviceData := HidCtlDeviceData;
    HidCtl.OnDeviceDataError := HidCtlDeviceDataError;
    HidCtl.OnDeviceUnplug := HidCtlDeviceUnplug;
    HidCtl.OnEnumerate := HidCtlEnumerate;
    HidCtl.OnRemoval:= HidCtlDeviceRemoval;
    except
    // handle exception if needed
    end;
    }
end;

procedure TfmMain.FormShow(Sender: TObject);
begin
  Hid_Reset(true);
  HidCtl1DeviceChange(Self);
  //Debug_DoTests;
end;

procedure TfmMain.Debug_DoTests();
var
  rVolts: double;
  sVolts: string;
begin
  bHidDevConnected := true;
  App_GuiRefresh;

  lbHidDevices.Items.Add(Format('%s - VID=%.4x, PID=%.4x, Size=%.4x, Ver=%.4x',
    ['Sonelec-musique Tests', Sonelec_VID, Sonelec_PID, $0C, 1]));

    // HidDataIn.ReportID := ReportId;
    // Move(Data^, HidDataIn.Data[0], Size);
    HidDataIn.Data[0] := $5C;
    HidDataIn.Data[1] := $00;
    HidDataIn.Data[2] := $FF;
    HidDataIn.Data[3] := $00;
    HidDataIn.Data[4] := $FF;
    HidDataIn.Data[5] := $FF;
    HidDataIn.Data[6] := $00;
    HidDataIn.Data[7] := $00;
    for i := 8 to 63 do
      HidDataIn.Data[i] := $00;
    // get digital values
    vrled1.Active := (HidDataIn.Data[0] > $7F);
    vrled2.Active := (HidDataIn.Data[1] > $7F);
    vrled3.Active := (HidDataIn.Data[2] > $7F);
    vrled4.Active := (HidDataIn.Data[3] > $7F);
    vrled5.Active := (HidDataIn.Data[4] > $7F);
    vrled6.Active := (HidDataIn.Data[5] > $7F);
    vrled7.Active := (HidDataIn.Data[6] > $7F);
    vrled8.Active := (HidDataIn.Data[7] > $7F);
    vrled64.Active := (HidDataIn.Data[63] > $7F);
    // refresh GUI - disable refresh during values updates would be better
    // for large amout of received data (frequently analog changes)
    // translate first byte to analog value ($00..$FF => 0..5 V)
    rVolts := HidDataIn.Data[0];
    rVolts := (5 * rVolts) / 256;
    sVolts := format('%1.2n V', [rVolts]);
    lblVolts.Caption := sVolts;
    // show all 64 received bytes values
    lblDataIn.Caption := Trim(ArrayToHexList(HidDataIn.Data, 64));
    sw1.Checked := true;
    sw4.Checked := true;
    sw5.Checked := true;
    sw64.Checked := true;
    edSw1.Text := 'AA';
    edSw4.Text := 'FF';
    edSw5.Text := 'FF';
    edSw64.Text := 'FF';
    lblDataOut.Caption := 'AA 00 00 FF FF 00 00 00';
    for i := 9 to 63 do
      lblDataOut.Caption := lblDataOut.Caption + ' 00';
    lblDataOut.Caption := lblDataOut.Caption + ' FF';
end;

procedure TfmMain.ActAppAboutExecute(Sender: TObject);
var
  frm: TfmAbout;
begin
  frm := TfmAbout.Create(Self);
  try
    frm.ShowModal;
  finally
    frm.Free;
  end;
end;

procedure TfmMain.ActAppCloseExecute(Sender: TObject);
begin
  close;
end;

procedure TfmMain.ActAppReadmeExecute(Sender: TObject);
begin
  App_ExecuteFile(AppReadmeFile);
end;

procedure TfmMain.App_GuiRefresh;
begin
  lblDeviceState.Color := BoolToColor(bHIDDevConnected, clLime, clRed);
  lblDeviceState.Caption := BoolToStr(bHIDDevConnected, sHIDDeviceFound,
    sHIDDeviceNotFound);
  sw1.Enabled := bHIDDevConnected;
  sw2.Enabled := bHIDDevConnected;
  sw3.Enabled := bHIDDevConnected;
  sw4.Enabled := bHIDDevConnected;
  sw5.Enabled := bHIDDevConnected;
  sw6.Enabled := bHIDDevConnected;
  sw7.Enabled := bHIDDevConnected;
  sw8.Enabled := bHIDDevConnected;
  sw64.Enabled := bHIDDevConnected;
  {
  led1.Standby := not bHIDDevConnected;
  led2.Standby := not bHIDDevConnected;
  led3.Standby := not bHIDDevConnected;
  led4.Standby := not bHIDDevConnected;
  led5.Standby := not bHIDDevConnected;
  led6.Standby := not bHIDDevConnected;
  led7.Standby := not bHIDDevConnected;
  led8.Standby := not bHIDDevConnected;
  led64.Standby := not bHIDDevConnected;
  }
  lblVolts.Enabled := bHIDDevConnected;
end;

procedure TfmMain.Hid_Reset(bPM: Boolean);
begin
  lbHidDevices.Items.Clear;
  lblDataIn.Caption := '<No data>';
  lblDataOut.Caption := '<No data>';
  if bPM then
    Application.ProcessMessages;
  HidCtl1.Enumerate;
  App_GuiRefresh;
end;

procedure TfmMain.HidCtl1Arrival(HidDev: TJvHidDevice);
begin
  if Hid_MyDevDetected(HidDev) then
  begin
    HidCtl1.CheckOutById(MyHidDev, Sonelec_VID, Sonelec_PID);
    MyHidDev := HidDev;
    HidDev.CheckOut;
    MyHidDev.OnData := HidCtl1DeviceData;  // HidData;
    {
    if HidDev.CheckOut then
    if MyHidDev.HasReadWriteAccess then
    begin
      MyHidDev.OnData := OnHidDeviceRead;
    end
    else
    begin
      MyHidDev.OnData := nil;
    end;
    }
  end;

  if (MyHidDev = nil) then
    HidCtl1.CheckOutById(MyHidDev, Sonelec_VID, Sonelec_PID);
  bHIDDevConnected := (MyHidDev <> nil);
  Hid_Reset(false);
  //App_GuiRefresh;

end;

procedure TfmMain.HidCtl1DeviceChange(Sender: TObject);
begin
  if (MyHidDev <> nil) and (not MyHidDev.IsPluggedIn) then
    HidCtl1.CheckIn(MyHidDev);
  if (MyHidDev = nil) then
    HidCtl1.CheckOutById(MyHidDev, Sonelec_VID, Sonelec_PID);
  //bHIDDevConnected := (MyHidDev <> nil);
  MyHidDev := nil;
  Hid_Reset(false);
end;

procedure TfmMain.Data_Read;
var
  rVolts: real;
  sVolts: string;
begin
  // HidDataIn.Data[0] := $37;
  HidDataIn.Data[0] := $00;
  HidDataIn.ReportID := 0;
  {
    MyHidDev.ReadFile(HidDataIn, MyHidDev.Caps.InputReportByteLength, Written);
    //HidCtl.ReadFile(HidDataIn, HidCtl.Caps.InputReportByteLength, Written));
    // HidCtl.ReadFile(HidDataIn, 64, Written));
    }

  rVolts := (5 * HidDataIn.Data[1]) / 256;
  sVolts := Format('%1.2d', [rVolts]);
  lblVolts.Caption := sVolts;
  {
  led1.Active := (HidDataIn.Data[1] > $7F);
  led2.Active := (HidDataIn.Data[2] > $7F);
  led3.Active := (HidDataIn.Data[3] > $7F);
  led4.Active := (HidDataIn.Data[4] > $7F);
  led5.Active := (HidDataIn.Data[5] > $7F);
  led6.Active := (HidDataIn.Data[6] > $7F);
  led7.Active := (HidDataIn.Data[7] > $7F);
  led8.Active := (HidDataIn.Data[8] > $7F);
  }
  vrled1.Active := (HidDataIn.Data[1] > $7F);
  vrled2.Active := (HidDataIn.Data[1] > $7F);
  vrled3.Active := (HidDataIn.Data[1] > $7F);
  vrled4.Active := (HidDataIn.Data[1] > $7F);
  vrled5.Active := (HidDataIn.Data[1] > $7F);
  vrled6.Active := (HidDataIn.Data[1] > $7F);
  vrled7.Active := (HidDataIn.Data[1] > $7F);
  vrled8.Active := (HidDataIn.Data[1] > $7F);
  {
  lblDataIn.Caption := Trim(ArrayToHexList(HidDataIn.Data, Size));
  }
end;

procedure TfmMain.HidCtl1DeviceData(HidDev: TJvHidDevice; ReportID: byte;
  const Data: Pointer; Size: Word);
var
  rVolts: double;
  sVolts: string;
begin
  if bHIDDevConnected then
  begin
    // HidDataIn.ReportID := ReportId;
    // Move(Data^, HidDataIn.Data[0], Size);
    for i := 0 to 63 do
      HidDataIn.Data[i] := PByte(Data)[i];
    // show all 64 received bytes values
    lblDataIn.Caption := Trim(ArrayToHexList(HidDataIn.Data, Size));
    // get digital values
    vrled1.Active := (HidDataIn.Data[0] > $7F);
    vrled2.Active := (HidDataIn.Data[1] > $7F);
    vrled3.Active := (HidDataIn.Data[2] > $7F);
    vrled4.Active := (HidDataIn.Data[3] > $7F);
    vrled5.Active := (HidDataIn.Data[4] > $7F);
    vrled6.Active := (HidDataIn.Data[5] > $7F);
    vrled7.Active := (HidDataIn.Data[6] > $7F);
    vrled8.Active := (HidDataIn.Data[7] > $7F);
    vrled64.Active := (HidDataIn.Data[63] > $7F);
    // translate first byte to analog value ($00..$FF => 0..5 V)
    rVolts := HidDataIn.Data[0];
    rVolts := (5 * rVolts) / 256;
    sVolts := Format('%1.2n V', [rVolts]);
    lblVolts.Caption := sVolts;
  end;
end;

{
procedure TfmMain.HidData(HidDev: TJvHidDevice; ReportID: byte;
  const Data: Pointer; Size: Word);
begin
  if bHIDDevConnected then
  begin
    for i := 0 to 63 do
      HidDataIn.Data[i] := PByte(Data)[i];
    lblDataIn.Caption := Trim(ArrayToHexList(HidDataIn.Data, Size));
    Data_Read;
  end;

  exit;

    for i := 0 to Size - 1 do
    begin
    HidDataIn.Data[i] := PByte(Data)[i];
    s := s + Format('%.2x ', [HidDataIn.Data[i]]);
    end;
    for i:= 0 to Size - 1 do
    s := s + Format('%.2x ', [Cardinal(PChar(Data)[i])]);
    // or
    lblDataIn.Caption := Format('%.1f C', [PByte(Data)[0]/16.0+PByte(Data)[1]*16.0]);
    // or
    lblDataIn.Caption := Format('%0.1f', [PSmallInt(Data)^/16.0]);
    // or
    lblDataIn.Caption := Format('Val1=%0.1f; Val2=%0.1f',
    [PSmallInt(Data)^/16.0,PSmallInt(pchar(Data)+2)^/16.0]);

end;
}

procedure TfmMain.HidCtl1DeviceDataError(HidDev: TJvHidDevice; Error: Cardinal);
begin
  s := 'HID Error: ' + HidDev.ProductName + ' ' + IntToStr(Error);
  lblDataIn.Caption := s;
end;

procedure TfmMain.HidCtl1DeviceUnplug(HidDev: TJvHidDevice);
begin
  if (Assigned(MyHidDev) and (not MyHidDev.IsPluggedIn)) then
  begin
    // MyHidDev := nil;
    // HidCtl.CheckIn(HidDev);
    HidCtl1.CheckIn(MyHidDev);
    bHIDDevConnected := false;
    App_GuiRefresh;
  end;
end;

function TfmMain.Hid_MyDevDetected(const cDev: TJvHidDevice): Boolean;
begin
  result := ((cDev.Attributes.VendorID = Sonelec_VID) and
      (cDev.Attributes.ProductID = Sonelec_PID) and (pos('sonelec',
        lowercase(cDev.ProductName)) > 0));
  //bHIDDevConnected := result;
  {
    showmessage(
    booltostr(result, sHIDDeviceFound, sHIDDeviceNotFound) + #13 +
    format('- ProductName read = %s', [cDev.ProductName]) + #13 +
    format('- VID waited = %.4x, VID read = %.4x', [Sonelec_VID, cDev.Attributes.VendorID]) + #13 +
    format('- PID waited = %.4x, PID read = %.4x', [Sonelec_PID, cDev.Attributes.ProductID])
    );
    }
end;

function TfmMain.HidCtl1Enumerate(HidDev: TJvHidDevice;
  const Idx: Integer): Boolean;
var
  sTmp: string;
begin
  sTmp := Format('%s - VID=%.4x, PID=%.4x, Size=%.4x, Ver=%.4x',
      [HidDev.ProductName, HidDev.Attributes.VendorID,
      HidDev.Attributes.ProductID, HidDev.Attributes.Size,
      HidDev.Attributes.VersionNumber]);
  if lbHidDevices.Items.IndexOf(sTmp) = -1 then
    lbHidDevices.Items.Add(sTmp);
  // if device enumerated is then one we search for, attach it to MyHidDev
  if Hid_MyDevDetected(HidDev) then
  begin
    // HidCtl.CheckOut(HidDev);
    //HidCtl1.CheckOut(HidDev);
    HidCtl1.CheckOutByIndex(MyHidDev, Idx);
    MyHidDev := HidDev;
    MyHidDev.CheckOut;
    bHIDDevConnected := (MyHidDev <> nil);
  end;
  App_GuiRefresh;
  result := true;
end;

procedure TfmMain.HidCtl1Removal(HidDev: TJvHidDevice);
begin
  if (Assigned(MyHidDev) and (not MyHidDev.IsPluggedIn)) then
  // if Hid_MyDevDetected(HidDev) then
  begin
    // MyHidDev := nil;
    // HidCtl.CheckIn(HidDev);
    HidCtl1.CheckIn(MyHidDev);
    // MyHidDev.Free;
    bHIDDevConnected := false;
    App_GuiRefresh;
  end;
end;

procedure TfmMain.btnHidEnumClick(Sender: TObject);
begin
  Hid_Reset(false);
end;

procedure TfmMain.Data_Send;
begin
  if not(bHIDDevConnected and (Assigned(MyHidDev))) then
    exit;

  // HidDataOut.ReportID := 0;
  HidDataOut.Data[0] := boolToInt(sw1.Checked, Hex2Int(edSw1.Text), $00);
  HidDataOut.Data[1] := boolToInt(sw2.Checked, Hex2Int(edSw2.Text), $00);
  HidDataOut.Data[2] := boolToInt(sw3.Checked, Hex2Int(edSw3.Text), $00);
  HidDataOut.Data[3] := boolToInt(sw4.Checked, Hex2Int(edSw4.Text), $00);
  HidDataOut.Data[4] := boolToInt(sw5.Checked, Hex2Int(edSw5.Text), $00);
  HidDataOut.Data[5] := boolToInt(sw6.Checked, Hex2Int(edSw6.Text), $00);
  HidDataOut.Data[6] := boolToInt(sw7.Checked, Hex2Int(edSw7.Text), $00);
  HidDataOut.Data[7] := boolToInt(sw8.Checked, Hex2Int(edSw8.Text), $00);
  HidDataOut.Data[63] := boolToInt(sw64.Checked, Hex2Int(edSw64.Text), $00);

  s := '';
  for i := 0 to 63 do
    s := s + Format('%.2x ', [HidDataOut.Data[i]]);
  lblDataOut.Caption := s;

  MyHidDev.WriteFile(HidDataOut, MyHidDev.Caps.OutputReportByteLength, Written);
end;

procedure TfmMain.sw1Click(Sender: TObject);
begin
  Data_Send; // apply to each buttons
end;

procedure TfmMain.sw7Change(Sender: TObject);
begin

end;

{
procedure TfmMain.HidCtlDeviceChange(Sender: TObject);
begin
  //
end;

function TfmMain.HidCtlEnumerate(HidDev: TJvHidDevice;
  const Idx: Integer): Boolean;
begin
  //
end;

procedure TfmMain.HidCtlDeviceData(HidDev: TJvHidDevice; ReportID: byte;
  const Data: Pointer; Size: Word);
begin
  //
end;

procedure TfmMain.HidCtlDeviceDataError(HidDev: TJvHidDevice; Error: Cardinal);
begin
  //
end;

procedure TfmMain.HidCtlDeviceArrival(HidDev: TJvHidDevice);
begin
  //
end;

procedure TfmMain.HidCtlDeviceUnplug(HidDev: TJvHidDevice);
begin
  //
end;

procedure TfmMain.HidCtlDeviceRemoval(HidDev: TJvHidDevice);
begin
  //
end;
}

end.
