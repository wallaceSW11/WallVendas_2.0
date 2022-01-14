unit frmCadastroProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frmCadastroPadrao, Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls,
  LibTypes, wallvendas.Model.Produto, frmPesquisaPadrao, System.Generics.Collections, WallVendas.DAO.Generico;

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
    grdProdutoComposicao: TDBGrid;
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
    procedure btnPesquisarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FDAOProduto: IDAO<TProduto>;
    procedure PreencherCampos(const pProduto: TProduto);
  public
    { Public declarations }
  end;

var
  TelaCadastroProduto: TTelaCadastroProduto;

implementation

{$R *.dfm}

procedure TTelaCadastroProduto.btnPesquisarClick(Sender: TObject);
var
  lDadoLocalizado: TDadoLocalizado;
  lProduto: TProduto;
begin
//  lProduto := TTelaPesquisaPadrao.Pesquisa<TProduto>();   //['id', 'Descricao', 'VlPrecoVenda']
  lDadoLocalizado := TTelaPesquisaPadrao.Pesquisa<TProduto>(['id', 'Descricao', 'VlPrecoVenda']);

  if (lDadoLocalizado.Codigo.IsEmpty()) then
    Exit();

  lProduto := FDAOProduto.FindOne(lDadoLocalizado.Codigo.ToInteger());

  PreencherCampos(lProduto);

  Self.HabilitarCamposPesquisaValida();
end;

procedure TTelaCadastroProduto.FormCreate(Sender: TObject);
begin
  inherited;
  FDAOProduto := TDAOGenerico<TProduto>.NovaInstancia();
end;

procedure TTelaCadastroProduto.PreencherCampos(const pProduto: TProduto);
begin
  edtIdProduto.Text := pProduto.Id.ToString;
  edtDescricaoProduto.Text := pProduto.Descricao;
  lblVlPrecoVenda.Caption := FloatToStr(pProduto.PrecoVenda);
  chkPossuiComposicao.Checked := pProduto.PossuiComposicao = '1';
end;


end.
