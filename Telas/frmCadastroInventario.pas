unit frmCadastroInventario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frmCadastroPadrao, Data.DB, Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, LibTypes, frmPesquisaPadrao, WallVendas.DAO.Generico,
  WallVendas.Model.Inventario, WallVendas.Model.InventarioItem,
  System.Generics.Collections, WallVendas.Helper.DBGrid, LibMessages, wallvendas.Helper.TEdit,
  Datasnap.DBClient, Wallvendas.Model.Produto;

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
    procedure btnPesquisarProdutoInventarioClick(Sender: TObject);
    procedure edtIdProdutoInventarioExit(Sender: TObject);
    procedure edtQtProdutoInventarioExit(Sender: TObject);
    procedure dbgInventarioDblClick(Sender: TObject);
    procedure dbgInventarioKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnDuplicarClick(Sender: TObject);
  private
    FDAOInventario: IDAO<TInventario>;
    FDAOInventarioItem: IDAO<TInventarioItem>;
    FDAOProduto: IDAO<TProduto>;
    procedure LocalizarProduto;
    procedure LocalizarProdutoPeloIdentificador;
    procedure LimparCamposProdutoInventario;
    procedure DeletarProdutoDaGrid;
  public
    { Public declarations }
  end;

var
  TelaCadastroInventario: TTelaCadastroInventario;

implementation

{$R *.dfm}

procedure TTelaCadastroInventario.btnDuplicarClick(Sender: TObject);
begin
  if (not Confirma('Deseja duplicar o inventário?', 'Duplicar inventário')) then
    Exit;

  FNovoCadastro := True;
  edtIdInventario.Clear;

  btnSalvarClick(nil);



  inherited;
end;

procedure TTelaCadastroInventario.btnEditarClick(Sender: TObject);
begin
  inherited;
  dbgInventario.Refresh;
end;

procedure TTelaCadastroInventario.btnExcluirClick(Sender: TObject);
begin
  if (not Confirma('Confirma excluir o inventário?', 'Excluir inventário')) then
    Exit();

  FDAOInventarioItem.Delete('idInventario', edtIdInventario.Text);
  FDAOInventario.Delete('id', edtIdInventario.Text);

  inherited;
end;

procedure TTelaCadastroInventario.btnPesquisarClick(Sender: TObject);
var
  lDadoLocalizado: TDadoLocalizado;
  lInventarioItem: TInventarioItem;
  lListaInventarioItem: TObjectList<TInventarioItem>;
begin
  lDadoLocalizado := TTelaPesquisaPadrao.Pesquisa<TInventario>(['id', 'Descricao', 'Data']);

  if (lDadoLocalizado.Codigo.IsEmpty()) then
    Exit();

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

procedure TTelaCadastroInventario.btnPesquisarProdutoInventarioClick(Sender: TObject);
begin
  LocalizarProduto();
  edtQtProdutoInventario.Focar();
end;

procedure TTelaCadastroInventario.LocalizarProduto();
var
  lDadoLocalizado: TDadoLocalizado;
begin
  lDadoLocalizado := TTelaPesquisaPadrao.Pesquisa<TProduto>(['id', 'Descricao', 'UnidadeCompra']);

  if (lDadoLocalizado.Codigo.IsEmpty()) then
    Exit();

  edtIdProdutoInventario.Text := lDadoLocalizado.Codigo;
  edtDescricaoProdutoInventario.Text := lDadoLocalizado.Descricao;
  edtUnidade.Text := lDadoLocalizado.Complemento;


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
      edtIdInventario.Text := FDAOInventario.Insert(lInventario).ToString()
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

  FNovoCadastro := False;
  inherited;
end;

procedure TTelaCadastroInventario.dbgInventarioDblClick(Sender: TObject);
begin
  if (cdsInventarioItem.IsEmpty()) then
    Exit;

  edtIdProdutoInventario.Text := cdsInventarioItemCodigo.AsString;
  edtDescricaoProdutoInventario.Text := cdsInventarioItemDescricao.AsString;
  edtUnidade.Text := cdsInventarioItemUnidade.AsString;
//  cdsInventarioItemAltura.AsString :=
//  cdsInventarioItemLargura.AsString :=
  edtQtProdutoInventario.Text := cdsInventarioItemQuantidade.AsString;

  cdsInventarioItem.Delete();
end;

procedure TTelaCadastroInventario.dbgInventarioKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key = VK_DELETE) then
    DeletarProdutoDaGrid();
end;

procedure TTelaCadastroInventario.DeletarProdutoDaGrid();
begin
  if (cdsInventarioItem.IsEmpty()) then
    Exit;

  if (Confirma('Confirmar excluir o produto selecionado?', 'Excluir produto')) then
    cdsInventarioItem.Delete();
end;

procedure TTelaCadastroInventario.edtIdProdutoInventarioExit(Sender: TObject);
begin
  if (edtIdProdutoInventario.IsEmpty()) then
    LimparCamposProdutoInventario()
  else
    LocalizarProdutoPeloIdentificador();
end;

procedure TTelaCadastroInventario.edtQtProdutoInventarioExit(Sender: TObject);
begin
  if (edtDescricaoProdutoInventario.IsEmpty()) then
    Exit;

  if (cdsInventarioItem.Locate('Codigo', edtIdProdutoInventario.Text, [])) then
  begin
    edtIdProdutoInventario.Focar();
    ShowMessage('Produto já foi inserido.');
    Exit;
  end;

  MensagemCritica(
    edtQtProdutoInventario.IsEmpty(),
    'Por favor, informe a quantidade.',
    edtQtProdutoInventario);

  cdsInventarioItem.Append();
  cdsInventarioItemCodigo.AsString := edtIdProdutoInventario.Text;
  cdsInventarioItemDescricao.AsString := edtDescricaoProdutoInventario.Text;
  cdsInventarioItemUnidade.AsString := edtUnidade.Text;
//  cdsInventarioItemAltura.AsString :=
//  cdsInventarioItemLargura.AsString :=
  cdsInventarioItemQuantidade.AsString := edtQtProdutoInventario.Text;
  cdsInventarioItem.Post();

  LimparCamposProdutoInventario();
  edtIdProdutoInventario.Focar();
end;

procedure TTelaCadastroInventario.LocalizarProdutoPeloIdentificador();
var
  lProduto: TProduto;
begin
  lProduto := FDAOProduto.FindOne(edtIdProdutoInventario.ToInteger);

  MensagemCritica(
    (lProduto.Id = 0),
    'Produto não localizado.',
    edtIdProdutoInventario);

  edtDescricaoProdutoInventario.Text := lProduto.Descricao;
  edtUnidade.Text := lProduto.UnidadeCompra;
end;

procedure TTelaCadastroInventario.LimparCamposProdutoInventario();
begin
  edtIdProdutoInventario.Clear();
  edtDescricaoProdutoInventario.Clear();
  edtUnidade.Clear();
  edtQtProdutoInventario.Text := '1';
end;

procedure TTelaCadastroInventario.FormCreate(Sender: TObject);
begin
  inherited;
  FDAOInventario := TDAOGenerico<TInventario>.NovaInstancia();
  FDAOInventarioItem := TDAOGenerico<TInventarioItem>.NovaInstancia();
  FDAOProduto := TDAOGenerico<TProduto>.NovaInstancia();
  cdsInventarioItem.CreateDataSet();
end;

procedure TTelaCadastroInventario.FormResize(Sender: TObject);
begin
  dbgInventario.AjustarColunas(1);
end;

end.

