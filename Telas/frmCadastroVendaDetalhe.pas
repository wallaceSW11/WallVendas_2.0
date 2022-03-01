unit frmCadastroVendaDetalhe;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls, Vcl.ComCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, WallVendas.Helper.DBGrid,
  WallVendas.Model.Venda, WallVendas.DAO.Venda, Datasnap.DBClient, WallVendas.Model.VendaItem,
  System.Generics.Collections, WallVendas.Model.VendaPagamento;

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
  private
    FIdVenda: Integer;
    FDAOVenda: IDAOVenda;
    procedure PreencherCampos;
  public
    class procedure Exibir(const pIdentificadorVenda: Integer = 0);
  end;

var
  TelaCadastroVendaDetalhe: TTelaCadastroVendaDetalhe;

implementation

{$R *.dfm}

procedure TTelaCadastroVendaDetalhe.btnCancelarClick(Sender: TObject);
begin
  Close();
end;

procedure TTelaCadastroVendaDetalhe.btnOkClick(Sender: TObject);
begin
  Close();
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
  cdsProduto.CreateDataSet();
  cdsRecebimento.CreateDataSet();
end;

procedure TTelaCadastroVendaDetalhe.FormResize(Sender: TObject);
begin
  dbgProduto.AjustarColunas(1);
  dbgRecebimento.AjustarColunas(1);
end;

procedure TTelaCadastroVendaDetalhe.FormShow(Sender: TObject);
begin
  if (FIdVenda = 0) then
    Self.Caption := Self.Caption + ' (Novo)'
  else
    Self.Caption := Self.Caption + ' (Alteração)';

  edtIdVenda.Text := FIdVenda.ToString();

  PreencherCampos();

end;

procedure TTelaCadastroVendaDetalhe.PreencherCampos();
var
  lVenda: TVenda;
  lVendaItem: TVendaItem;
  lRecebimento: TVendaPagamento;
begin
  lVenda := FDAOVenda.Find(FIdVenda);

  try
    cbbTipoVenda.Text := lVenda.Tipo;
    cbbStatusVenda.Text := lVenda.Status;
    dtpCadastroVenda.DateTime := lVenda.DataCadastro;
    dtpEntregaVenda.DateTime := lVenda.DataEntrega;
    edtIdPessoa.Text := lVenda.IdentificadorPessoa.ToString();

    cdsProduto.DisableControls();
    cdsProduto.EmptyDataSet();

    for lVendaItem in lVenda.ItensVenda do
    begin
      cdsProduto.Append();
      cdsProdutoIdDocumento.AsInteger := lVendaItem.IdentificadorDocumento;
      cdsProdutoIdProduto.AsInteger := lVendaItem.IdentificadorProduto;
      cdsProdutoDescricaoProduto.AsString := lVendaItem.DescricaoProduto;
      cdsProdutoQtItem.AsFloat := lVendaItem.QuantidadeItem;
      cdsProdutoVlUnitario.AsCurrency := lVendaItem.ValorUnitario;
      cdsProdutoVlDesconto.AsCurrency := lVendaItem.ValorDesconto;
      cdsProdutoVlAcrescimo.AsCurrency := lVendaItem.ValorAcrescimo;
      cdsProdutoVlItem.AsCurrency := lVendaItem.ValorItem;
      cdsProdutoVlSalario.AsCurrency := lVendaItem.ValorSalario;
      cdsProdutoVlLucro.AsCurrency := lVendaItem.ValorLucro;
      cdsProdutoVlTotalInsumo.AsCurrency := lVendaItem.ValorTotalInsumo;
      cdsProduto.Post();
    end;

    cdsProduto.First();
    cdsProduto.EnableControls();

    cdsRecebimento.DisableControls();
    cdsRecebimento.EmptyDataSet();

    for lRecebimento in lVenda.Recebimentos do
    begin
      cdsRecebimento.Append();
      cdsRecebimentoDsFormaPagamento.AsString := lRecebimento.DescricaoFormaPagamento;
      cdsRecebimentoValorRecebimento.AsCurrency := lRecebimento.ValorPagamento;
      cdsRecebimento.Post();
    end;

    cdsRecebimento.First();
    cdsRecebimento.EnableControls();

    dsObservacao.Text := lVenda.Observacao;


  finally
    lVenda.Free();
  end;
end;

end.
