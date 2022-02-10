unit WallVendas.Helper.TEdit;

interface

uses
  SysUtils, vcl.stdCtrls;

type
  TEditHelper = class helper for TEdit
  private
    const
      MASCARA_VALOR_MONETARIO = '#,##0.00';
      MASCARA_VALOR_MONETARIO_CIFRAO = 'R$ #,##0.00';
  public
    function ToCurrency(): Currency;
    function ToFloat(): Double;
    function ToInteger(): Integer;
    procedure Focar();
    function IsEmpty():Boolean;
  end;

implementation

function TEditHelper.ToCurrency(): Currency;
var
  lTexto: string;
begin
  FormatSettings.DecimalSeparator := ',';
  lTexto := StringReplace(Self.Text, '.', EmptyStr, [rfReplaceAll]);
  Result := StrToCurrDef(lTexto, 0);
end;

function TEditHelper.ToFloat(): Double;
begin
  FormatSettings.DecimalSeparator := ',';
  Result := StrToFloat(FormatFloat(MASCARA_VALOR_MONETARIO, StrToFloatDef(string(Self.Text).Replace('.', ''), 0)));
end;

function TEditHelper.ToInteger(): Integer;
begin
  Result := StrToIntDef(Self.Text, 0);
end;

procedure TEditHelper.Focar();
begin
  if (Self.CanFocus) then
  begin
    Self.SetFocus;
    Self.SelectAll;
  end;
end;

function TEditHelper.IsEmpty():Boolean;
begin
  Result := Trim(Self.Text).IsEmpty();
end;

end.
