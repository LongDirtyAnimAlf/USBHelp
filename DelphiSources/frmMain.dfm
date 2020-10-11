object fmMain: TfmMain
  Left = 0
  Top = 0
  Caption = 'USB-HID-Test'
  ClientHeight = 425
  ClientWidth = 617
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 13
    Width = 131
    Height = 13
    Caption = 'P'#233'riph'#233'riques HID d'#233'tect'#233's'
  end
  object lblDeviceState: TLabel
    Left = 311
    Top = 183
    Width = 290
    Height = 25
    Alignment = taCenter
    AutoSize = False
    Caption = 'Equipement USB "Sonelec / PIC18Fx550" non d'#233'tect'#233
    Color = clGray
    ParentColor = False
    Transparent = False
    Layout = tlCenter
  end
  object lbHidDevices: TListBox
    Left = 16
    Top = 32
    Width = 585
    Height = 145
    ItemHeight = 13
    TabOrder = 0
  end
  object btnHidEnum: TButton
    Left = 16
    Top = 183
    Width = 121
    Height = 25
    Caption = 'Forcer '#233'num'#233'ration'
    TabOrder = 1
    OnClick = btnHidEnumClick
  end
  object GroupBox1: TGroupBox
    Left = 311
    Top = 224
    Width = 290
    Height = 185
    Caption = 'PC -> PIC'
    TabOrder = 2
    object lblDataOut: TLabel
      Left = 16
      Top = 80
      Width = 257
      Height = 89
      AutoSize = False
      Caption = 'lblDataOut'
      Color = 16384
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clLime
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = False
      WordWrap = True
    end
    object Label4: TLabel
      Left = 213
      Top = 20
      Width = 33
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = '...'
      Layout = tlCenter
    end
    object sw1: TVrCheckLed
      Left = 16
      Top = 21
      Width = 25
      Height = 36
      CheckWidth = 19
      CheckHeight = 14
      Layout = ImageTop
      Margin = 1
      Palette.Low = clGreen
      Palette.High = clLime
      Caption = '1'
      TabOrder = 0
      OnClick = sw1Click
    end
    object sw2: TVrCheckLed
      Left = 40
      Top = 21
      Width = 25
      Height = 44
      CheckWidth = 19
      CheckHeight = 14
      Layout = ImageTop
      Margin = 1
      Palette.Low = clGreen
      Palette.High = clLime
      Caption = '2'
      TabOrder = 1
      OnClick = sw1Click
    end
    object sw3: TVrCheckLed
      Left = 64
      Top = 21
      Width = 25
      Height = 44
      CheckWidth = 19
      CheckHeight = 14
      Layout = ImageTop
      Margin = 1
      Palette.Low = clGreen
      Palette.High = clLime
      Caption = '3'
      TabOrder = 2
      OnClick = sw1Click
    end
    object sw4: TVrCheckLed
      Left = 88
      Top = 21
      Width = 25
      Height = 44
      CheckWidth = 19
      CheckHeight = 14
      Layout = ImageTop
      Margin = 1
      Palette.Low = clGreen
      Palette.High = clLime
      Caption = '4'
      TabOrder = 3
      OnClick = sw1Click
    end
    object sw5: TVrCheckLed
      Left = 112
      Top = 21
      Width = 25
      Height = 44
      CheckWidth = 19
      CheckHeight = 14
      Layout = ImageTop
      Margin = 1
      Palette.Low = clGreen
      Palette.High = clLime
      Caption = '5'
      TabOrder = 4
      OnClick = sw1Click
    end
    object sw6: TVrCheckLed
      Left = 136
      Top = 21
      Width = 25
      Height = 44
      CheckWidth = 19
      CheckHeight = 14
      Layout = ImageTop
      Margin = 1
      Palette.Low = clGreen
      Palette.High = clLime
      Caption = '6'
      TabOrder = 5
      OnClick = sw1Click
    end
    object sw7: TVrCheckLed
      Left = 160
      Top = 21
      Width = 25
      Height = 44
      CheckWidth = 19
      CheckHeight = 14
      Layout = ImageTop
      Margin = 1
      Palette.Low = clGreen
      Palette.High = clLime
      OnChange = sw7Change
      Caption = '7'
      TabOrder = 6
      OnClick = sw1Click
    end
    object sw8: TVrCheckLed
      Left = 184
      Top = 21
      Width = 25
      Height = 44
      CheckWidth = 19
      CheckHeight = 14
      Layout = ImageTop
      Margin = 1
      Palette.Low = clGreen
      Palette.High = clLime
      Caption = '8'
      TabOrder = 7
      OnClick = sw1Click
    end
    object sw64: TVrCheckLed
      Left = 248
      Top = 21
      Width = 25
      Height = 44
      CheckWidth = 19
      CheckHeight = 14
      Layout = ImageTop
      Margin = 1
      Palette.Low = clGreen
      Palette.High = clLime
      Caption = '64'
      TabOrder = 8
      OnClick = sw1Click
    end
    object edSw1: TEdit
      Left = 16
      Top = 58
      Width = 25
      Height = 19
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 9
      Text = 'FF'
    end
    object edSw2: TEdit
      Left = 40
      Top = 58
      Width = 25
      Height = 19
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 10
      Text = 'FF'
    end
    object edSw3: TEdit
      Left = 64
      Top = 58
      Width = 25
      Height = 19
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 11
      Text = 'FF'
    end
    object edSw4: TEdit
      Left = 88
      Top = 58
      Width = 25
      Height = 19
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 12
      Text = 'FF'
    end
    object edSw5: TEdit
      Left = 112
      Top = 58
      Width = 25
      Height = 19
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 13
      Text = 'FF'
    end
    object edSw6: TEdit
      Left = 136
      Top = 58
      Width = 25
      Height = 19
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 14
      Text = 'FF'
    end
    object edSw7: TEdit
      Left = 160
      Top = 58
      Width = 25
      Height = 19
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 15
      Text = 'FF'
    end
    object edSw8: TEdit
      Left = 184
      Top = 58
      Width = 25
      Height = 19
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 16
      Text = 'FF'
    end
    object edSw64: TEdit
      Left = 248
      Top = 58
      Width = 25
      Height = 19
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 17
      Text = 'FF'
    end
  end
  object GroupBox2: TGroupBox
    Left = 16
    Top = 224
    Width = 289
    Height = 185
    Caption = 'PIC -> PC'
    TabOrder = 3
    object Label17: TLabel
      Left = 184
      Top = 43
      Width = 19
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = '8'
    end
    object Label16: TLabel
      Left = 160
      Top = 43
      Width = 19
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = '7'
    end
    object Label15: TLabel
      Left = 136
      Top = 43
      Width = 19
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = '6'
    end
    object Label14: TLabel
      Left = 112
      Top = 43
      Width = 19
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = '5'
    end
    object Label13: TLabel
      Left = 88
      Top = 43
      Width = 19
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = '4'
    end
    object Label12: TLabel
      Left = 64
      Top = 43
      Width = 19
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = '3'
    end
    object Label11: TLabel
      Left = 40
      Top = 43
      Width = 19
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = '2'
    end
    object Label10: TLabel
      Left = 16
      Top = 43
      Width = 19
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = '1'
    end
    object lblVolts: TLabel
      Left = 15
      Top = 58
      Width = 43
      Height = 21
      Alignment = taCenter
      AutoSize = False
      Caption = '-,-- V'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clAqua
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = False
      Layout = tlCenter
    end
    object lblDataIn: TLabel
      Left = 15
      Top = 81
      Width = 257
      Height = 88
      AutoSize = False
      Caption = 'lblDataIn'
      Color = 16384
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clLime
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = False
      WordWrap = True
    end
    object VrLed1: TVrLed
      Left = 16
      Top = 25
      Width = 19
      Height = 9
      Palette.Low = 64
      Palette.High = clRed
      LedType = ltLargeRect
      Spacing = 1
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object VrLed2: TVrLed
      Left = 40
      Top = 25
      Width = 19
      Height = 9
      Palette.Low = 64
      Palette.High = clRed
      LedType = ltLargeRect
      Spacing = 1
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object VrLed3: TVrLed
      Left = 64
      Top = 25
      Width = 19
      Height = 9
      Palette.Low = 64
      Palette.High = clRed
      LedType = ltLargeRect
      Spacing = 1
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object VrLed4: TVrLed
      Left = 88
      Top = 25
      Width = 19
      Height = 9
      Palette.Low = 64
      Palette.High = clRed
      LedType = ltLargeRect
      Spacing = 1
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object VrLed5: TVrLed
      Left = 112
      Top = 25
      Width = 19
      Height = 9
      Palette.Low = 64
      Palette.High = clRed
      LedType = ltLargeRect
      Spacing = 1
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object VrLed6: TVrLed
      Left = 136
      Top = 25
      Width = 19
      Height = 9
      Palette.Low = 64
      Palette.High = clRed
      LedType = ltLargeRect
      Spacing = 1
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object VrLed7: TVrLed
      Left = 160
      Top = 25
      Width = 19
      Height = 9
      Palette.Low = 64
      Palette.High = clRed
      LedType = ltLargeRect
      Spacing = 1
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object VrLed8: TVrLed
      Left = 184
      Top = 25
      Width = 19
      Height = 9
      Palette.Low = 64
      Palette.High = clRed
      LedType = ltLargeRect
      Spacing = 1
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object VrLed64: TVrLed
      Left = 248
      Top = 25
      Width = 19
      Height = 9
      Palette.Low = 64
      Palette.High = clRed
      LedType = ltLargeRect
      Spacing = 1
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label2: TLabel
      Left = 248
      Top = 43
      Width = 19
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = '64'
    end
    object Label3: TLabel
      Left = 209
      Top = 20
      Width = 33
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = '...'
      Layout = tlCenter
    end
  end
  object HidCtl1: TJvHidDeviceController
    OnArrival = HidCtl1Arrival
    OnEnumerate = HidCtl1Enumerate
    OnDeviceChange = HidCtl1DeviceChange
    OnDeviceData = HidCtl1DeviceData
    OnDeviceDataError = HidCtl1DeviceDataError
    OnDeviceUnplug = HidCtl1DeviceUnplug
    OnRemoval = HidCtl1Removal
    Left = 440
    Top = 64
  end
  object MainMenu1: TMainMenu
    Left = 88
    Top = 56
    object Fichier1: TMenuItem
      Caption = 'Fichier'
      object Quitter1: TMenuItem
        Action = ActAppClose
      end
    end
    object Aide1: TMenuItem
      Caption = 'Aide'
      object Indexdelaide1: TMenuItem
        Action = ActAppHelpIndex
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Lisezmoi1: TMenuItem
        Action = ActAppReadme
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object Apropos1: TMenuItem
        Action = ActAppAbout
      end
    end
  end
  object ActionList1: TActionList
    Left = 160
    Top = 56
    object ActAppClose: TAction
      Caption = 'Quitter'
      Hint = 'Quitter'
      OnExecute = ActAppCloseExecute
    end
    object ActAppReadme: TAction
      Caption = 'Lisez-moi'
      Hint = 'Lisez-moi'
      OnExecute = ActAppReadmeExecute
    end
    object ActAppAbout: TAction
      Caption = 'A propos...'
      Hint = 'A propos...'
      OnExecute = ActAppAboutExecute
    end
    object ActAppHelpIndex: TAction
      Caption = 'Index de l'#39'aide'
      Hint = 'Index de l'#39'aide'
    end
  end
end
