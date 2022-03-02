unit frmCadastroVendaDetalhe;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls, Vcl.ComCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, WallVendas.Helper.DBGrid,
  WallVendas.Model.Venda, WallVendas.DAO.Venda, Datasnap.DBClient, WallVendas.Model.VendaItem,
  System.Generics.Collections, WallVendas.Model.VendaPagamento, WallVendas.Helper.Numbers,
  LibTypes, frmPesquisaPadrao, WallVendas.Model.Pessoa, WallVendas.Helper.TEdit, WallVendas.DAO.Generico,
  LibMessages, frmCadastroVendaProduto, WallVendas.Helper.DataSet, frmCadastroVendaRecebimento;

type
  TTelaCadastroVendaDetalhe = class(TForm)
    btnFinalizar: TSpeedButton;
    btnOk: TSpeedButton;
    btnCancelar: TSpeedButton;
    lblDtVenda: TLabel;
    lblDtEntrega: TLabel;
    lblTipoVenda: TLabel;
    lblStatusVenda: TLabel;
    lblCodigoVenda: TLabel;
    dtpCadastroVenda: TDateTimePicker;
    dtpEntregaVenda: TDateTimePicker;
    cbbTipoVenda: TComboBox;
    cbbStatusVenda: TComboBox;
    edtIdVenda: TEdit;
    btnLocalizarPessoaVenda: TSpeedButton;
    lblCodigoPessoa: TLabel;
    lblNomePessoa: TLabel;
    edtIdPessoa: TEdit;
    edtNomePessoa: TEdit;
    dbgProduto: TDBGrid;
    pnlProduto: TPanel;
    btnAdicionarProduto: TBitBtn;
    btnEditarProduto: TBitBtn;
    btnRemoverProduto: TBitBtn;
    btnRelatorio: TBitBtn;
    pcVenda: TPageControl;
    tsRecebimento: TTabSheet;
    dbgRecebimento: TDBGrid;
    pnlFormaPagamento: TPanel;
    btnRemoverRecebimento: TBitBtn;
    btnEditarRecebimento: TBitBtn;
    btnAdicionarRecebimento: TBitBtn;
    tsObservacao: TTabSheet;
    dsObservacao: TRichEdit;
    tsValores: TTabSheet;
    lblSalario: TLabel;
    lblVlSalario: TLabel;
    lblLucro: TLabel;
    lblVlLucro: TLabel;
    lblTotalInsumo: TLabel;
    lblVlTotalInsumo: TLabel;
    lblItens: TLabel;
    lblQtItens: TLabel;
    lblValorTotalProduto: TLabel;
    lblVlTotalProduto: TLabel;
    Label1: TLabel;
    lblQuantidadeTotal: TLabel;
    lblAcrescimo: TLabel;
    lblDesconto: TLabel;
    lblValorTotal: TLabel;
    edtVlAcrescimoVenda: TEdit;
    edtVlDescontoVenda: TEdit;
    edtVlTotalVenda: TEdit;
    lblTotalRecebimento: TLabel;
    lblVlTotalRecebimento: TLabel;
    dsProduto: TDataSource;
    cdsProduto: TClientDataSet;
    cdsProdutoid: TIntegerField;
    cdsProdutoIdDocumento: TIntegerField;
    cdsProdutoIdProduto: TIntegerField;
    cdsProdutoDescricaoProduto: TStringField;
    cdsProdutoQtItem: TFloatField;
    cdsProdutoVlUnitario: TFloatField;
    cdsProdutoVlItem: TFloatField;
    cdsProdutoVlDesconto: TFloatField;
    cdsProdutoVlAcrescimo: TFloatField;
    cdsProdutoVlSalario: TCurrencyField;
    cdsProdutoVlLucro: TCurrencyField;
    cdsProdutoVlTotalInsumo: TCurrencyField;
    dsRecebimento: TDataSource;
    cdsRecebimento: TClientDataSet;
    cdsRecebimentoid: TIntegerField;
    cdsRecebimentoDsFormaPagamento: TStringField;
    cdsRecebimentoValorRecebimento: TCurrencyField;
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnLocalizarPessoaVendaClick(Sender: TObject);
    procedure edtIdPessoaExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnAdicionarProdutoClick(Sender: TObject);
    procedure cdsProdutoAfterPost(DataSet: TDataSet);
    procedure dbgProdutoDblClick(Sender: TObject);
    procedure dbgProdutoCellClick(Column: TColumn);
    procedure btnRemoverProdutoClick(Sender: TObject);
    procedure cdsProdutoAfterDelete(DataSet: TDataSet);
    procedure dbgRecebimentoCellClick(Column: TColumn);
    procedure btnAdicionarRecebimentoClick(Sender: TObject);
    procedure btnRemoverRecebimentoClick(Sender: TObject);
    procedure cdsRecebimentoAfterDelete(DataSet: TDataSet);
    procedure cdsRecebimentoAfterPost(DataSet: TDataSet);
    procedure btnEditarRecebimentoClick(Sender: TObject);
    procedure dbgRecebimentoDblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    FIdVenda: Integer;
    FDAOVenda: IDAOVenda;
    FDAOPessoa: IDAO<TPessoa>;
    FValorTotalRecebimento: Currency;
    FValorSalario: Currency;
    FValorLucro: Currency;
    FValorTotalInsumos: Currency;
    procedure PreencherCampos;
    procedure PreencherGridVendaItem(const pItems: TObjectList<TVendaItem>);
    procedure AlterarGridVendaItem(const pVendaItem: TVendaItem; const pEdicao: Boolean = False);
    procedure PreencherGridRecebimento(const pRecebimentos: TObjectList<TVendaPagamento>);
    procedure AtualizarValoresTotalVenda;
    function VendaItemSelecionado: TVendaItem;
    procedure TratarBotoesProduto;
    procedure TratarBotoesRecebimento;
    procedure AlterarGridRecebimento(const pRecebimento: TVendaPagamento; const pEdicao: Boolean = False);
    procedure AtualizarValorRecebimento;
    function RecebimentoSelecionado: TVendaPagamento;
    procedure ValidarVenda;
    procedure PreencherObjetoVenda;
    procedure PreencherObjetoVendaItem(var pVenda: TVenda);
    procedure PreencherObjetoVendaPagamento(var pVenda: TVenda);
  public
    class procedure Exibir(const pIdentificadorVenda: Integer = 0);
  end;

