unit WallVendas.DAO.Configuracao;

interface

uses
  WallVendas.DAO.Generico,
  WallVendas.Model.Configuracao;

type
  IDAOConfiguracao = interface
    ['{C55454B1-9A68-4882-9F95-85419307FCA9}']
    function Find(const pNomeConfiguracao: string): string;
  end;

  TDAOConfiguraco = class(TInterfacedObject, IDAOConfiguracao)
  private
    FDAO: IDAO<TConfiguracao>;
    constructor Create();
  public
    destructor Destroy; override;
    class function NovaInstancia(): IDAOConfiguracao;
    function Find(const pNomeConfiguracao: string): string;
  end;


implementation

{ TDAOConfiguraco }

constructor TDAOConfiguraco.Create;
begin
  FDAO := TDAOGenerico<TConfiguracao>.NovaInstancia();
end;

destructor TDAOConfiguraco.Destroy;
begin

  inherited;
end;

function TDAOConfiguraco.Find(const pNomeConfiguracao: string): string;
begin
  Result := FDAO.FindConfiguration(pNomeConfiguracao).ValorConfiguracao;
end;

class function TDAOConfiguraco.NovaInstancia: IDAOConfiguracao;
begin
  Result := Self.Create();
end;

end.
