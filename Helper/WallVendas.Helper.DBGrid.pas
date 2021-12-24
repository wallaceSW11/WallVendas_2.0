unit WallVendas.Helper.DBGrid;

interface

uses
  vcl.DBGrids;

type
  TDBGrid_Helper = class helper for TDBGrid
    procedure AjustarColunas(const pColunaPrincipal: Integer);
  end;

implementation

procedure TDBGrid_Helper.AjustarColunas(const pColunaPrincipal: Integer);
var
  I,
  lTamanhoColunas: Integer;
begin
  lTamanhoColunas := 0;

  for I := 0 to Self.Columns.Count-1 do
  begin
    if (I = pColunaPrincipal) then
     Self.Columns[I].Width := 0;

    lTamanhoColunas :=  lTamanhoColunas + Self.Columns[I].Width;
  end;

  Self.Columns[pColunaPrincipal].Width := (Self.Width - 30) - lTamanhoColunas;
end;

end.