var
  TelaCadastroVendaDetalhe: TTelaCadastroVendaDetalhe;

implementation

{$R *.dfm}

procedure TTelaCadastroVendaDetalhe.btnAdicionarProdutoClick(Sender: TObject);
var
  lListaVendaItem: TObjectList<TVendaItem>;
begin
  lListaVendaItem := TTelaCadastroVendaProduto.Exibir();
  PreencherGridVendaItem(lListaVendaItem);
end;

procedure TTelaCadastroVendaDetalhe.btnAdicionarRecebimentoClick(Sender: TObject);
var
  lRecebimentos: TObjectList<TVendaPagamento>;
begin
  MensagemCritica(
    (FValorTotalRecebimento = edtVlTotalVenda.ToCurrency),
    'Já foi informado o valor total da venda.');

  lRecebimentos := TTelaCadastroVendaRecebimento.Exibir(edtVlTotalVenda.ToCurrency - FValorTotalRecebimento);

  PreencherGridRecebimento(lRecebimentos);
end;

procedure TTelaCadastroVendaDetalhe.btnCancelarClick(Sender: TObject);
begin
  Close();
end;

procedure TTelaCadastroVendaDetalhe.btnEditarRecebimentoClick(Sender: TObject);
var
  lRecebimento: TVendaPagamento;
