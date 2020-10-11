unit uMisc;

interface

uses
  SysUtils, Graphics;

function BoolToInt(bState: boolean; iTrue, iFalse: integer): integer;
function BoolToColor(bState: boolean; clTrue, clFalse: TColor): TColor;
function BoolToStr(bState: boolean; sTrue, sFalse: string): string;
function ArrayToHexList(Arr: array of byte; ArrSize: Word): string;

implementation

function BoolToInt(bState: boolean; iTrue, iFalse: integer): integer;
begin
  if bState then
    result := iTrue
  else
    result := iFalse;
end;

function BoolToColor(bState: boolean; clTrue, clFalse: TColor): TColor;
begin
  if bState then
    result := clTrue
  else
    result := clFalse;
end;

function BoolToStr(bState: boolean; sTrue, sFalse: string): string;
begin
  if bState then
    result := sTrue
  else
    result := sFalse;
end;

function ArrayToHexList(Arr: array of byte; ArrSize: Word): string;
var
  iTmp: Word;
begin
  if ArrSize > 200 then
    ArrSize := 200;
  Result := '';
  for iTmp := 0 to ArrSize - 1 do
    Result := Result + Format('%2.2x ', [Arr[iTmp]]);
end;


end.
