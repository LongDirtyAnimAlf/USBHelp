unit Main_unit;


interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, ActnList,
  StdCtrls, ComCtrls, Led, Switch,
  //Gestion de l'USB en mode HID
  usb2;


type

  { TMain_Form }

  TMain_Form = class(TForm)
    Data_Send: TAction;
    AppAboutExecute_Action: TAction;
    AppClose_Action: TAction;
    ActionList: TActionList;
    HID_Memo: TMemo;
    Out1_Switch: TSwitch;
    Out2_Switch: TSwitch;
    Out3_Switch: TSwitch;
    Out4_Switch: TSwitch;
    Out5_Switch: TSwitch;
    Out6_Switch: TSwitch;
    Out7_Switch: TSwitch;
    Out8_Switch: TSwitch;
    Out64_Switch: TSwitch;
    Out1_Label: TLabel;
    Out2_Label: TLabel;
    Out3_Label: TLabel;
    Out4_Label: TLabel;
    Out5_Label: TLabel;
    Out6_Label: TLabel;
    Out7_Label: TLabel;
    Out8_Label: TLabel;
    Out64_Label: TLabel;
    SW1_Edit: TEdit;
    SW2_Edit: TEdit;
    SW3_Edit: TEdit;
    SW4_Edit: TEdit;
    SW5_Edit: TEdit;
    SW6_Edit: TEdit;
    SW7_Edit: TEdit;
    SW8_Edit: TEdit;
    SW64_Edit: TEdit;
    In1_Led: TLed;
    In2_Led: TLed;
    In3_Led: TLed;
    In4_Led: TLed;
    In5_Led: TLed;
    In6_Led: TLed;
    In7_Led: TLed;
    In8_Led: TLed;
    In64_Led: TLed;
    In1_Label: TLabel;
    In2_Label: TLabel;
    In3_Label: TLabel;
    In4_Label: TLabel;
    In5_Label: TLabel;
    In6_Label: TLabel;
    In7_Label: TLabel;
    In8_Label: TLabel;
    In64_Label: TLabel;
    Separateur1_Label: TLabel;
    Tension_Label: TLabel;
    Enumeration_Button: TButton;
    DataInput_Label: TLabel;
    DataOutput_Label: TLabel;
    Fichier: TMenuItem;
    Aide: TMenuItem;
    Detection_Label: TLabel;
    StatusBar1: TStatusBar;
    Top_Label: TLabel;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    Quitter: TMenuItem;
    PC2PIC_GroupBox: TGroupBox;
    PIC2PC_GroupBox: TGroupBox;
    MainMenu: TMainMenu;
    procedure AppAboutExecute_OnClick(Sender: TObject);
    procedure AppClose_OnExecute(Sender: TObject);
    procedure EmunerationOnClick(Sender: TObject);
    procedure MainFormOnCreate(Sender: TObject);
    procedure MainForm_OnDestroy(Sender: TObject);
    procedure MainForm_OnShow(Sender: TObject);
  private
    { private declarations }
    NewUSB:TUSB;
    procedure UpdateUSBDevice(Sender: TObject;datacarrier:integer);
    procedure DataRead;
    procedure DataSend;
  public
    { public declarations }
    procedure Hid_Reset(bPM: Boolean);

  end;

var
  Main_Form: TMain_Form;

implementation

{$R *.lfm}

//uses
  //Apropos_unit;


{ TMain_Form }


procedure TMain_Form.MainFormOnCreate(Sender: TObject);
 begin
   //
 end;



procedure TMain_Form.MainForm_OnShow(Sender: TObject);
 var
   S:string;
 begin
   Hid_Reset(true);
   HID_Memo.Lines.Append('HID Created.');
   NewUSB:=TUSB.Create;
   NewUSB.OnUSBDeviceChange:=UpdateUSBDevice;
   HID_Memo.Lines.Append('Ready.');
   S:=NewUSB.Info;
   if Length(S)>0 then
     begin
       HID_Memo.Lines.Append('INFO:');
       HID_Memo.Lines.Append(S);
     end;
   S:=NewUSB.Errors;
   if Length(S)>0 then
     begin
       HID_Memo.Lines.Append('ERRORS:');
       HID_Memo.Lines.Append(S);
    end;
 end;





procedure TMain_Form.UpdateUSBDevice(Sender: TObject;datacarrier:integer);
var
  S:string;
begin
  //
end;

procedure TMain_Form.AppAboutExecute_OnClick(Sender: TObject);
begin
  //
end;

procedure TMain_Form.AppClose_OnExecute(Sender: TObject);
  begin
    Close;
  end;

procedure TMain_Form.EmunerationOnClick(Sender: TObject);
  var
    S:string;
  begin
    S:=NewUSB.Info;
      if Length(S)>0 then
        begin
          HID_Memo.Lines.Append('INFO:');
          HID_Memo.Lines.Append(S);
        end
      else
          HID_Memo.Lines.Append('No new USB info.');
end;

procedure TMain_Form.MainForm_OnDestroy(Sender: TObject);
  begin
    if Assigned(NewUSB) then
      begin
       NewUSB.Destroy;
    end;
  end;



procedure TMain_Form.DataRead;
  begin
    //
  end;

procedure TMain_Form.DataSend;
  begin
    //
  end;



procedure TMain_Form.Hid_Reset(bPM: Boolean);
  begin
    HID_Memo.Lines.Clear;
    DataInput_Label.Caption := '<No data>';
    DataOutput_Label.Caption := '<No data>';

  end;

end.