begin
  if(cdsRecebimento.IsEmpty()) then
    Exit();

  lRecebimento :=
    TTelaCadastroVendaRecebimento.Exibir(
      RecebimentoSelecionado,
      edtVlTotalVenda.ToCurrency,
      (FValorTotalRecebimento - RecebimentoSelecionado.ValorPagamento));

  if (lRecebimento <> nil) then
    AlterarGridRecebimento(lRecebimento, True);
end;

function TTelaCadastroVendaDetalhe.RecebimentoSelecionado(): TVendaPagamento;
begin
  Result := TVendaPagamento.Create();
  Result.DescricaoFormaPagamento := cdsRecebimentoDsFormaPagamento.AsString;
  Result.ValorPagamento := cdsRecebimentoValorRecebimento.AsCurrency;
end;

procedure TTelaCadastroVendaDetalhe.btnLocalizarPessoaVendaClick(Sender: TObject);
var
  lDadoLocalizado: TDadoLocalizado;
begin
  lDadoLocalizado := TTelaPesquisaPadrao.Pesquisa<TPessoa>(['id', 'Nome']);

  if (lDadoLocalizado.Codigo.IsEmpty()) then
    Exit;

  edtIdPessoa.Text := lDadoLocalizado.Codigo;
  edtNomePessoa.Text := lDadoLocalizado.Descricao;

end;

procedure TTelaCadastroVendaDetalhe.btnOkClick(Sender: TObject);
begin
  ValidarVenda();

  PreencherObjetoVenda();





  Close();
end;

procedure TTelaCadastroVendaDetalhe.PreencherObjetoVenda();
var
  lVenda: TVenda;
begin
  lVenda := TVenda.Create();

  lVenda.Id := edtIdVenda.ToInteger;
  lVenda.Tipo := TTipoVenda_Helper.TipoVendaChar(TTipoVenda(cbbTipoVenda.ItemIndex));
  lVenda.Status := TStatusVenda_Helper.StatusVendaChar(TStatusVenda(cbbStatusVenda.ItemIndex));
  lVenda.DataCadastro := dtpCadastroVenda.DateTime;
  lVenda.DataEntrega := dtpEntregaVenda.DateTime;

  lVenda.IdentificadorPessoa := edtIdPessoa.toInteger;

  PreencherObjetoVendaItem(lVenda);
  PreencherObjetoVendaPagamento(lVenda);

  lVenda.ValorDescontoVenda := edtVlDescontoVenda.ToCurrency;
  lVenda.ValorAcrescimoVenda := edtVlAcrescimoVenda.ToCurrency;
  lVenda.ValorTotalVenda := edtVlTotalVenda.ToCurrency;

  lVenda.Observacao := dsObservacao.Text;
  lVenda.ValorSalario := FValorSalario;
  lVenda.ValorLucro := FValorLucro;
  lVenda.ValorTotalInsumo := FValorTotalInsumos;

  if (edtIdVenda.ToInteger = 0) then
    FDAOVenda.Insert(lVenda)
  else
    FDAOVenda.Update(lVenda);

end;

procedure TTelaCadastroVendaDetalhe.PreencherObjetoVendaItem(var pVenda: TVenda);
var
  lVendaItem: TVendaItem;
begin
  cdsProduto.DisableControls();
  cdsProduto.First();

  while (not cdsProduto.Eof) do
  begin
    lVendaItem := TVendaItem.Create();
    lVendaItem.IdentificadorDocumento := edtIdVenda.ToInteger;
    lVendaItem.IdentificadorProduto := cdsProdutoIdProduto.AsInteger;
    lVendaItem.DescricaoProduto := cdsProdutoDescricaoProduto.AsString;
    lVendaItem.QuantidadeItem := cdsProdutoQtItem.AsFloat;
    lVendaItem.ValorUnitario := cdsProdutoVlUnitario.AsCurrency;
    lVendaItem.ValorDesconto := cdsProdutoVlDesconto.AsCurrency;
    lVendaItem.ValorAcrescimo := cdsProdutoVlAcrescimo.AsCurrency;
    lVendaItem.ValorItem := cdsProdutoVlItem.AsCurrency;
    lVendaItem.ValorSalario := cdsProdutoVlSalario.AsCurrency;
    lVendaItem.ValorLucro := cdsProdutoVlLucro.AsCurrency;
    lVendaItem.ValorTotalInsumo := cdsProdutoVlTotalInsumo.AsCurrency;
    pVenda.ItensVenda.Add(lVendaItem);

    cdsProduto.Next;
  end;

  cdsProduto.First();
  cdsProduto.EnableControls();
