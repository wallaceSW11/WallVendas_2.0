unit WallVendas.Repository.Interfaces;

interface

uses
  WallVendas.Model.Salario;

type
  IRepositorySalario = interface
    ['{C508EABE-ECF2-40E8-AF8C-813D64E4B76B}']
    function ObterSalario(): TSalario;
    procedure AtualizarSalario(pSalario: TSalario);
  end;

implementation

end.
