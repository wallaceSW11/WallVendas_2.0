unit WallVendas.Controller.Salario;

interface

uses
  WallVendas.Repository.Salario,
  WallVendas.Repository.Interfaces,
  WallVendas.Model.Salario, System.SysUtils;

type
  IControllerSalario = interface
    ['{2D9C246C-1DDB-46B3-8E98-808F7B4F6F41}']
  function Salario(): TSalario;
  procedure Atualizar(const pSalario: TSalario);
  end;

  TControllerSalario = class(TInterfacedObject, IControllerSalario)
  private
    FRepositorySalario: IRepositorySalario;
    FSalario: TSalario;
    constructor Create();

  public
    destructor Destroy; override;
    class function NovaInstancia(): IControllerSalario;

    function Salario(): TSalario;
    procedure Atualizar(const pSalario: TSalario);

  end;

implementation

{ TControllerSalario }

procedure TControllerSalario.Atualizar(const pSalario: TSalario);
begin
  FRepositorySalario.AtualizarSalario(pSalario);
end;

constructor TControllerSalario.Create;
begin
  FRepositorySalario := TRepositorySalario.NovaInstancia();
  FSalario := TSalario.Create();
end;

destructor TControllerSalario.Destroy;
begin
  FSalario.Free();
  inherited;
end;

class function TControllerSalario.NovaInstancia: IControllerSalario;
begin
  Result := Self.Create();
end;

function TControllerSalario.Salario(): TSalario;
begin
  FSalario := FRepositorySalario.ObterSalario();
  Result := FSalario;
end;

end.
