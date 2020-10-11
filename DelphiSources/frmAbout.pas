unit frmAbout;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, JvExControls, JvScrollText, rtflabel,
  ExeInfo, Shader, VrControls, VrGradient;

type
  TfmAbout = class(TForm)
    btnOK: TButton;
    lblThanks: TLabel;
    ProgramIcon: TImage;
    Bevel2: TBevel;
    Image1: TImage;
    Version: TLabel;
    Image2: TImage;
    Copyright: TLabel;
    Image3: TImage;
    Comments: TLabel;
    Bevel1: TBevel;
    Label2: TLabel;
    lblInitStatus: TLabel;
    JvScrollText1: TJvScrollText;
    RTFLabel1: TRTFLabel;
    ExeInfo1: TExeInfo;
    lblVersion: TLabel;
    lblCopyright: TLabel;
    lblComments: TLabel;
    VrGradient1: TVrGradient;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmAbout: TfmAbout;

implementation

{$R *.DFM}

procedure TfmAbout.FormCreate(Sender: TObject);
begin
  JvScrollText1.active := true;
  ProgramIcon.Picture.Icon := application.Icon;
  lblVersion.Caption := ExeInfo1.FileVersion;
  lblCopyright.Caption := ExeInfo1.LegalCopyright;
  lblComments.Caption := ExeInfo1.Comments;
end;

procedure TfmAbout.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  JvScrollText1.active := false;
end;

end.

