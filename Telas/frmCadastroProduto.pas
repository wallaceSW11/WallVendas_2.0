unit frmCadastroProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frmCadastroPadrao, Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls,
  LibTypes, wallvendas.Model.Produto, frmPesquisaPadrao, System.Generics.Collections, WallVendas.DAO.Generico, Lib,
  WallVendas.Helper.Numbers, Datasnap.DBClient, wallvendas.Helper.DBGrid, wallvendas.Model.ProdutoComposicao,
  WallVendas.Helper.TEdit, LibMessages;

type
  TTelaCadastroProduto = class(TTelaCadastroPadrao)
    lblIdProduto: TLabel;
    lblDescricaoProduto: TLabel;
    lblPrecoCusto: TLabel;
    lblVlPrecoCompra: TLabel;
    lblPrecoVenda: TLabel;
    lblVlPrecoVenda: TLabel;
    pcProdutoComplemento: TPageControl;
    tsProdutoCusto: TTabSheet;
    lblQtEmbalagemCompra: TLabel;
    lblUnidadeCompra: TLabel;
    lblCusto: TLabel;
    lblFreteCompra: TLabel;
    lblCustoReposicao: TLabel;
    lblCustoReposicaoUnitario: TLabel;
    lblAcrescimoDesconto: TLabel;
    lblDataCompra: TLabel;
    lblTempoTrabalho: TLabel;
    lblCustoMinuto: TLabel;
    lblValorCustoMontagem: TLabel;
    btnMetroQuadrado: TSpeedButton;
    cbUnidadeCompra: TComboBox;
    edtQtEmbalagemCompra: TEdit;
    edtCustoProduto: TEdit;
    edtVlFreteCompra: TEdit;
    edtAcrescimoDesconto: TEdit;
    edtCustoReposicao: TEdit;
    edtCustoReposicaoUnitario: TEdit;
    dtDataCompra: TDateTimePicker;
    edtTempoMontagem: TEdit;
    edtCustoMinuto: TEdit;
    edtCustoMontagem: TEdit;
    tsProdutoComposicao: TTabSheet;
    lblIdProdutoComposicao: TLabel;
    lblDescricaoProdutoComposicao: TLabel;
    lblQtComposicao: TLabel;
    lblVlTotalInsumo: TLabel;
    lblTotalInsumo: TLabel;
    lblAcrescimoComposicao: TLabel;
    lblPrecoVendaFinal: TLabel;
    btnLocalizarProdutoComposicao: TSpeedButton;
    lblCustoReposicaoComposicao: TLabel;
    lblCustoComp: TLabel;
    lblMargemLucro: TLabel;
    lblValorMargemLucro: TLabel;
    dbgProdutoComposicao: TDBGrid;
    edtAcrescimoDescontoVenda: TEdit;
    edtVlPrecoVenda: TEdit;
    edtIdProdutoComposicao: TEdit;
    edtDescricaoProdutoComposicao: TEdit;
    edtQuantidadeComposicao: TEdit;
    edtCustoResposicaoProduto: TEdit;
    edtVlCustoComposicao: TEdit;
    edtMargemLucro: TEdit;
    edtValorMagemLucro: TEdit;
    edtIdProduto: TEdit;
    edtDescricaoProduto: TEdit;
    chkPossuiComposicao: TCheckBox;
    cdsComposicao: TClientDataSet;
    dsComposicao: TDataSource;
    cdsComposicaoCodigo: TStringField;
    cdsComposicaoDescricao: TStringField;
    cdsComposicaoAltura: TStringField;
    cdsComposicaoLargura: TStringField;
    cdsComposicaoQuantidade: TFloatField;
    cdsComposicaoValorItem: TCurrencyField;
    cdsComposicaoCusto: TCurrencyField;
    procedure btnPesquisarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tsProdutoComposicaoShow(Sender: TObject);
    procedure btnLocalizarProdutoComposicaoClick(Sender: TObject);
    procedure edtIdProdutoComposicaoExit(Sender: TObject);
    procedure edtQuantidadeComposicaoExit(Sender: TObject);
    procedure cdsComposicaoAfterPost(DataSet: TDataSet);
    procedure dbgProdutoComposicaoDblClick(Sender: TObject);
    procedure cdsComposicaoAfterDelete(DataSet: TDataSet);
    procedure dbgProdutoComposicaoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    FDAOProduto: IDAO<TProduto>;
    FDAOProdutoComposicao: IDAO<TProdutoComposicao>;
    procedure PreencherCampos(const pProduto: TProduto);
    procedure PreencherComposicao(const pIdentificadorProduto: Integer);
    procedure LimparCamposProdutoComposicao;
    procedure LocalizarProdutoPeloIdentificador;
    procedure AdicionarProdutoComposicaoCasoValido;
    procedure AtualizarValorTotalProdutoComposicao;
    procedure DeletarProdutoDaGrid;
  public
    { Public declarations }
  end;

