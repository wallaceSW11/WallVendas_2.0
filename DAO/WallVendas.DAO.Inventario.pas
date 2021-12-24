unit WallVendas.DAO.Inventario;

interface

uses
  wallvendas.DAO.Generico,
  wallvendas.Model.Inventario,
  wallvendas.Model.InventarioItem;

type
  TDAOInventario<T: class, constructor> = class(TDAOGenerico<T>)

  end;


implementation

end.
