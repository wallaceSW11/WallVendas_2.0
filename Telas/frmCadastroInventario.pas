unit frmCadastroInventario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frmCadastroPadrao, Data.DB, Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TTelaCadastroInventario = class(TTelaCadastroPadrao)
    Label2: TLabel;
    Label3: TLabel;
    btnPesquisarProdutoInventario: TSpeedButton;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    lbl1: TLabel;
    Label7: TLabel;
    edtIdProdutoInventario: TEdit;
    edtDescricaoProdutoInventario: TEdit;
    edtQtProdutoInventario: TEdit;
    dbgInventario: TDBGrid;
    edtIdInventario: TEdit;
    edtDescricaoInventario: TEdit;
    dtInventario: TDateTimePicker;
    edtUnidade: TEdit;
    Label1: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Label8: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TelaCadastroInventario: TTelaCadastroInventario;

implementation

{$R *.dfm}

end.