end;

procedure TTelaCadastroVendaDetalhe.PreencherObjetoVendaPagamento(var pVenda: TVenda);
var
  lRecebimento: TVendaPagamento;
begin
  cdsRecebimento.DisableControls();
  cdsRecebimento.First();

  while (not cdsRecebimento.Eof) do
  begin
    lRecebimento := TVendaPagamento.Create();
    lRecebimento.IdentificadorDocumento := edtIdVenda.ToInteger;
    lRecebimento.DescricaoFormaPagamento := cdsRecebimentoDsFormaPagamento.AsString;
    lRecebimento.ValorPagamento := cdsRecebimentoValorRecebimento.AsCurrency;
    pVenda.Recebimentos.Add(lRecebimento);

    cdsRecebimento.Next();
  end;

  cdsRecebimento.First();
  cdsRecebimento.EnableControls();

end;

procedure TTelaCadastroVendaDetalhe.ValidarVenda();
var
  lOcorrencias: TStringList;
begin
  lOcorrencias := TStringList.Create();
  lOcorrencias.Add('Foram encontradas as seguintes ocorrências:' + sLineBreak + sLineBreak);

  if (edtNomePessoa.IsEmpty()) then
    lOcorrencias.Add(' - Não foi informado a pessoa.' + sLineBreak);

  if (cdsProduto.IsEmpty()) then
    lOcorrencias.Add(' - Não foi informado nenhum produto.' + sLineBreak);

  MensagemCritica(
    (lOcorrencias.Count > 1),
    lOcorrencias.Text);

end;

procedure TTelaCadastroVendaDetalhe.btnRemoverProdutoClick(Sender: TObject);
begin
  if (Confirma('Confirma remover o produto selecionado?', 'Remover produto')) then
    cdsProduto.Delete();
end;

procedure TTelaCadastroVendaDetalhe.btnRemoverRecebimentoClick(Sender: TObject);
begin
  if (Confirma('Confirma remover o recebimento selecionado?', 'Remover recebimento')) then
    cdsRecebimento.Delete();
end;

procedure TTelaCadastroVendaDetalhe.cdsProdutoAfterDelete(DataSet: TDataSet);
begin
  AtualizarValoresTotalVenda();
  TratarBotoesProduto();
end;

procedure TTelaCadastroVendaDetalhe.cdsProdutoAfterPost(DataSet: TDataSet);
begin
  AtualizarValoresTotalVenda();
end;

procedure TTelaCadastroVendaDetalhe.cdsRecebimentoAfterDelete(DataSet: TDataSet);
begin
  AtualizarValorRecebimento();
  TratarBotoesRecebimento();
end;

procedure TTelaCadastroVendaDetalhe.cdsRecebimentoAfterPost(DataSet: TDataSet);
begin
  AtualizarValorRecebimento();
end;

procedure TTelaCadastroVendaDetalhe.AtualizarValorRecebimento();
var
  lRecebimento: Currency;
begin
  lRecebimento := 0;

  cdsRecebimento.DisableControls();
  cdsRecebimento.First();

  while (not cdsRecebimento.Eof) do
  begin
    lRecebimento := lRecebimento + cdsRecebimentoValorRecebimento.AsCurrency;

    cdsRecebimento.Next();
  end;

  cdsRecebimento.First();
  cdsRecebimento.EnableControls();

  FValorTotalRecebimento := lRecebimento;
  lblVlTotalRecebimento.Caption := FValorTotalRecebimento.ValorMonetarioCifrao;
end;

procedure TTelaCadastroVendaDetalhe.dbgProdutoCellClick(Column: TColumn);
begin
  TratarBotoesProduto();
