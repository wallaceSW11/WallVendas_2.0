unit WallVendas.Repository.Salario;

interface

uses
  WallVendas.Repository.Interfaces,
  WallVendas.Model.Salario,
  WallVendas.Context.Query,
  data.DB; // retirar esse cara

type
  TRepositorySalario = class(TInterfacedObject, IRepositorySalario)
  private
    FSalario: TSalario;
    FQuery: IQuery;
    constructor Create();
  public
    class function NovaInstancia(): IRepositorySalario;

    function ObterSalario(): TSalario;
    procedure AtualizarSalario();
  end;

implementation

{ TRepositorySalario }

procedure TRepositorySalario.AtualizarSalario();
begin
  //
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
