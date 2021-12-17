unit WallVendas.DAO.Generico;

interface

uses
  SimpleInterface,
  SimpleDAO,
  SimpleAttributes,
  SimpleQueryFiredac,
  WallVendas.Context.Conexao,
  System.Generics.Collections,
  Vcl.Forms;

type
  IDAO<T: class> = interface
    ['{8A8D2025-68C3-4DD7-A747-C6141939FB82}']
    function FindOne(): T; overload;
    function FindOne(pIdentificador: Integer): T; overload;
    procedure Update(pEntidade: T);
    procedure Insert(pEntidade: T);
//    function FindAll(): TObjectList<T>;
  end;


  TDAOGenerico<T: class, constructor> = class(TInterfacedObject, IDAO<T>)
  private
    FConexao: IConexao;
    FDAOGenerico: iSimpleDAO<T>;
    FEntidade: T;
    constructor Create();
  public
    destructor Destroy; override;
    class function NovaInstancia(): IDAO<T>;
    function FindOne(): T; overload;
    function FindOne(pIdentificador: Integer): T; overload;
    procedure Update(pEntidade: T);
    procedure Insert(pEntidade: T);
  end;

implementation

{ TDAOSalario }

constructor TDAOGenerico<T>.Create();
begin
  FConexao := TConexao.NovaInstancia();

  FDAOGenerico := TSimpleDAO<T>
                  .New(TSimpleQueryFiredac.New(FConexao.Conexao));
end;

destructor TDAOGenerico<T>.Destroy;
begin

  inherited;
end;

function TDAOGenerico<T>.FindOne(): T;
var
  Salarios : TObjectList<T>;
begin
  Salarios := TObjectList<T>.Create;

  try
    FDAOGenerico.Find(Salarios);
    FEntidade := Salarios[0];
  finally
    Salarios.Free;
  end;

  Result := FEntidade;
end;

function TDAOGenerico<T>.FindOne(pIdentificador: Integer): T;
begin
  FEntidade := FDAOGenerico.Find(pIdentificador);
  Result := FEntidade;
end;

procedure TDAOGenerico<T>.Insert(pEntidade: T);
begin
  FDAOGenerico.Insert(pEntidade);
end;

class function TDAOGenerico<T>.NovaInstancia(): IDAO<T>;
begin
  Result := Self.Create();
end;

procedure TDAOGenerico<T>.Update(pEntidade: T);
begin
  FDAOGenerico.Update(pEntidade);
end;

end.