end;

procedure TTelaCadastroVendaDetalhe.dbgProdutoDblClick(Sender: TObject);
var
  lVendaItem: TVendaItem;
begin
  if (cdsProduto.IsEmpty()) then
    Exit;

  lVendaItem := TTelaCadastroVendaProduto.Exibir(VendaItemSelecionado);

  if (lVendaItem <> nil) then
    AlterarGridVendaItem(lVendaItem, True);
end;

procedure TTelaCadastroVendaDetalhe.dbgRecebimentoCellClick(Column: TColumn);
begin
  TratarBotoesRecebimento();
end;

procedure TTelaCadastroVendaDetalhe.dbgRecebimentoDblClick(Sender: TObject);
begin
  btnEditarRecebimentoClick(nil);
end;

function TTelaCadastroVendaDetalhe.VendaItemSelecionado(): TVendaItem;
begin
  Result := TVendaItem.Create();
  Result.IdentificadorDocumento := cdsProdutoIdDocumento.AsInteger;
  Result.IdentificadorProduto := cdsProdutoIdProduto.AsInteger;
  Result.DescricaoProduto := cdsProdutoDescricaoProduto.AsString;
  Result.QuantidadeItem := cdsProdutoQtItem.AsFloat;
  Result.ValorUnitario := cdsProdutoVlUnitario.AsCurrency;
  Result.ValorDesconto := cdsProdutoVlDesconto.AsCurrency;
  Result.ValorAcrescimo := cdsProdutoVlAcrescimo.AsCurrency;
  Result.ValorItem := cdsProdutoVlItem.AsCurrency;
  Result.ValorSalario := cdsProdutoVlSalario.AsCurrency;
  Result.ValorLucro := cdsProdutoVlLucro.AsCurrency;
  Result.ValorTotalInsumo := cdsProdutoVlTotalInsumo.AsCurrency;
end;

procedure TTelaCadastroVendaDetalhe.AtualizarValoresTotalVenda();
var
  lQuantidadeTotal: Double;
  lValorTotalItens,
  lValorSalario,
  lValorLucro,
  lValorTotalInsumo: Currency;
begin
  lQuantidadeTotal := 0;
  lValorTotalItens := 0;
  lValorSalario := 0;
  lValorLucro := 0;
  lValorTotalInsumo := 0;

  cdsProduto.DisableControls();
  cdsProduto.First();

  while (not cdsProduto.Eof) do
  begin
    lValorTotalItens := lValorTotalItens + cdsProdutoVlItem.AsCurrency;
    lQuantidadeTotal := lQuantidadeTotal + cdsProdutoQtItem.AsFloat;
    lValorSalario := lValorSalario + cdsProdutoVlSalario.AsCurrency;
    lValorLucro := lValorLucro + cdsProdutoVlLucro.AsCurrency;
    lValorTotalInsumo := lValorTotalInsumo + cdsProdutoVlTotalInsumo.AsCurrency;

    cdsProduto.Next();
  end;

  cdsProduto.First();
  cdsProduto.EnableControls();

  lblQtItens.Caption := cdsProduto.RecordCount.ToString;
  lblQuantidadeTotal.Caption := lQuantidadeTotal.ToString;
  lblVlTotalProduto.Caption := lValorTotalItens.ValorMonetarioCifrao;

  edtVlTotalVenda.Text :=
    Currency(lValorTotalItens + edtVlAcrescimoVenda.ToCurrency - edtVlDescontoVenda.ToCurrency).ValorMonetario;

  FValorSalario := lValorSalario;
  FValorLucro := lValorLucro;
  FValorTotalInsumos := lValorTotalInsumo;

  lblVlSalario.Caption := FValorSalario.ValorMonetarioCifrao;
  lblVlLucro.Caption := FValorLucro.ValorMonetarioCifrao;
  lblVlTotalInsumo.Caption := FValorTotalInsumos.ValorMonetarioCifrao;
end;


