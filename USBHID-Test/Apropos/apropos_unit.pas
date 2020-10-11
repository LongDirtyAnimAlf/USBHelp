unit Apropos_unit;

//{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Buttons, ATPanelColor, JvGammaPanel, JvGradient;

type

  { TApropos_Form }

  TApropos_Form = class(TForm)
    OK_BitBtn: TBitBtn;
    Image1: TImage;
    Label1: TLabel;
    Version_Image: TImage;
    Copyright_Image: TImage;
    Commentaires_Image: TImage;
    Top_Bevel: TBevel;
    JvGradient1: TJvGradient;
    Bottom_Bevel: TBevel;
    Version_Label: TLabel;
    Version_Label1: TLabel;
    Copyright_Label: TLabel;
    lblCopyright_Label: TLabel;
    Commentaires_Label: TLabel;
    lblCommentaires_Label: TLabel;
  private

  public

  end;

var
  Apropos_Form: TApropos_Form;

implementation

{$R *.lfm}

end.

