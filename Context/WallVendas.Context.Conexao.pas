unit WallVendas.Context.Conexao;

interface

uses
  System.SysUtils, FireDAC.Phys.SQLiteCli, Vcl.Forms,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.Phys.SQLiteDef, FireDAC.Phys.SQLite;

type
  IConexao = interface
    ['{A2E842E4-9727-4799-9F06-E9BA1090F038}']
  function Conexao(): TFDConnection;
  end;

  TConexao = class(TInterfacedObject, IConexao)
  private
    FConexao: TFDConnection;
    constructor Create( );
  public
    destructor Destroy; override;
    class function NovaInstancia(): IConexao;
    function Conexao(): TFDConnection;
  end;

implementation

{ TConexao }

function TConexao.Conexao: TFDConnection;
begin
  Result := FConexao;
end;

constructor TConexao.Create;
const
  NOME_BASE_DE_DADOS = 'WallVendas.sqlite3';
begin
  FConexao := TFDConnection.Create(nil);
  FConexao.Params.DriverID := 'SQLite';
  FConexao.Params.Database := ExtractFileDir(Application.ExeName) + '\BD\' + NOME_BASE_DE_DADOS;;

  try
    FConexao.Connected := True;
  except
    on E:Exception do
      raise Exception.Create('Error Message: ' + E.Message);

  end;

  // criar tabelas caso não existam
end;

destructor TConexao.Destroy;
begin
//  FConexao.Connected := False;
//  FreeAndNil(FConexao);
  inherited;
end;

class function TConexao.NovaInstancia: IConexao;
begin
  Result := Self.Create();
end;

end.