var
  TelaCadastroProduto: TTelaCadastroProduto;

implementation

{$R *.dfm}

procedure TTelaCadastroProduto.btnLocalizarProdutoComposicaoClick(Sender: TObject);
var
  lDadoLocalizado: TDadoLocalizado;
begin
  lDadoLocalizado := TTelaPesquisaPadrao.Pesquisa<TProduto>(['id', 'Descricao', 'VlPrecoVenda'], 2);

  if (lDadoLocalizado.Codigo.IsEmpty()) then
    Exit();

  edtIdProdutoComposicao.Text := lDadoLocalizado.Codigo;
  edtDescricaoProdutoComposicao.Text := lDadoLocalizado.Descricao;
  edtVlCustoComposicao.Text := lDadoLocalizado.Complemento;

  edtQuantidadeComposicao.Focar();
end;

procedure TTelaCadastroProduto.btnPesquisarClick(Sender: TObject);
var
  lDadoLocalizado: TDadoLocalizado;
  lProduto: TProduto;
begin
  lDadoLocalizado := TTelaPesquisaPadrao.Pesquisa<TProduto>(['id', 'Descricao', 'VlPrecoVenda'], 2);

  if (lDadoLocalizado.Codigo.IsEmpty()) then
    Exit();

  lProduto := FDAOProduto.FindOne(lDadoLocalizado.Codigo.ToInteger());
  try
    PreencherCampos(lProduto);
  finally
    lProduto.Free();
  end;

  Self.HabilitarCamposPesquisaValida();
end;

procedure TTelaCadastroProduto.cdsComposicaoAfterDelete(DataSet: TDataSet);
begin
  AtualizarValorTotalProdutoComposicao();
end;

procedure TTelaCadastroProduto.cdsComposicaoAfterPost(DataSet: TDataSet);
begin
  AtualizarValorTotalProdutoComposicao();
end;

procedure TTelaCadastroProduto.dbgProdutoComposicaoDblClick(Sender: TObject);
begin
  if (cdsComposicao.IsEmpty()) then
    Exit;

  edtIdProdutoComposicao.Text := cdsComposicaoCodigo.AsString;
  edtDescricaoProdutoComposicao.Text := cdsComposicaoDescricao.AsString;
  edtVlCustoComposicao.Text := cdsComposicaoValorItem.AsString;
  edtQuantidadeComposicao.Text := cdsComposicaoQuantidade.AsString;

  cdsComposicao.Delete();
end;

procedure TTelaCadastroProduto.dbgProdutoComposicaoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_DELETE) then
    DeletarProdutoDaGrid();
end;
procedure TTelaCadastroProduto.DeletarProdutoDaGrid();
begin
  if (cdsComposicao.IsEmpty()) then
    Exit;

  if (Confirma('Confirmar excluir o produto selecionado?', 'Excluir produto')) then
    cdsComposicao.Delete();
end;

procedure TTelaCadastroProduto.AtualizarValorTotalProdutoComposicao();
var
  lTotalItem: Currency;
begin
  lTotalItem := 0;

  cdsComposicao.DisableControls();

  try
    cdsComposicao.First();
    while (not cdsComposicao.Eof) do
    begin
      lTotalItem := lTotalItem + cdsComposicaoValorItem.AsCurrency;
      cdsComposicao.Next();
    end;
  finally
    cdsComposicao.EnableControls();
  end;

  lblVlTotalInsumo.Caption := lTotalItem.ValorMonetarioCifrao;

end;

procedure TTelaCadastroProduto.edtIdProdutoComposicaoExit(Sender: TObject);
begin
  if (edtIdProdutoComposicao.IsEmpty()) then
    LimparCamposProdutoComposicao()
  else
    LocalizarProdutoPeloIdentificador();
end;

procedure TTelaCadastroProduto.edtQuantidadeComposicaoExit(Sender: TObject);
begin
  AdicionarProdutoComposicaoCasoValido();

end;

procedure TTelaCadastroProduto.AdicionarProdutoComposicaoCasoValido();
begin
  if (edtDescricaoProdutoComposicao.IsEmpty()) then
    Exit;

  cdsComposicao.Append();
  cdsComposicaoCodigo.AsInteger := edtIdProdutoComposicao.ToInteger;
  cdsComposicaoDescricao.AsString := edtDescricaoProdutoComposicao.Text;
  cdsComposicaoCusto.AsCurrency := edtVlCustoComposicao.ToCurrency;
//  cdsComposicaoAltura.AsInteger := lProdutoComposicao.Altura;
//  cdsComposicaoLargura.AsInteger := lProdutoComposicao.Largura;
  cdsComposicaoQuantidade.AsFloat := edtQuantidadeComposicao.ToFloat;
  cdscomposicaoValorItem.AsCurrency := edtQuantidadeComposicao.ToFloat * edtVlCustoComposicao.ToCurrency;
  cdsComposicao.Post();

  LimparCamposProdutoComposicao();
  edtIdProdutoComposicao.Focar();
