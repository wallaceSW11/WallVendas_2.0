unit frmCadastroVendaProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  WallVendas.Model.VendaItem, WallVendas.Model.Produto, WallVendas.Helper.Numbers,
  WallVendas.Helper.TEdit, frmPesquisaPadrao, LibTypes, WallVendas.DAO.Produto,
  LibMessages, System.Generics.Collections;

type
  TTelaCadastroVendaProduto = class(TForm)
    lblIdProduto: TLabel;
    lblDescricaoProduto: TLabel;
    btnLocalizarProduto: TSpeedButton;
    lblPrecoVenda: TLabel;
    lblQuantidade: TLabel;
    lblDesconto: TLabel;
    lblAcrescimo: TLabel;
    lblTotalItem: TLabel;
    btnEditarDescicaoProduto: TSpeedButton;
    lblSalario: TLabel;
    lblVlSalario: TLabel;
    lblLucro: TLabel;
    lblVlLucro: TLabel;
    lblTotalInsumo: TLabel;
    lblVlTotalInsumo: TLabel;
    lblEstoque: TLabel;
    lblQtEstoque: TLabel;
    btnEstoque: TSpeedButton;
    edtIdProduto: TEdit;
    edtDescricaoProduto: TEdit;
    edtVlUnitario: TEdit;
    edtQtItem: TEdit;
    edtVlDesconto: TEdit;
    edtVlAcrescimo: TEdit;
    edtVlTotalItem: TEdit;
    btnOK: TButton;
    btnCancelar: TButton;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnLocalizarProdutoClick(Sender: TObject);
    procedure edtIdProdutoExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnEditarDescicaoProdutoClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtQtItemChange(Sender: TObject);
  private
    FVendaItem: TVendaItem;
    FListaVendaItem: TObjectList<TVendaItem>;
    FValorSalario: Currency;
    FValorLucro: Currency;
    FValorTotalInsumo: Currency;
    FDAOProduto: IDAOProduto;
    FEdicao: Boolean;
    procedure PreencherCampos(const pVendaItem: TVendaItem);
    procedure PreencherObjeto(var pVendaItem: TVendaItem);
    procedure LimparCampos;
    procedure ValidarProduto;
    procedure AdicionarProdutoNaLista;
    procedure CalcularValorTotalItem;
  public
    class function Exibir(const pVendaItem: TVendaItem): TVendaItem; overload;
    class function Exibir(): TObjectList<TVendaItem>; overload;
  end;

var
  TelaCadastroVendaProduto: TTelaCadastroVendaProduto;

implementation

{$R *.dfm}

class function TTelaCadastroVendaProduto.Exibir(const pVendaItem: TVendaItem): TVendaItem;
begin
  Application.CreateForm(TTelaCadastroVendaProduto, TelaCadastroVendaProduto);

  TelaCadastroVendaProduto.FEdicao := True;

  if (pVendaItem <> nil) then
    TelaCadastroVendaProduto.PreencherCampos(pVendaItem);

  TelaCadastroVendaProduto.ShowModal();

  Result := TelaCadastroVendaProduto.FVendaItem;
end;

class function TTelaCadastroVendaProduto.Exibir(): TObjectList<TVendaItem>;
begin
  Application.CreateForm(TTelaCadastroVendaProduto, TelaCadastroVendaProduto);
  TelaCadastroVendaProduto.ShowModal();
  Result := TelaCadastroVendaProduto.FListaVendaItem;
end;

procedure TTelaCadastroVendaProduto.btnCancelarClick(Sender: TObject);
begin
  Close();
  FVendaItem := nil;
end;

procedure TTelaCadastroVendaProduto.btnEditarDescicaoProdutoClick(Sender: TObject);
begin
  edtDescricaoProduto.Enabled := True;
  edtDescricaoProduto.Focar();
  edtDescricaoProduto.TabStop := True;
  btnEditarDescicaoProduto.Enabled := False;
end;

procedure TTelaCadastroVendaProduto.btnLocalizarProdutoClick(Sender: TObject);
var
  lDadoLocalizado: TDadoLocalizado;
begin
  lDadoLocalizado := TTelaPesquisaPadrao.Pesquisa<TProduto>(['id', 'Descricao']);

  if (lDadoLocalizado.Codigo.IsEmpty()) then
    Exit;

  edtIdProduto.Text := lDadoLocalizado.Codigo;
  edtIdProdutoExit(nil);
end;

procedure TTelaCadastroVendaProduto.btnOKClick(Sender: TObject);
begin
  ValidarProduto();

  if (FEdicao) then
  begin
    PreencherObjeto(FVendaItem);
    Close();
    Exit;
  end;

  AdicionarProdutoNaLista();

  LimparCampos();
  edtIdProduto.Focar();
end;

procedure TTelaCadastroVendaProduto.ValidarProduto();
begin
  MensagemCritica(
    (edtIdProduto.IsEmpty()),
    'Por favor, informe o produto',
    edtIdProduto);

  MensagemCritica(
    (edtDescricaoProduto.IsEmpty()),
    'Por favor, informe a descrição do produto',
    edtDescricaoProduto);
end;

procedure TTelaCadastroVendaProduto.AdicionarProdutoNaLista();
var
  lVendaItem: TVendaItem;
begin
  lVendaItem := TVendaItem.Create();
  PreencherObjeto(lVendaItem);
  FListaVendaItem.Add(lVendaItem);
end;

procedure TTelaCadastroVendaProduto.edtIdProdutoExit(Sender: TObject);
var
  lProduto: TProduto;
