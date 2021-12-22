unit WallVendas.DAO.Generico;

interface

uses
  SimpleInterface,
  SimpleDAO,
  SimpleAttributes,
  SimpleQueryFiredac,
  WallVendas.Context.Conexao,
  System.Generics.Collections,
  Vcl.Forms, Data.DB, LibTypes;

type
  IDAO<T: class> = interface
    ['{8A8D2025-68C3-4DD7-A747-C6141939FB82}']
    function FindOne(): T; overload;
    function FindOne(pIdentificador: Integer): T; overload;
    procedure Update(pEntidade: T);
    procedure Insert(pEntidade: T);
    procedure Find(pCampos: TArrayCamposSQL);
//    function FindAll(): TObjectList<T>;
  end;


  TDAOGenerico<T: class, constructor> = class(TInterfacedObject, IDAO<T>)
  private
    FConexao: IConexao;
    FDAOGenerico: iSimpleDAO<T>;
    FEntidade: T;
    constructor Create(); overload;
    constructor Create(var pDataSource: TDataSource); overload;
    constructor Create(var pBindForm: TForm); overload;
  public
    destructor Destroy; override;
    class function NovaInstancia(): IDAO<T>; overload;
    class function NovaInstancia(var pBindForm: TForm): IDAO<T>; overload;
    class function NovaInstancia(var pDataSource: TDataSource): IDAO<T>; overload;
    function FindOne(): T; overload;
    function FindOne(pIdentificador: Integer): T; overload;
    procedure Update(pEntidade: T);
    procedure Insert(pEntidade: T);
    procedure Find(pCampos: TArrayCamposSQL);
  end;

implementation

{ TDAOSalario }


constructor TDAOGenerico<T>.Create();
begin
  FConexao := TConexao.NovaInstancia();

  FDAOGenerico := TSimpleDAO<T>
                  .New(TSimpleQueryFiredac.New(FConexao.Conexao));
end;

constructor TDAOGenerico<T>.Create(var pDataSource: TDataSource);
begin
  FConexao := TConexao.NovaInstancia();

  FDAOGenerico := TSimpleDAO<T>
                  .New(TSimpleQueryFiredac.New(FConexao.Conexao))
                  .DataSource(pDataSource);
end;

constructor TDAOGenerico<T>.Create(var pBindForm: TForm);
begin
  FConexao := TConexao.NovaInstancia();

  FDAOGenerico := TSimpleDAO<T>
                  .New(TSimpleQueryFiredac.New(FConexao.Conexao))
                  .BindForm(pBindForm);
end;


destructor TDAOGenerico<T>.Destroy;
begin

  inherited;
end;

function TDAOGenerico<T>.FindOne(): T;
var
  lListaObjetos : TObjectList<T>;
begin
  lListaObjetos := TObjectList<T>.Create;

  try
    FDAOGenerico.Find(lListaObjetos);
    FEntidade := lListaObjetos[0];
  finally
    lListaObjetos.Free;
  end;

  Result := FEntidade;
end;

procedure TDAOGenerico<T>.Find(pCampos: TArrayCamposSQL);
begin
  FDAOGenerico
    .SQL
      .Fields('id, Nome')
    .&End
  .Find();
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

class function TDAOGenerico<T>.NovaInstancia(var pBindForm: TForm): IDAO<T>;
begin
  Result := Self.Create(pBindForm);
end;

class function TDAOGenerico<T>.NovaInstancia: IDAO<T>;
begin
  Result := Self.Create();
end;

class function TDAOGenerico<T>.NovaInstancia(var pDataSource: TDataSource): IDAO<T>;
begin
  Result := Self.Create(pDataSource);
end;

procedure TDAOGenerico<T>.Update(pEntidade: T);
begin
  FDAOGenerico.Update(pEntidade);
end;

end.
