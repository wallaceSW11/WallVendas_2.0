unit WallVendas.Helper.DataSet;

interface

uses
  Data.DB;

type
  TDataSetHelper = class helper for TDataSet
    procedure Editar(const pEdicao: boolean);
  end;

implementation

{ TDataSetHelper }

procedure TDataSetHelper.Editar(const pEdicao: boolean);
begin
  if (pEdicao) then
    Self.Edit()
  else
    Self.Append();
end;

end.