procedure TTelaCadastroVendaDetalhe.edtIdPessoaExit(Sender: TObject);
var
  lPessoa: TPessoa;
begin
  if (edtIdPessoa.IsEmpty()) then
  begin
    edtNomePessoa.Clear();
    Exit;
  end;

  lPessoa := FDAOPessoa.FindOne(edtIdPessoa.ToInteger);

  try
    MensagemCritica(
      (lPessoa.Id = 0),
      'Pessoa não encontrada.',
      edtIdPessoa);

    edtIdPessoa.Text := lPessoa.Id.ToString;
    edtNomePessoa.Text := lPessoa.Nome;
  finally
    lPessoa.Free();
  end;

end;

class procedure TTelaCadastroVendaDetalhe.Exibir(const pIdentificadorVenda: Integer);
begin
  TelaCadastroVendaDetalhe := TTelaCadastroVendaDetalhe.Create(nil);

  try
    TelaCadastroVendaDetalhe.FIdVenda := pIdentificadorVenda;
    TelaCadastroVendaDetalhe.ShowModal();
  finally
    TelaCadastroVendaDetalhe.Free();
  end;
end;

procedure TTelaCadastroVendaDetalhe.FormCreate(Sender: TObject);
begin
  pcVenda.ActivePageIndex := 0;
  FDAOVenda := TDAOVenda.NovaInstancia();
  FDAOPessoa := TDAOGenerico<TPessoa>.NovaInstancia();
  cdsProduto.CreateDataSet();
  cdsRecebimento.CreateDataSet();
  FValorTotalRecebimento := 0;
end;

procedure TTelaCadastroVendaDetalhe.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_ESCAPE) then
    Close();
end;

