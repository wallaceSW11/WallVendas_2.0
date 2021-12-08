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
  end;




implementation

function TEditHelper.ToCurrency(): Currency;
var
  lTexto: string;
begin
  FormatSettings.DecimalSeparator := ',';
  lTexto := string(Self.Text).Replace('.', EmptyStr);
  Result := StrToCurr(lTexto);
end;

function TEditHelper.ToFloat(): Double;
begin
  Result := StrToFloat(FormatFloat(MASCARA_VALOR_MONETARIO, StrToFloatDef(Self.Text, 0)));
end;

function TEditHelper.ToInteger(): Integer;
begin
  Result := StrToIntDef(Self.Text, 0);
end;

end.