end;

procedure TTelaCadastroProduto.LimparCamposProdutoComposicao();
begin
  edtIdProdutoComposicao.Clear();
  edtDescricaoProdutoComposicao.Clear();
  edtVlCustoComposicao.Clear();
  edtQuantidadeComposicao.Text := '1';
end;

procedure TTelaCadastroProduto.LocalizarProdutoPeloIdentificador();
var
  lProduto: TProduto;
begin
  lProduto := FDAOProduto.FindOne(edtIdProdutoComposicao.ToInteger);

  MensagemCritica(
    (lProduto.Id = 0),
    'Produto não localizado.',
    edtIdProdutoComposicao);

  edtDescricaoProdutoComposicao.Text := lProduto.Descricao;
  edtVlCustoComposicao.Text := lProduto.PrecoVenda.ValorMonetario;

  edtQuantidadeComposicao.Focar();
end;

procedure TTelaCadastroProduto.FormCreate(Sender: TObject);
begin
  inherited;
  FDAOProduto := TDAOGenerico<TProduto>.NovaInstancia();
  FDAOProdutoComposicao := TDAOGenerico<TProdutoComposicao>.NovaInstancia();
  pcProdutoComplemento.ActivePageIndex := 0;
  cdsComposicao.CreateDataSet();
end;

procedure TTelaCadastroProduto.PreencherCampos(const pProduto: TProduto);
begin
  edtIdProduto.Text := pProduto.Id.ToString;
  edtDescricaoProduto.Text := pProduto.Descricao;
  cbUnidadeCompra.ItemIndex := cbUnidadeCompra.Items.IndexOf(pProduto.UnidadeCompra);
  edtQtEmbalagemCompra.Text := pProduto.QtEmbalagemCompra.ToString;
  edtCustoProduto.Text := pProduto.ValorCompra.ValorMonetario;
  edtVlFreteCompra.Text := pProduto.VlFreteCompra.ValorMonetario;
  edtAcrescimoDesconto.Text := pProduto.AcrescimoDescontoCompra.ValorMonetario;
  edtCustoReposicao.Text := pProduto.CustoReposicao.ValorMonetario;
  edtCustoReposicaoUnitario.Text := pProduto.CustoReposicaoUnitario.ValorMonetario;
  dtDataCompra.DateTime := pProduto.DataCompra;
  chkPossuiComposicao.Checked := CharToBoolean(pProduto.PossuiComposicao);
  edtAcrescimoDescontoVenda.Text := pProduto.AcrescimoDescontoVenda.ValorMonetario;
  edtVlPrecoVenda.Text := pProduto.PrecoVenda.ValorMonetario;
  edtTempoMontagem.Text := pProduto.TempoMontagem.ToString;
  edtCustoMinuto.Text := pProduto.CustoMinuto.ValorMonetario;
  edtCustoMontagem.Text := pProduto.CustoMontagem.ValorMonetario;
  edtMargemLucro.Text := pProduto.MargemLucro.ValorMonetario;


  lblVlPrecoCompra.Caption := pProduto.custoReposicao.ValorMonetarioCifrao;
  lblVlPrecoVenda.Caption := pProduto.PrecoVenda.ValorMonetarioCifrao;

  if (CharToBoolean(pProduto.PossuiComposicao)) then
    PreencherComposicao(pProduto.Id);
end;


procedure TTelaCadastroProduto.PreencherComposicao(const pIdentificadorProduto: Integer);
var
  lProdutoComposicao: TProdutoComposicao;
  lListaProdutoComposicao: TObjectList<TProdutoComposicao>;
begin
  lListaProdutoComposicao :=
    FDAOProdutoComposicao.FindJoin(
      'ProdutoComposicao.*, ' +
      'Produto.Descricao',
      'Inner Join Produto on (Produto.id = ProdutoComposicao.IdProdutoComposicao)',
      'IdProduto =' + QuotedStr(pIdentificadorProduto.ToString));

  for lProdutoComposicao in lListaProdutoComposicao do
  begin
     cdsComposicao.Append();
     cdsComposicaoCodigo.AsInteger := lProdutoComposicao.IdentificadorProdutoComposicao;
     cdsComposicaoDescricao.AsString := lProdutoComposicao.Descricao;
     cdsComposicaoCusto.AsCurrency := lProdutoComposicao.ValorCusto;
     cdsComposicaoAltura.AsInteger := lProdutoComposicao.Altura;
     cdsComposicaoLargura.AsInteger := lProdutoComposicao.Largura;
     cdsComposicaoQuantidade.AsFloat := lProdutoComposicao.Quantidade;
     cdscomposicaoValorItem.AsCurrency := lProdutoComposicao.ValorItem;
     cdsComposicao.Post();
  end;
end;

procedure TTelaCadastroProduto.tsProdutoComposicaoShow(Sender: TObject);
begin
  inherited;
  dbgProdutoComposicao.AjustarColunas(1);
end;

end.
