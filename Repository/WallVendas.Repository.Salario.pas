unit WallVendas.Repository.Salario;

interface

uses
  WallVendas.Repository.Interfaces,
  WallVendas.Model.Salario,
  WallVendas.Context.Query,
  data.DB,
  System.SysUtils,
  WallVendas.Helper.Numbers; // retirar esse cara

type
  TRepositorySalario = class(TInterfacedObject, IRepositorySalario)
  private
    FSalario: TSalario;
    FQuery: IQuery;
    constructor Create();
  public
    class function NovaInstancia(): IRepositorySalario;

    function ObterSalario(): TSalario;
    procedure AtualizarSalario(pSalario: TSalario);
  end;

implementation

{ TRepositorySalario }

procedure TRepositorySalario.AtualizarSalario(pSalario: TSalario);
const
  UPDATE_SALARIO =
                   'UPDATE'
    + sLineBreak + '  Salario'
    + sLineBreak + 'SET'
    + sLineBreak + '  VlSalario = ''%s'','
    + sLineBreak + '  TotalHorasPorDia = ''%s'','
    + sLineBreak + '  TotalDiasSemana = ''%s'','
    + sLineBreak + '  TotalHorasPorSemana = ''%s''';
//    + sLineBreak + '  TotalHorasMes = ''TotalHorasMes'','
//    + sLineBreak + '  VlCustoPorHora = ''VlCustoPorHora'','
//    + sLineBreak + '  VlCustoPorMinuto = ''VlCustoPorMinuto'','
//    + sLineBreak + '  VlTotalDespesas = ''VlTotalDespesas''';
var
  lDataSet: TDataSet;
begin
  FormatSettings.DecimalSeparator := ',';

  FQuery.ExecSQL(
    Format(UPDATE_SALARIO, [
      pSalario.SalarioDesejado.ValorMonetario,
      pSalario.TotalDeHorasPorDia.ToString,
      pSalario.TotalDeDiasTrabalhadosNaSemana.ToString,
      pSalario.TotalDeHorasTrabalhadasPorSemana.ToString]));


//    FSalario.Despesas := lDataSet.FieldByName('VlTotalDespesas').AsCurrency;
//    FSalario.QuantidadeDeSemanasPorMes := 4;
end;

constructor TRepositorySalario.Create();
begin
  FSalario := TSalario.Create();
  FQuery := TQuery.NovaInstancia();
end;

class function TRepositorySalario.NovaInstancia(): IRepositorySalario;
begin
  Result := Self.Create();
end;

function TRepositorySalario.ObterSalario(): TSalario;
const
  CONSULTA_SALARIO = 'Select * From Salario';
var
  lDataSet: TDataSet;
begin
  lDataSet := FQuery.OpenQuery(CONSULTA_SALARIO);

  FSalario.SalarioDesejado := lDataSet.FieldByName('VlSalario').AsCurrency;
  FSalario.TotalDeHorasPorDia := lDataSet.FieldByName('TotalHorasPorDia').AsFloat;
  FSalario.TotalDeDiasTrabalhadosNaSemana := lDataSet.FieldByName('TotalDiasSemana').AsInteger;
  FSalario.Despesas := lDataSet.FieldByName('VlTotalDespesas').AsCurrency;
  FSalario.QuantidadeDeSemanasPorMes := 4;

  Result := FSalario;
end;

end.
