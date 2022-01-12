unit frmCadastroInventario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frmCadastroPadrao, Data.DB, Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, LibTypes, frmPesquisaPadrao, WallVendas.DAO.Generico,
  WallVendas.Model.Inventario, WallVendas.Model.InventarioItem,
  System.Generics.Collections, WallVendas.Helper.DBGrid, LibMessages, wallvendas.Helper.TEdit,
  Datasnap.DBClient;

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
    cdsInventarioItem: TClientDataSet;
    cdsInventarioItemCodigo: TStringField;
    cdsInventarioItemDescricao: TStringField;
    cdsInventarioItemUnidade: TStringField;
    cdsInventarioItemAltura: TStringField;
    cdsInventarioItemLargura: TStringField;
    cdsInventarioItemQuantidade: TFloatField;
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
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

procedure TTelaCadastroInventario.btnEditarClick(Sender: TObject);
begin
  inherited;
  dbgInventario.Refresh;
end;

procedure TTelaCadastroInventario.btnPesquisarClick(Sender: TObject);
var
  lDadoLocalizado: TDadoLocalizado;
  lInventarioItem: TInventarioItem;
  lListaInventarioItem: TObjectList<TInventarioItem>;
begin
  lDadoLocalizado := TTelaPesquisaPadrao.Pesquisa<TInventario>(['id', 'Descricao', 'Data']);

  if (lDadoLocalizado.Codigo.IsEmpty()) then
    Exit;

  edtIdInventario.Text := lDadoLocalizado.Codigo;
  edtDescricaoInventario.Text := lDadoLocalizado.Descricao;
  dtInventario.DateTime := StrToDateTime(lDadoLocalizado.Complemento);

  lListaInventarioItem := FDAOInventarioItem
    .FindJoin(
      'InventarioItem.*, Produto.Descricao',
      'Inner Join Produto on (Produto.id = InventarioItem.idProduto)',
      'IdInventario =' + QuotedStr(edtIdInventario.Text));


  cdsInventarioItem.Open();

  for lInventarioItem in lListaInventarioItem do
  begin
    cdsInventarioItem.Append();
    cdsInventarioItemCodigo.AsInteger := lInventarioItem.IdProduto;
    cdsInventarioItemDescricao.AsString := lInventarioItem.Descricao;
    cdsInventarioItemUnidade.AsString := lInventarioItem.Unidade;
    cdsInventarioItemAltura.AsString := lInventarioItem.Altura;
    cdsInventarioItemLargura.AsString := lInventarioItem.Largura;
    cdsInventarioItemQuantidade.AsFloat := lInventarioItem.Quantidade;
    cdsInventarioItem.Post();
  end;

  dbgInventario.AjustarColunas(1);

  Self.HabilitarCamposPesquisaValida();
end;

procedure TTelaCadastroInventario.btnSalvarClick(Sender: TObject);
var
  lInventario: TInventario;
  lInventarioItem: TInventarioItem;
begin
  MensagemCritica(
    dsInventarioItem.DataSet.IsEmpty,
    'Nenhum produto foi informado no inventário.',
    edtIdProdutoInventario);

  lInventario := TInventario.Create;
  try
    lInventario.Id := edtIdInventario.ToInteger;
    lInventario.Descricao := edtDescricaoInventario.Text;
    lInventario.Data := dtInventario.DateTime;

    if (FNovoCadastro) then
      FDAOInventario.Insert(lInventario)
    else
      FDAOInventario.Update(lInventario);
  finally
    lInventario.Free();
  end;

  FDAOInventarioItem.Delete('idInventario', edtIdInventario.Text);

  cdsInventarioItem.DisableControls();
  cdsInventarioItem.First();
  try
    while (not cdsInventarioItem.Eof) do
    begin
      lInventarioItem := TInventarioItem.Create();
      lInventarioItem.IdInventario := edtIdInventario.ToInteger;
      lInventarioItem.IdProduto := cdsInventarioItemCodigo.AsInteger;
      lInventarioItem.Unidade := cdsInventarioItemUnidade.AsString;
      lInventarioItem.Altura := cdsInventarioItemAltura.AsString;
      lInventarioItem.Largura := cdsInventarioItemLargura.AsString;
      lInventarioItem.Quantidade := cdsInventarioItemQuantidade.AsFloat;
      FDAOInventarioItem.Insert(lInventarioItem);
      cdsInventarioItem.Next();
    end;
  finally
    cdsInventarioItem.Close();
    cdsInventarioItem.CreateDataSet();
    cdsInventarioItem.enableControls();
  end;

  cdsInventarioItem.Close();
  cdsInventarioItem.CreateDataSet();

  inherited;
end;

procedure TTelaCadastroInventario.FormCreate(Sender: TObject);
begin
  inherited;
  FDAOInventario := TDAOGenerico<TInventario>.NovaInstancia();
  FDAOInventarioItem := TDAOGenerico<TInventarioItem>.NovaInstancia();
  cdsInventarioItem.CreateDataSet();
end;

procedure TTelaCadastroInventario.FormResize(Sender: TObject);
begin
  dbgInventario.AjustarColunas(1);
end;

end.