procedure TTelaCadastroVendaDetalhe.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if ((key = #13) and  (not(ActiveControl.ClassType = TMemo))) then
  Begin
    Key:= #0;
    Perform(Wm_NextDlgCtl,0,0);
  end;
end;

procedure TTelaCadastroVendaDetalhe.FormResize(Sender: TObject);
begin
  dbgProduto.AjustarColunas(1);
  dbgRecebimento.AjustarColunas(1);
end;

procedure TTelaCadastroVendaDetalhe.FormShow(Sender: TObject);
begin
  if (FIdVenda = 0) then
    begin
      Self.Caption := Self.Caption + ' (Novo)';
      dtpCadastroVenda.DateTime := Now();
      dtpEntregaVenda.DateTime := dtpCadastroVenda.DateTime;
      edtIdPessoa.Focar();
    end
  else
    begin
      Self.Caption := Self.Caption + ' (Alteração)';
      edtIdVenda.Text := FIdVenda.ToString();
      PreencherCampos();
    end;
end;

procedure TTelaCadastroVendaDetalhe.TratarBotoesProduto();
begin
  btnEditarProduto.Enabled := (not cdsProduto.IsEmpty());
  btnRemoverProduto.Enabled := btnEditarProduto.Enabled;
end;

procedure TTelaCadastroVendaDetalhe.TratarBotoesRecebimento();
begin
  btnEditarRecebimento.Enabled := (not cdsRecebimento.IsEmpty());
  btnRemoverRecebimento.Enabled := btnEditarRecebimento.Enabled;
end;

procedure TTelaCadastroVendaDetalhe.PreencherCampos();
var
  lVenda: TVenda;
begin
  lVenda := FDAOVenda.Find(FIdVenda);

  try
    cbbTipoVenda.ItemIndex := cbbTipoVenda.Items.IndexOf(TTipoVenda_Helper.TipoVendaExtenso(lVenda.Tipo));
    cbbStatusVenda.ItemIndex :=cbbStatusVenda.Items.IndexOf(TStatusVenda_Helper.StatusVendaExtenso(lVenda.Status));
    dtpCadastroVenda.DateTime := lVenda.DataCadastro;
    dtpEntregaVenda.DateTime := lVenda.DataEntrega;
    edtIdPessoa.Text := lVenda.IdentificadorPessoa.ToString();
    edtNomePessoa.Text := lVenda.Nome;

    PreencherGridVendaItem(lVenda.ItensVenda);

    PreencherGridRecebimento(lVenda.Recebimentos);

    lblQtItens.Caption := lVenda.TotalItens().ToString();
    lblQuantidadeTotal.Caption := lVenda.TotalProdutos().ToString();
    lblVlTotalProduto.Caption := lVenda.ValorTotalItem().ValorMonetarioCifrao();

    dsObservacao.Text := lVenda.Observacao;
    lblVlSalario.Caption := lVenda.ValorSalario.ValorMonetarioCifrao();
    lblVlLucro.Caption := lVenda.ValorLucro.ValorMonetarioCifrao();
    lblVlTotalInsumo.Caption := lVenda.ValorTotalInsumo.ValorMonetarioCifrao();

    edtVlAcrescimoVenda.Text := lVenda.ValorAcrescimoVenda.ValorMonetario();
    edtVlDescontoVenda.Text := lVenda.ValorDescontoVenda.ValorMonetario();
    edtVlTotalVenda.Text := lVenda.ValorTotalVenda.ValorMonetario();

    lblVlTotalRecebimento.Caption := lVenda.ValorTotalRecebimento().ValorMonetarioCifrao();

  finally
    lVenda.Free();
  end;
end;

procedure TTelaCadastroVendaDetalhe.PreencherGridVendaItem(const pItems: TObjectList<TVendaItem>);
var
  lVendaItem: TVendaItem;
begin
  cdsProduto.DisableControls();

  try
    for lVendaItem in pItems do
      AlterarGridVendaItem(lVendaItem);

  finally
    cdsProduto.First();
    cdsProduto.EnableControls();
  end;

end;

procedure TTelaCadastroVendaDetalhe.PreencherGridRecebimento(const pRecebimentos: TObjectList<TVendaPagamento>);
var
  lRecebimento: TVendaPagamento;
begin
  cdsRecebimento.DisableControls();

  for lRecebimento in pRecebimentos do
    AlterarGridRecebimento(lRecebimento);

  cdsRecebimento.First();
  cdsRecebimento.EnableControls();
end;

procedure TTelaCadastroVendaDetalhe.AlterarGridRecebimento(const pRecebimento: TVendaPagamento; const pEdicao: Boolean);
begin
  cdsRecebimento.Editar(pEdicao);
  cdsRecebimentoDsFormaPagamento.AsString := pRecebimento.DescricaoFormaPagamento;
  cdsRecebimentoValorRecebimento.AsCurrency := pRecebimento.ValorPagamento;
  cdsRecebimento.Post();
end;

procedure TTelaCadastroVendaDetalhe.AlterarGridVendaItem(const pVendaItem: TVendaItem; const pEdicao: Boolean);
begin
  cdsProduto.Editar(pEdicao);
  cdsProdutoIdDocumento.AsInteger := pVendaItem.IdentificadorDocumento;
  cdsProdutoIdProduto.AsInteger := pVendaItem.IdentificadorProduto;
  cdsProdutoDescricaoProduto.AsString := pVendaItem.DescricaoProduto;
  cdsProdutoQtItem.AsFloat := pVendaItem.QuantidadeItem;
  cdsProdutoVlUnitario.AsCurrency := pVendaItem.ValorUnitario;
  cdsProdutoVlDesconto.AsCurrency := pVendaItem.ValorDesconto;
  cdsProdutoVlAcrescimo.AsCurrency := pVendaItem.ValorAcrescimo;
  cdsProdutoVlItem.AsCurrency := pVendaItem.ValorItem;
  cdsProdutoVlSalario.AsCurrency := pVendaItem.ValorSalario;
  cdsProdutoVlLucro.AsCurrency := pVendaItem.ValorLucro;
  cdsProdutoVlTotalInsumo.AsCurrency := pVendaItem.ValorTotalInsumo;
  cdsProduto.Post();
end;

end.
