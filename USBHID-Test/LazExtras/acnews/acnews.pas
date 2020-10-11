{ This file was automatically created by Lazarus. Do not edit!
  This source is only used to compile and install the package.
 }

unit acnews;

{$warn 5023 off : no warning about unused units}
interface

uses
  Led, Switch, LazarusPackageIntf;

implementation

procedure Register;
begin
  RegisterUnit('Led', @Led.Register);
  RegisterUnit('Switch', @Switch.Register);
end;

initialization
  RegisterPackage('acnews', @Register);
end.
