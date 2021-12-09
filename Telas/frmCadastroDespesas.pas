unit frmCadastroDespesas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, EditCurrency, Data.DB, Vcl.Grids, Vcl.DBGrids,
  WallVendas.Helper.TEdit;

type
  TTelaCadastroDespesas = class(TForm)
    edtDescricao: TEdit;
    edtValor: TEditCurrency;
    lblDescricao: TLabel;
    lblValor: TLabel;
    btnAdicionar: TButton;
    DBGrid1: TDBGrid;
    edtTotal: TEditCurrency;
    lblTotal: TLabel;
  private
    { Private declarations }
  public
    class function ValorTotalDespesas(): Currency;
  end;

var
  TelaCadastroDespesas: TTelaCadastroDespesas;

implementation

{$R *.dfm}

class function TTelaCadastroDespesas.ValorTotalDespesas: Currency;
begin
  TelaCadastroDespesas := TTelaCadastroDespesas.Create(nil);
  TelaCadastroDespesas.ShowModal();
  Result := TelaCadastroDespesas.edtTotal.ToCurrency;
end;

end.
