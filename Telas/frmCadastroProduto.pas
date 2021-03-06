unit frmCadastroProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frmCadastroPadrao, Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls,
  LibTypes, wallvendas.Model.Produto, frmPesquisaPadrao, System.Generics.Collections, WallVendas.DAO.Generico, Lib,
  WallVendas.Helper.Numbers, Datasnap.DBClient, wallvendas.Helper.DBGrid, wallvendas.Model.ProdutoComposicao,
  WallVendas.Helper.TEdit, LibMessages, EditNumber, EditCurrency, WallVendas.DAO.Produto, WallVendas.Model.Salario,
  WallVendas.DAO.Configuracao, WallVendas.Model.Configuracao, frmCalculoMetroQuadrado, System.StrUtils;

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
    cbUnidadeCompra: TComboBox;
    dtDataCompra: TDateTimePicker;
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
    edtVlPrecoVenda: TEdit;
    edtIdProdutoComposicao: TEdit;
    edtDescricaoProdutoComposicao: TEdit;
    edtQuantidadeComposicao: TEdit;
    edtCustoResposicaoProduto: TEdit;
    edtVlCustoComposicao: TEdit;
    edtValorMagemLucro: TEdit;
    edtIdProduto: TEdit;
    edtDescricaoProduto: TEdit;
    cdsComposicao: TClientDataSet;
    dsComposicao: TDataSource;
    cdsComposicaoCodigo: TStringField;
    cdsComposicaoDescricao: TStringField;
    cdsComposicaoAltura: TStringField;
    cdsComposicaoLargura: TStringField;
    cdsComposicaoQuantidade: TFloatField;
    cdsComposicaoValorItem: TCurrencyField;
    cdsComposicaoCusto: TCurrencyField;
    edtCustoProduto: TEditCurrency;
    edtVlFreteCompra: TEditCurrency;
    edtAcrescimoDesconto: TEditCurrency;
    edtCustoReposicao: TEditCurrency;
    edtCustoReposicaoUnitario: TEditCurrency;
    edtCustoMinuto: TEditCurrency;
    edtCustoMontagem: TEditCurrency;
    edtTempoMontagem: TEditNumber;
    edtMargemLucro: TEditNumber;
    edtAcrescimoDescontoVenda: TEditCurrency;
    lblAltura: TLabel;
    edtAltura: TEditNumber;
    lblLargura: TLabel;
    edtLargura: TEditNumber;
    lblPrecoCompra: TLabel;
    edtPreco: TEditCurrency;
    edtQtEmbalagemCompra: TEditNumber;
    lblQtEmbalagemCompra: TLabel;
    lblAlturaComposicao: TLabel;
    edtAlturaComposicao: TEditNumber;
    lblLarguraComposicao: TLabel;
    edtLarguraComposicao: TEditNumber;
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
    procedure btnNovoClick(Sender: TObject);
    procedure AtualizarValoresDoProduto(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure cbUnidadeCompraChange(Sender: TObject);
    procedure btnCalcularMetroQuadradoClick(Sender: TObject);
    procedure tsProdutoCustoShow(Sender: TObject);
    procedure CalcularPreco(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure CalcularQuantidadeMetroQuadrado(Sender: TObject);
    procedure btnDuplicarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
    FDAOProduto: IDAOProduto;
    FDAOSalario: IDAO<TSalario>;
    FDAOConfiguracao: IDAOConfiguracao;
    FValorTotalInsumo: Currency;

    procedure PreencherCampos(pProduto: TProduto);
    procedure LimparCamposProdutoComposicao;
    procedure LocalizarProdutoPeloIdentificador;
    procedure AdicionarProdutoComposicaoCasoValido;
    procedure AtualizarValorTotalProdutoComposicao;
    procedure DeletarProdutoDaGrid;
    procedure PreencherObjeto(var pProduto: TProduto);
    procedure PreencherCamposComposicao(const pProduto: TProduto);


  public
    { Public declarations }
  end;

var
  TelaCadastroProduto: TTelaCadastroProduto;

implementation

{$R *.dfm}

procedure TTelaCadastroProduto.btnCalcularMetroQuadradoClick(Sender: TObject);
var
  lPrecoMetroQuadrado: Currency;
begin
  inherited;
  lPrecoMetroQuadrado := TelaCalcularPrecoMetroQuadrado.PrecoMetroQuadradoCalculado();

  if (lPrecoMetroQuadrado > 0) then
    edtCustoProduto.Text := lPrecoMetroQuadrado.ValorMonetario;

end;

procedure TTelaCadastroProduto.btnDuplicarClick(Sender: TObject);
begin

  if (not Confirma('Deseja duplicar o produto?', 'Duplicar produto')) then
    Exit();

  edtIdProduto.Clear;
  FNovoCadastro := True;
  FCadastroDuplicado := True;

  btnSalvarClick(nil);

  if (Confirma('Deseja editar o item duplicado?', 'Editar item')) then
  begin
    btnEditarClick(nil);
    FNovoCadastro := False;
    FCadastroDuplicado := False;
    Exit();
  end;

  inherited;
end;

procedure TTelaCadastroProduto.btnEditarClick(Sender: TObject);
begin
  inherited;
  cbUnidadeCompraChange(nil);
end;

procedure TTelaCadastroProduto.btnExcluirClick(Sender: TObject);
begin
  MensagemCritica(
    (FDAOProduto.ProdutoEstaComoInsumo(edtIdProduto.ToInteger)),
    'O produto n?o poder? ser exclu?do pois est? vinculado como insumo em um ou mais produtos.',
    nil);

  MensagemCritica(
    (FDAOProduto.ProdutoPossuiVenda(edtIdProduto.ToInteger)),
    'O produto n?o poder? ser exclu?do pois est? vinculado a uma ou mais vendas.',
    nil);

  if (not Confirma('Confirma excluir o produto?', 'Excluir produto')) then
    Exit();

  FDAOProduto.Delete(edtIdProduto.ToInteger);

  inherited;
end;

procedure TTelaCadastroProduto.btnLocalizarProdutoComposicaoClick(Sender: TObject);
var
  lDadoLocalizado: TDadoLocalizado;
  lProduto: TProduto;
begin
  lDadoLocalizado := TTelaPesquisaPadrao.Pesquisa<TProduto>(['id', 'Descricao', 'VlPrecoVenda'], 2);

  if (lDadoLocalizado.Codigo.IsEmpty()) then
    Exit();

  lProduto := FDAOProduto.Find(lDadoLocalizado.Codigo.ToInteger);

  try
    PreencherCamposComposicao(lProduto);

//    edtIdProdutoComposicao.Text := lProduto.id;
//    edtDescricaoProdutoComposicao.Text := lProduto.Descricao;
//    edtVlCustoComposicao.Text := lProduto.PrecoVenda.ValorMonetario;
//
//    edtAlturaComposicao.Enabled := (lProduto.UnidadeCompra = 'Metro Quadrado');
//    edtLarguraComposicao.Enabled := edtAlturaComposicao.Enabled;
//    edtQuantidadeComposicao.Enabled := (not edtAlturaComposicao.Enabled);
//
//    if (edtAlturaComposicao.Enabled) then
//      edtAlturaComposicao.Focar
//    else
//      edtQuantidadeComposicao.Focar();
  finally
    lProduto.Free();
  end;
end;

procedure TTelaCadastroProduto.btnNovoClick(Sender: TObject);
var
  lSalario: TSalario;
begin
  inherited;

  lSalario := FDAOSalario.FindOne(1);
  edtCustoMinuto.Text := lSalario.ValorDoSalarioPorMinuto().ValorMonetario;
  lSalario.Free();

  edtMargemLucro.Text := FDAOConfiguracao.Find('MargemLucroPadrao');
  edtDescricaoProduto.Focar();
end;

procedure TTelaCadastroProduto.btnPesquisarClick(Sender: TObject);
var
  lDadoLocalizado: TDadoLocalizado;
  lProduto: TProduto;
begin
  lDadoLocalizado := TTelaPesquisaPadrao.Pesquisa<TProduto>(['id', 'Descricao', 'VlPrecoVenda'], 2);

  if (lDadoLocalizado.Codigo.IsEmpty()) then
    Exit();

  lProduto := FDAOProduto.Find(lDadoLocalizado.Codigo.ToInteger);
  try
    PreencherCampos(lProduto);
  finally
    lProduto.Free();
  end;

  Self.HabilitarCamposPesquisaValida();
end;

procedure TTelaCadastroProduto.btnSalvarClick(Sender: TObject);
var
  lProduto: TProduto;
begin
  MensagemCritica(
    (edtDescricaoProduto.IsEmpty),
    'Por favor, informe a descri??o do produto.',
    edtDescricaoProduto);

  lProduto := TProduto.Create();
  try
    PreencherObjeto(lProduto);

    if (FNovoCadastro) then
      edtIdProduto.Text := FDAOProduto.Insert(lProduto).ToString()
    else
      FDAOProduto.Update(lProduto);
  finally
    lProduto.Free();
  end;

  inherited;
end;

procedure TTelaCadastroProduto.cbUnidadeCompraChange(Sender: TObject);
begin
  edtAltura.Enabled := (cbUnidadeCompra.ItemIndex = 5);
  edtLargura.Enabled := edtAltura.Enabled;
  edtPreco.Enabled := edtAltura.Enabled;

  if (not edtAltura.Enabled) then
  begin
    edtAltura.Text := '0';
    edtLargura.Text := '0';
    edtPreco.Text := '0,00';
  end;



//  btnCalcularMetroQuadrado.Enabled := (cbUnidadeCompra.ItemIndex = 5);
//  pnlMetro.Visible := (cbUnidadeCompra.ItemIndex = 5);
//  pnlEmbalagem.Visible := not pnlMetro.Visible;
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
  edtAlturaComposicao.Text := cdsComposicaoAltura.AsString;
  edtLarguraComposicao.Text := cdsComposicaoLargura.AsString;
  edtVlCustoComposicao.Text := cdsComposicaoCusto.AsString;
  edtQuantidadeComposicao.Text := cdsComposicaoQuantidade.AsString;

  edtAlturaComposicao.Enabled := (edtAlturaComposicao.Text <> '0');
  edtLarguraComposicao.Enabled := edtAlturaComposicao.Enabled;

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

  if (not Confirma('Confirmar excluir o produto selecionado?', 'Excluir produto')) then
    Exit;

  FValorTotalInsumo := FValorTotalInsumo - cdscomposicaoValorItem.AsCurrency;
  cdsComposicao.Delete();
  AtualizarValoresDoProduto(nil);
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

procedure TTelaCadastroProduto.AtualizarValoresDoProduto(Sender: TObject);
var
  lProduto: TProduto;
  lProdutoComposicao: TProdutoComposicao;
  lRecNo: Integer;
begin
  lProduto := TProduto.Create();
  try
    lProduto.QtEmbalagemCompra := edtQtEmbalagemCompra.ToFloat;
    lProduto.TempoMontagem := edtTempoMontagem.ToInteger;
    lProduto.CustoMinuto := edtCustoMinuto.ToCurrency;
    lProduto.ValorCompra := edtCustoProduto.ToCurrency;
    lProduto.VlFreteCompra := edtVlFreteCompra.ToCurrency;
    lProduto.AcrescimoDescontoCompra := edtAcrescimoDesconto.ToCurrency;

    lProduto.MargemLucro := edtMargemLucro.ToFloat;
    lProduto.AcrescimoDescontoVenda := edtAcrescimoDescontoVenda.ToCurrency;

    //Produto composicao \\
    cdsComposicao.Open();
    cdsComposicao.DisableControls();
    lRecNo := cdsComposicao.RecNo;

    cdsComposicao.First();

    while (not cdsComposicao.Eof) do
    begin
      lProdutoComposicao := TProdutoComposicao.Create();
      lProdutoComposicao.ValorCusto := cdsComposicaoCusto.AsCurrency;
      lProdutoComposicao.Quantidade := cdsComposicaoQuantidade.AsFloat;
      lProduto.ProdutosComposicao.Add(lProdutoComposicao);
      cdsComposicao.Next();
    end;

    cdsComposicao.RecNo := lRecNo;
    cdsComposicao.EnableControls();

    edtCustoMontagem.Text := lProduto.CustoMontagem.ValorMonetario;
    edtCustoReposicao.Text := lProduto.CustoReposicao.ValorMonetario;
    edtCustoReposicaoUnitario.Text := lProduto.CustoReposicaoUnitario.ValorMonetario;
    edtCustoResposicaoProduto.Text := lProduto.CustoReposicaoUnitario.ValorMonetario;

    edtVlPrecoVenda.Text := lProduto.ValorPrecoVenda.ValorMonetario();
    edtVlPrecoVenda.Hint := 'Lucro final: ' + lProduto.ValorLucroFinal.ValorMonetarioCifrao();

    lblVlPrecoVenda.Caption := 'R$ ' + edtVlPrecoVenda.Text;
    lblVlPrecoCompra.Caption := lProduto.custoReposicao.ValorMonetarioCifrao();

    edtValorMagemLucro.Text := lProduto.ValorMargemLucro.ValorMonetario();
  finally
    lProduto.Free();
  end;
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
  cdsComposicaoAltura.AsInteger := edtAlturaComposicao.ToInteger;
  cdsComposicaoLargura.AsInteger := edtLarguraComposicao.ToInteger;
  cdsComposicaoQuantidade.AsFloat := edtQuantidadeComposicao.ToFloat;
  cdscomposicaoValorItem.AsCurrency := edtQuantidadeComposicao.ToFloat * edtVlCustoComposicao.ToCurrency;

  FValorTotalInsumo := FValorTotalInsumo + cdscomposicaoValorItem.AsCurrency;

  cdsComposicao.Post();

  AtualizarValoresDoProduto(nil);

  LimparCamposProdutoComposicao();
  edtIdProdutoComposicao.Focar();
end;

procedure TTelaCadastroProduto.LimparCamposProdutoComposicao();
begin
  edtIdProdutoComposicao.Clear();
  edtDescricaoProdutoComposicao.Clear();
  edtVlCustoComposicao.Clear();
  edtAlturaComposicao.Text := '0';
  edtLarguraComposicao.Text := '0';

  edtAlturaComposicao.Enabled := False;
  edtLarguraComposicao.Enabled := False;

  edtQuantidadeComposicao.Text := '1';
end;

procedure TTelaCadastroProduto.LocalizarProdutoPeloIdentificador();
var
  lProduto: TProduto;
begin
  lProduto := FDAOProduto.Find(edtIdProdutoComposicao.ToInteger);

  try
    MensagemCritica(
      (lProduto.Id = 0),
      'Produto n?o localizado.',
      edtIdProdutoComposicao);

     PreencherCamposComposicao(lProduto);
  finally
    lProduto.Free();
  end;
end;

procedure TTelaCadastroProduto.PreencherCamposComposicao(const pProduto: TProduto);
begin
  edtIdProdutoComposicao.Text := pProduto.id.ToString;
  edtDescricaoProdutoComposicao.Text := pProduto.Descricao;
  edtVlCustoComposicao.Text := pProduto.PrecoVenda.ValorMonetario;

  edtAlturaComposicao.Enabled := (pProduto.UnidadeCompra = 'Metro Quadrado');
  edtLarguraComposicao.Enabled := edtAlturaComposicao.Enabled;

  edtQuantidadeComposicao.Text := IfThen(edtAlturaComposicao.Enabled, '0', '1');

  if (edtAlturaComposicao.Enabled) then
    edtAlturaComposicao.Focar
  else
    edtQuantidadeComposicao.Focar();
end;

procedure TTelaCadastroProduto.CalcularQuantidadeMetroQuadrado(Sender: TObject);
begin
  if ((edtAlturaComposicao.ToFloat = 0) or (edtLarguraComposicao.ToFloat = 0)) then
    Exit();

  edtQuantidadeComposicao.Text := ((edtAlturaComposicao.ToFloat() / 100) * (edtLarguraComposicao.ToFloat() / 100)).ToString;

end;

procedure TTelaCadastroProduto.FormCreate(Sender: TObject);
begin
  inherited;
  FDAOProduto := TDAOProduto.NovaInstancia();
  FDAOSalario := TDAOGenerico<TSalario>.NovaInstancia();
  FDAOConfiguracao := TDAOConfiguraco.NovaInstancia();

  pcProdutoComplemento.ActivePageIndex := 0;
  cdsComposicao.CreateDataSet();
  FValorTotalInsumo := 0;
end;

procedure TTelaCadastroProduto.PreencherCampos(pProduto: TProduto);
var
  lProdutoComposicao: TProdutoComposicao;
begin
  edtIdProduto.Text := pProduto.Id.ToString;
  edtDescricaoProduto.Text := pProduto.Descricao;

  cbUnidadeCompra.ItemIndex := cbUnidadeCompra.Items.IndexOf(pProduto.UnidadeCompra);
  edtQtEmbalagemCompra.Text := pProduto.QtEmbalagemCompra.ToString;
  edtAltura.Text := pProduto.Altura.ToString;
  edtLargura.Text := pProduto.Largura.ToString;
  edtPreco.Text := pProduto.PrecoMetroQuadrado.ValorMonetario;
  edtCustoProduto.Text := pProduto.ValorCompra.ValorMonetario;
  edtVlFreteCompra.Text := pProduto.VlFreteCompra.ValorMonetario;
  edtAcrescimoDesconto.Text := pProduto.AcrescimoDescontoCompra.ValorMonetario;
  edtCustoReposicao.Text := pProduto.CustoReposicao.ValorMonetario;
  edtCustoReposicaoUnitario.Text := pProduto.CustoReposicaoUnitario.ValorMonetario;
  edtCustoResposicaoProduto.Text := pProduto.CustoReposicaoUnitario.ValorMonetario;
  dtDataCompra.DateTime := pProduto.DataCompra;

  edtAcrescimoDescontoVenda.Text := pProduto.AcrescimoDescontoVenda.ValorMonetario;
  edtVlPrecoVenda.Text := pProduto.PrecoVenda.ValorMonetario;
  edtTempoMontagem.Text := pProduto.TempoMontagem.ToString;
  edtCustoMinuto.Text := pProduto.CustoMinuto.ValorMonetario;
  edtCustoMontagem.Text := pProduto.CustoMontagem.ValorMonetario;
  edtMargemLucro.Text := pProduto.MargemLucro.ToString;

  cdsComposicao.EmptyDataSet();
  if (CharToBoolean(pProduto.PossuiComposicao)) then
    for lProdutoComposicao in pProduto.ProdutosComposicao do
    begin
      cdsComposicao.Append();
      cdsComposicaoCodigo.AsInteger := lProdutoComposicao.IdentificadorProdutoComposicao;
      cdsComposicaoDescricao.AsString := lProdutoComposicao.Descricao;
      cdsComposicaoCusto.AsCurrency := lProdutoComposicao.ValorCusto;
      cdsComposicaoAltura.AsInteger := lProdutoComposicao.Altura;
      cdsComposicaoLargura.AsInteger := lProdutoComposicao.Largura;
      cdsComposicaoQuantidade.AsFloat := lProdutoComposicao.Quantidade;
      cdscomposicaoValorItem.AsCurrency := lProdutoComposicao.ValorTotalItem();
      cdsComposicao.Post();
    end;

  lblVlPrecoCompra.Caption := pProduto.custoReposicao.ValorMonetarioCifrao();
  lblVlPrecoVenda.Caption := pProduto.PrecoVenda.ValorMonetarioCifrao();
end;


procedure TTelaCadastroProduto.PreencherObjeto(var pProduto: TProduto);
var
  lProdutoComposicao: TProdutoComposicao;
begin
  pProduto.Id := edtIdProduto.toInteger;
  pProduto.Descricao := edtDescricaoProduto.Text;

  pProduto.UnidadeCompra := cbUnidadeCompra.Text;
  pProduto.QtEmbalagemCompra := edtQtEmbalagemCompra.ToFloat;
  pProduto.Altura := edtAltura.ToInteger;
  pProduto.Largura := edtLargura.ToInteger;
  pProduto.PrecoMetroQuadrado := edtPreco.ToCurrency;
  pProduto.ValorCompra := edtCustoProduto.ToCurrency;
  pProduto.VlFreteCompra := edtVlFreteCompra.ToCurrency;
  pProduto.AcrescimoDescontoCompra := edtAcrescimoDesconto.ToCurrency;
  pProduto.DataCompra := dtDataCompra.DateTime;

  pProduto.PossuiComposicao := BooleanToChar(not cdsComposicao.IsEmpty);

  pProduto.AcrescimoDescontoVenda := edtAcrescimoDescontoVenda.ToCurrency;
  pProduto.PrecoVenda := edtVlPrecoVenda.ToCurrency;
  pProduto.TempoMontagem := edtTempoMontagem.ToInteger;
  pProduto.CustoMinuto := edtCustoMinuto.ToCurrency;
  pProduto.MargemLucro := edtMargemLucro.ToFloat;

  if (CharToBoolean(pProduto.PossuiComposicao)) then
  begin
    cdsComposicao.DisableControls();
    cdsComposicao.First();

    while (not cdsComposicao.Eof) do
    begin
      lProdutoComposicao := TProdutoComposicao.Create();
      lProdutoComposicao.IdentificadorProdutoComposicao := cdsComposicaoCodigo.AsInteger;
      lProdutoComposicao.Descricao := cdsComposicaoDescricao.AsString;
      lProdutoComposicao.ValorCusto := cdsComposicaoCusto.AsCurrency;
      lProdutoComposicao.Altura := cdsComposicaoAltura.AsInteger;
      lProdutoComposicao.Largura := cdsComposicaoLargura.AsInteger;
      lProdutoComposicao.Quantidade := cdsComposicaoQuantidade.AsFloat;
      pProduto.ProdutosComposicao.Add(lProdutoComposicao);

      cdsComposicao.Next();
    end;

    cdsComposicao.EnableControls();
  end;
end;

procedure TTelaCadastroProduto.tsProdutoComposicaoShow(Sender: TObject);
begin
  inherited;
  dbgProdutoComposicao.AjustarColunas(1);
end;

procedure TTelaCadastroProduto.tsProdutoCustoShow(Sender: TObject);
begin
  inherited;
  cbUnidadeCompraChange(nil);
end;

procedure TTelaCadastroProduto.CalcularPreco(Sender: TObject);
var
  lMetroQuadradoCompra,
  lValorMetroQuadrado: Currency;
begin
  if ((edtAltura.ToFloat = 0) or (edtLargura.ToFloat = 0) or (edtPreco.ToCurrency = 0)) then
  begin
    lValorMetroQuadrado := 0;
    edtCustoProduto.Text := lValorMetroQuadrado.ValorMonetario;
    Exit();
  end;

  lMetroQuadradoCompra := (edtAltura.ToFloat() / 100) * (edtLargura.ToFloat() / 100);
  lValorMetroQuadrado := (edtPreco.ToCurrency() / lMetroQuadradoCompra);

  if (lValorMetroQuadrado > 0) then
    edtCustoProduto.Text := lValorMetroQuadrado.ValorMonetario;
end;

end.
