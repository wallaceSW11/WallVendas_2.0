unit WallVendas.Helper.Numbers;

interface

uses
  System.SysUtils;

type
  TDoubleHelper = record helper for double
    function ValorMonetario: string;
    function ValorMonetarioCifrao(): String;
    function VlMonetario: string;
    function ToString: string;
    function VirgulaPorPonto(): string;
  end;

  TCurrencyHelper = record helper for Currency
    function ValorMonetario(): string;
    function ValorMonetarioCifrao(): string;
  end;

implementation

{ TDoubleHelper }

function TDoubleHelper.ValorMonetario: string;
begin
  result := FormatFloat('#,##0.00', Self);
end;

function TDoubleHelper.ValorMonetarioCifrao: String;
begin
  result := FormatFloat('R$ #,##0.00', Self);
end;

function TDoubleHelper.VirgulaPorPonto: string;
begin
  Result := FloatToStr(Self).Replace('.', '').Replace(',', '.');
end;

function TDoubleHelper.VlMonetario: string;
begin
  result := StringReplace(FloatToStr(Self), ',','.', [rfReplaceAll, rfIgnoreCase]);
end;


function TDoubleHelper.ToString: string;
begin
  result := floattostr(self);
end;

{ TCurrencyHelper }

function TCurrencyHelper.ValorMonetario: string;
begin
  Result := FormatFloat('#,##0.00', Self);
end;

function TCurrencyHelper.ValorMonetarioCifrao: string;
begin
  Result := FormatFloat('R$ #,##0.00', Self);
end;

end.
