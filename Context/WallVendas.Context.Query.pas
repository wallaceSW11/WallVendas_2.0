unit WallVendas.Context.Query;

interface

uses
  Data.DB,
  System.SysUtils,
  WallVendas.Context.Conexao,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  IQuery = interface
    ['{A2BB3321-9A40-4AE3-806A-D7C677BC8DA8}']
    function OpenQuery(const pComandoSQL: string): TDataSet;
    function ExecSQL(const pComandoSQL: string): Integer;
  end;

  TQuery = class(TInterfacedObject, IQuery)
  private
    FConexao: IConexao;
    FQuery: TFDQuery;
    constructor Create( );
    procedure ReiniciarQuery();
  public
    destructor Destroy; override;
    class function NovaInstancia(): IQuery;
    function OpenQuery(const pComandoSQL: string): TDataSet;
    function ExecSQL(const pComandoSQL: string): Integer;
  end;

implementation

{ TQuery }

constructor TQuery.Create;
begin
  FConexao := TConexao.NovaInstancia();
  FQuery := TFDQuery.Create(nil);
  FQuery.Connection := FConexao.Conexao();
end;

destructor TQuery.Destroy;
begin
  FQuery.Close();
  FQuery.Connection.Connected := False;
  FreeAndNil(FQuery);
  inherited;
end;

function TQuery.ExecSQL(const pComandoSQL: string): Integer;
begin
  Result := 0;

  ReiniciarQuery();
  FQuery.SQL.Add(pComandoSQL);

  try
    FQuery.ExecSQL();
    //Result := FQuery;
  except
    on E:Exception do
      raise Exception.Create('Falha ao realizar a consulta: ' + E.Message);
  end;
end;

class function TQuery.NovaInstancia: IQuery;
begin
  Result := Self.Create();
end;

function TQuery.OpenQuery(const pComandoSQL: string): TDataSet;
begin
  ReiniciarQuery();
  FQuery.SQL.Add(pComandoSQL);

  try
    FQuery.Open();
    Result := FQuery;
  except
    on E:Exception do
      raise Exception.Create('Falha ao realizar a consulta: ' + E.Message);
  end;
end;

procedure TQuery.ReiniciarQuery;
begin
  FQuery.Close();
  FQuery.SQL.Clear();
end;

end.