begin
  if (edtIdProduto.IsEmpty()) then
  begin
    LimparCampos();
    Exit;
  end;

  lProduto := FDAOProduto.Find(edtIdProduto.ToInteger);

  try
    MensagemCritica(
      (lProduto.Id = 0),
      'Produto não encontrado.',
      edtIdProduto);

    edtIdProduto.Text := lProduto.Id.ToString;
    edtDescricaoProduto.Text := lProduto.Descricao;
    edtVlUnitario.Text := lProduto.ValorPrecoVenda.ValorMonetario;

    FValorSalario := lProduto.CustoMontagem();
    FValorLucro := lProduto.ValorLucroFinal();
    FValorTotalInsumo := lProduto.ValorTotalInsumos();

    lblVlLucro.Caption := FValorLucro.ValorMonetarioCifrao;
    lblVlSalario.Caption := FValorSalario.ValorMonetarioCifrao;
    lblVlTotalInsumo.Caption := FValorTotalInsumo.ValorMonetarioCifrao;
  finally
    lProduto.Free();
  end;
end;

procedure TTelaCadastroVendaProduto.edtQtItemChange(Sender: TObject);
begin
  CalcularValorTotalItem();
end;

procedure TTelaCadastroVendaProduto.CalcularValorTotalItem();
begin
  edtVlTotalItem.Text :=
     Currency((edtQtItem.ToFloat * edtVlUnitario.ToCurrency) +
              (edtVlAcrescimo.ToCurrency - edtVlDesconto.ToCurrency)).ValorMonetario;

  lblVlLucro.Caption := Currency(FValorSalario * edtQtItem.ToFloat).ValorMonetarioCifrao;
  lblVlSalario.Caption := Currency(FValorLucro * edtQtItem.ToFloat).ValorMonetarioCifrao;
  lblVlTotalInsumo.Caption := Currency(FValorTotalInsumo * edtQtItem.ToFloat).ValorMonetarioCifrao;
end;

procedure TTelaCadastroVendaProduto.LimparCampos();
const
  CIFRAO_ZERADO = 'R$ 0,00';
begin
  edtIdProduto.Clear();
  edtDescricaoProduto.Clear();
  edtQtItem.Text := '1';
  edtVlUnitario.ZeradoComVirgula();
  edtVlDesconto.ZeradoComVirgula();
  edtVlAcrescimo.ZeradoComVirgula();
  edtVlTotalItem.ZeradoComVirgula();

  lblVlLucro.Caption := CIFRAO_ZERADO;
  lblVlSalario.Caption := CIFRAO_ZERADO;
  lblVlTotalInsumo.Caption := CIFRAO_ZERADO;
  lblQtEstoque.Caption := '0';
  btnEstoque.Visible := False;

  edtDescricaoProduto.Enabled := False;
  btnEditarDescicaoProduto.Enabled := True;
  edtDescricaoProduto.TabStop := False;
end;

procedure TTelaCadastroVendaProduto.PreencherCampos(const pVendaItem: TVendaItem);
begin
  edtIdProduto.Text := pVendaItem.IdentificadorProduto.ToString;
  edtDescricaoProduto.Text := pVendaItem.DescricaoProduto;
  edtQtItem.Text := pVendaItem.QuantidadeItem.ToString;
  edtVlUnitario.Text := pVendaItem.ValorUnitario.ValorMonetario;
  edtVlTotalItem.Text := pVendaItem.ValorItem.ValorMonetario;
  edtVlDesconto.Text := pVendaItem.ValorDesconto.ValorMonetario;
  edtVlAcrescimo.Text := pVendaItem.ValorAcrescimo.ValorMonetario;
  FValorSalario := pVendaItem.ValorSalario;
  FValorLucro := pVendaItem.ValorLucro;
  FValorTotalInsumo := (pVendaItem.ValorItem / pVendaItem.QuantidadeItem);

  lblVlLucro.Caption := FValorLucro.ValorMonetarioCifrao;
  lblVlSalario.Caption := FValorSalario.ValorMonetarioCifrao;
  lblVlTotalInsumo.Caption := FValorTotalInsumo.ValorMonetarioCifrao;
end;

procedure TTelaCadastroVendaProduto.PreencherObjeto(var pVendaItem: TVendaItem);
begin
  pVendaItem.IdentificadorProduto := edtIdProduto.ToInteger;
  pVendaItem.DescricaoProduto := edtDescricaoProduto.Text;
  pVendaItem.QuantidadeItem := edtQtItem.ToFloat;
  pVendaItem.ValorUnitario := edtVlUnitario.ToCurrency;
  pVendaItem.ValorItem := edtVlTotalItem.ToCurrency;
  pVendaItem.ValorDesconto := edtVlDesconto.ToCurrency;
  pVendaItem.ValorAcrescimo := edtVlAcrescimo.ToCurrency;
  pVendaItem.ValorSalario := FValorSalario * edtQtItem.ToFloat;
  pVendaItem.ValorLucro := FValorLucro * edtQtItem.ToFloat;
  pVendaItem.ValorTotalInsumo := FValorTotalInsumo * edtQtItem.ToFloat;
end;

procedure TTelaCadastroVendaProduto.FormCreate(Sender: TObject);
begin
  FDAOProduto := TDAOProduto.NovaInstancia();
  FVendaItem := TVendaItem.Create();
  FListaVendaItem := TObjectList<TVendaItem>.Create();
end;

procedure TTelaCadastroVendaProduto.FormDestroy(Sender: TObject);
begin
  FVendaItem.Free();
  FListaVendaItem.Free();
end;

procedure TTelaCadastroVendaProduto.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_ESCAPE) then
    Close();
end;

procedure TTelaCadastroVendaProduto.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if ((key = #13) and  (not(ActiveControl.ClassType = TMemo))) then
  Begin
    Key:= #0;
    Perform(Wm_NextDlgCtl,0,0);
  end
end;

end.
