unit frmCadastroInventario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frmCadastroPadrao, Data.DB, Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, LibTypes, frmPesquisaPadrao, WallVendas.DAO.Generico,
  WallVendas.Model.Inventario, WallVendas.Model.InventarioItem,
  System.Generics.Collections, WallVendas.Helper.DBGrid;

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
    dsInventarioItem: TDataSource;
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
   FDAOInventario: IDAO<TInventario>;
   FDAOInventarioItem: IDAO<TInventarioItem>;
  public
    { Public declarations }
  end;

var
  TelaCadastroInventario: TTelaCadastroInventario;

implementation

{$R *.dfm}

procedure TTelaCadastroInventario.btnPesquisarClick(Sender: TObject);
var
  lDadoLocalizado: TDadoLocalizado;
begin
  lDadoLocalizado := TTelaPesquisaPadrao.Pesquisa<TInventario>(['id', 'Descricao', 'Data']);

  if (lDadoLocalizado.Codigo.IsEmpty()) then
    Exit;

  edtIdInventario.Text := lDadoLocalizado.Codigo;
  edtDescricaoInventario.Text := lDadoLocalizado.Descricao;
  dtInventario.DateTime := StrToDateTime(lDadoLocalizado.Complemento);

  FDAOInventarioItem
    .FindJoin(
      'InventarioItem.*, Produto.Descricao',
      'Inner Join Produto on (Produto.id = InventarioItem.idProduto)',
      'IdInventario =' + QuotedStr(edtIdInventario.Text));

  dbgInventario.AjustarColunas(1);

  Self.HabilitarCamposPesquisaValida();
end;

procedure TTelaCadastroInventario.btnSalvarClick(Sender: TObject);
//var
 // lCliente: TPessoa;
begin
//  MensagemCritica(
//    edtNomePessoa.IsEmpty,
//    'Por favor, informe o nome do cliente.',
//    edtNomePessoa);
//
//  lCliente := TPessoa.Create;
//  try
//    lCliente.Nome := edtNomePessoa.Text;
//
//    if (FNovoCadastro) then
//    begin
//      FDAOCliente.Insert(lCliente);
//      Exit;
//    end;
//
//    lCliente.Id := edtIdPessoa.ToInteger;
//    FDAOCliente.Update(lCliente);
//  finally
//    lCliente.Free();
//  end;
//

  inherited;
end;

procedure TTelaCadastroInventario.FormCreate(Sender: TObject);
begin
  inherited;
  FDAOInventario := TDAOGenerico<TInventario>.NovaInstancia();
  FDAOInventarioItem := TDAOGenerico<TInventarioItem>.NovaInstancia(dsInventarioItem);
end;

procedure TTelaCadastroInventario.FormResize(Sender: TObject);
begin
  dbgInventario.AjustarColunas(1);
end;

end.
