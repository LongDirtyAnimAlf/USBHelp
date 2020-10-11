unit uUsb;

interface

Uses
  JvHidControllerClass,
  Classes;

Type
  THidSonelec = class(TObject)
  private
    ToWrite: Cardinal;
    StatusVal : Integer;
    HidCtl : TJvHidDeviceController;
    oHidSonelec: TJvHidDevice;
    procedure SetStatusVal(iVal: Integer);
    procedure HidCtlDeviceData(HidDev: TJvHidDevice; ReportID: Byte; const Data: Pointer; Size: Word);
  Public
    Constructor Create;
  end;

const
  BufferInSize  = 64;
  BufferOutSize = 64;
  Sonelec_VID = $1234;
  Sonelec_PID = $0001;

var
  bHIDDevConnected: boolean;

implementation

Uses
  Math, SysUtils;

constructor THidSonelec.Create;
begin
  HidCtl := TJvHidDeviceController.Create(nil);
  HidCtl.DevThreadSleepTime := 10;
  HidCtl.OnDeviceData := HidCtlDeviceData;
  HidCtl.CheckOutByID(oHidSonelec, Sonelec_VID, Sonelec_PID);
  ToWrite := oHidSonelec.Caps.OutputReportByteLength;
end;

// Process data received from HidSonelec
procedure THidSonelec.HidCtlDeviceData(HidDev: TJvHidDevice;
  ReportID: Byte; const Data: Pointer; Size: Word);
var
  sVal: string;
  iData: integer;
begin
  sVal := IntToHex(Cardinal(PChar(Data)[0]), 2);
  sVal := sVal + IntToHex(Cardinal(PChar(Data)[1]), 2);
  sVal := sVal + IntToHex(Cardinal(PChar(Data)[2]), 2);
  sVal := sVal + IntToHex(Cardinal(PChar(Data)[3]), 2);
  iData := StrToIntDef('$' + sVal, 0);
  if iData = $01 then
  begin
    // Handle Data here
  end;
end;

procedure THidSonelec.SetStatusVal(iVal: integer);
var
  Buf: array [0..64] of Byte;
  sVal: string;
  Written: Cardinal;
begin
  if Assigned(oHidSonelec) then
  begin
    sVal := IntToHex(iVal, 6);
    Buf[0] := 1;
    Buf[1] := StrToIntDef('$' + copy(sVal, 1, 2), 0);
    Buf[2] := StrToIntDef('$' + copy(sVal, 3, 2), 0);
    Buf[3] := StrToIntDef('$' + copy(sVal, 5, 2), 0);
    oHidSonelec.WriteFile(Buf, ToWrite, Written);
  end;
end;

end.
