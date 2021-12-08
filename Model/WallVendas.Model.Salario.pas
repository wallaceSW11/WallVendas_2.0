unit WallVendas.Model.Salario;

interface

uses
  System.Generics.Collections,
  WallVendas.Model.Despesas;

type
  TSalario = class
  private
    FSalarioDesejado: Currency;
    FTotalDeDiasTrabalhadosNaSemana: Integer;
    FTotalDeHorasPorDia: Double;
    FDespesas: Currency;
    FQuantidadeDeSemanasPorMes: Integer;
    procedure SetDespesas(const Value: Currency);
    procedure SetSalarioDesejado(const Value: Currency);
    procedure SetTotalDeDiasTrabalhadosNaSemana(const Value: Integer);
    procedure SetTotalDeHorasPorDia(const Value: Double);
    procedure SetQuantidadeDeSemanasPorMes(const Value: Integer);
  public
    property SalarioDesejado: Currency read FSalarioDesejado write SetSalarioDesejado;
    property TotalDeHorasPorDia: Double read FTotalDeHorasPorDia write SetTotalDeHorasPorDia;
    property TotalDeDiasTrabalhadosNaSemana: Integer read FTotalDeDiasTrabalhadosNaSemana write SetTotalDeDiasTrabalhadosNaSemana;
    property QuantidadeDeSemanasPorMes: Integer read FQuantidadeDeSemanasPorMes write SetQuantidadeDeSemanasPorMes;
    property Despesas: Currency read FDespesas write SetDespesas;

    function ValorDoSalarioPorMinuto: Currency;
    function ValorDoSalarioPorHora: Currency;
    function TotalDeHorasTrabalhadasPorSemana: Double;
    function TotalDeHorasTrabalhadasPorMes: Double;
    function TotalSalarioComDespesas: Currency;
  end;

implementation

{ TSalario }

procedure TSalario.SetDespesas(const Value: Currency);
begin
  FDespesas := Value;
end;

procedure TSalario.SetQuantidadeDeSemanasPorMes(const Value: Integer);
begin
  FQuantidadeDeSemanasPorMes := Value;
end;

procedure TSalario.SetSalarioDesejado(const Value: Currency);
begin
  FSalarioDesejado := Value;
end;

procedure TSalario.SetTotalDeDiasTrabalhadosNaSemana(const Value: Integer);
begin
  FTotalDeDiasTrabalhadosNaSemana := Value;
end;

procedure TSalario.SetTotalDeHorasPorDia(const Value: Double);
begin
  FTotalDeHorasPorDia := Value;
end;

function TSalario.TotalDeHorasTrabalhadasPorMes: Double;
begin
//  edtTotalHorasPorSemana.Text := IntToStr(edtTotalHorasPorDia.ToInteger * edtTotalDiasSemana.ToInteger);
//  edtTotalHorasMes.Text := IntToStr(edtTotalHorasPorSemana.ToInteger * 4);
//
//  edtVlSalarioSomandoDespesas.Text := Double(edtVlSalario.ToCurrency + edtVlTotalDespesas.ToCurrency).ValorMonetario;
//
//  if ((edtVlSalarioSomandoDespesas.ToCurrency >= 0.01) and (edtTotalHorasMes.ToInteger >= 0.01)) then
//    edtVlCustoPorHora.Text := Double(edtVlSalarioSomandoDespesas.ToCurrency / edtTotalHorasMes.ToInteger).ValorMonetario
//  else
//    edtVlCustoPorHora.ZeradoComVirgula;
//
//  if (edtVlCustoPorHora.ToCurrency >= 0.01) then
//    edtVlCustoPorMinuto.Text := Double(edtVlCustoPorHora.ToCurrency / 60).ValorMonetario
//  else
//    edtVlCustoPorMinuto.ZeradoComVirgula;

  Result := TotalDeHorasTrabalhadasPorSemana * QuantidadeDeSemanasPorMes;

end;

function TSalario.TotalDeHorasTrabalhadasPorSemana: Double;
begin
  Result := TotalDeHorasPorDia * TotalDeDiasTrabalhadosNaSemana;
end;

function TSalario.TotalSalarioComDespesas: Currency;
begin
  Result := SalarioDesejado + Despesas;
end;

function TSalario.ValorDoSalarioPorHora: Currency;
begin
//  if ((edtVlSalarioSomandoDespesas.ToCurrency >= 0.01) and (edtTotalHorasMes.ToInteger >= 0.01)) then
//    edtVlCustoPorHora.Text := Double(edtVlSalarioSomandoDespesas.ToCurrency / edtTotalHorasMes.ToInteger).ValorMonetario
//  else
//    edtVlCustoPorHora.ZeradoComVirgula;

  if ((TotalSalarioComDespesas >= 0.01) and (TotalDeHorasTrabalhadasPorMes >= 0.01)) then
    Exit(TotalSalarioComDespesas / TotalDeHorasTrabalhadasPorMes);

  Result := 0;

end;

function TSalario.ValorDoSalarioPorMinuto: Currency;
begin
//  if (edtVlCustoPorHora.ToCurrency >= 0.01) then
//    edtVlCustoPorMinuto.Text := Double(edtVlCustoPorHora.ToCurrency / 60).ValorMonetario
//  else
//    edtVlCustoPorMinuto.ZeradoComVirgula;

  if (ValorDoSalarioPorHora >= 0.01) then
    Exit(ValorDoSalarioPorHora / 60);

  Result := 0;
end;

end.
