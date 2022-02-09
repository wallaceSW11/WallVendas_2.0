unit WallVendas.Model.Salario;

interface

uses
  System.Generics.Collections,
  WallVendas.Model.Despesas,
  WallVendas.Model.Base,
  SimpleAttributes;

type
  [Tabela('Salario')]
  TSalario = class (TModeloBase)
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
    [Campo('VlSalario')]
    property SalarioDesejado: Currency read FSalarioDesejado write SetSalarioDesejado;
    [Campo('TotalHorasPorDia')]
    property TotalDeHorasPorDia: Double read FTotalDeHorasPorDia write SetTotalDeHorasPorDia;
    [Campo('TotalDiasSemana')]
    property TotalDeDiasTrabalhadosNaSemana: Integer read FTotalDeDiasTrabalhadosNaSemana write SetTotalDeDiasTrabalhadosNaSemana;
    [Campo('QtSemanasMes')]
    property QuantidadeDeSemanasPorMes: Integer read FQuantidadeDeSemanasPorMes write SetQuantidadeDeSemanasPorMes;
    [Campo('VlTotalDespesas')]
    property Despesas: Currency read FDespesas write SetDespesas;

    constructor Create();
    destructor Destroy; override;
    function ValorDoSalarioPorMinuto: Currency;
    function ValorDoSalarioPorHora: Currency;
    function TotalDeHorasTrabalhadasPorSemana: Double;
    function TotalDeHorasTrabalhadasPorMes: Double;
    function TotalSalarioComDespesas: Currency;
  end;

implementation

{ TSalario }

constructor TSalario.Create;
begin

end;

destructor TSalario.Destroy;
begin

  inherited;
end;

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
  Result := TotalDeHorasTrabalhadasPorSemana() * QuantidadeDeSemanasPorMes;
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
  if ((TotalSalarioComDespesas >= 0.01) and (TotalDeHorasTrabalhadasPorMes >= 0.01)) then
    Exit(TotalSalarioComDespesas / TotalDeHorasTrabalhadasPorMes);

  Result := 0;
end;

function TSalario.ValorDoSalarioPorMinuto: Currency;
begin
  if (ValorDoSalarioPorHora >= 0.01) then
    Exit(ValorDoSalarioPorHora / 60);

  Result := 0;
end;

end.
