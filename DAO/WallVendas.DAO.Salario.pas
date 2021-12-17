unit WallVendas.DAO.Salario;

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
  IDAO<T> = interface
    ['{8A8D2025-68C3-4DD7-A747-C6141939FB82}']
    function FindOne(): T;
  end;


  TDAOSalario<T: class, constructor> = class(TInterfacedObject, IDAO<T>)
  private
    FConexao: iSimpleQuery;
    FDAOSalario: iSimpleDAO<T>;
    FSalario: T;
    constructor Create();
  public
    destructor Destroy; override;
    class function NovaInstancia(): IDAO<T>;
    function Find(): T;


  end;

implementation

{ TDAOSalario }

constructor TDAOSalario<T>.Create();
begin
  FDAOSalario := TSimpleDAO<T>
                  .New(TSimpleQueryFiredac.New(TConexao.NovaInstancia().Conexao));
end;

destructor TDAOSalario<T>.Destroy;
begin

  inherited;
end;

function TDAOSalario<T>.Find(): T;
var
  Salarios : TObjectList<T>;
begin
  Salarios := TObjectList<T>.Create;

  try
    FDAOSalario.Find(Salarios);
    FSalario := Salarios[0];
  finally
    Salarios.Free;
  end;

  Result := FSalario;
end;

class function TDAOSalario<T>.NovaInstancia(): IDAO<T>;
begin
  Result := Self.Create();
end;

end.
