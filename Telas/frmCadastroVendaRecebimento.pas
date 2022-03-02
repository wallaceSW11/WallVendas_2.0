unit frmCadastroVendaRecebimento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.Generics.Collections, WallVendas.Model.VendaPagamento,
  WallVendas.Helper.TEdit, WallVendas.Helper.Numbers, LibMessages, EditCurrency;

type
  TTelaCadastroVendaRecebimento = class(TForm)
    lblFormaPagamento: TLabel;
    lblValor: TLabel;
    cbFormaPagamento: TComboBox;
    btnOk: TButton;
    btnCancelar: TButton;
    edtValor: TEditCurrency;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FEdicao: Boolean;
    FValorTotalVenda: Currency;
    FValorTotalRecebimento: Currency;
    FVendaPagamento: TVendaPagamento;
    FListaVendaPagamento: TObjectList<TVendaPagamento>;
    procedure AdicionarRecebimentoNaLista;
    procedure PreencherObjeto(var pVendaPagamento: TVendaPagamento);
    procedure ValidarValor;
  public
    class function Exibir(const pValorTotalVenda: Currency): TObjectList<TVendaPagamento>; overload;
    class function Exibir(const pVendaPagamento: TVendaPagamento; const pValorTotalVenda: Currency; const pValorRecebimento: Currency): TVendaPagamento; overload;
  end;

var
  TelaCadastroVendaRecebimento: TTelaCadastroVendaRecebimento;

implementation

{$R *.dfm}

{ TTelaCadastroVendaRecebimento }

procedure TTelaCadastroVendaRecebimento.btnCancelarClick(Sender: TObject);
begin
  Close();
  FVendaPagamento := nil;
end;

procedure TTelaCadastroVendaRecebimento.btnOkClick(Sender: TObject);

begin
  ValidarValor();

  if (FEdicao) then
  begin
    PreencherObjeto(FVendaPagamento);





    Close();
    Exit;
  end;

  AdicionarRecebimentoNaLista();

  if (FValorTotalVenda = edtValor.ToCurrency) then
    Close();

  FValorTotalVenda := FValorTotalVenda - edtValor.ToCurrency;

  edtValor.Text := FValorTotalVenda.ValorMonetario;

end;

procedure TTelaCadastroVendaRecebimento.ValidarValor();
begin
  MensagemCritica(
    (edtValor.ToCurrency = 0),
    'O valor informado não poderá ser zero.',
    edtValor);

//  if (FEdicao) then
//  begin
//    MensagemCritica(
//      (edtValor.ToCurrency > (FValorTotalVenda - FValorTotalRecebimento)),
//      'O valor informado é maior que o valor restante da venda.',
//      edtValor);
//
//    Exit;
//  end;

  MensagemCritica(
    (edtValor.ToCurrency > FValorTotalVenda),
    'O valor informado é maior que o valor total da venda.',
    edtValor);
end;

procedure TTelaCadastroVendaRecebimento.AdicionarRecebimentoNaLista();
var
  lVendaPagamento: TVendaPagamento;
begin
  lVendaPagamento := TVendaPagamento.Create();
  PreencherObjeto(lVendaPagamento);
  FListaVendaPagamento.Add(lVendaPagamento);
end;

procedure TTelaCadastroVendaRecebimento.PreencherObjeto(var pVendaPagamento: TVendaPagamento);
begin
  pVendaPagamento.DescricaoFormaPagamento := cbFormaPagamento.Text;
  pVendaPagamento.ValorPagamento := edtValor.ToCurrency;
end;

class function TTelaCadastroVendaRecebimento.Exibir(const pValorTotalVenda: Currency): TObjectList<TVendaPagamento>;
begin
  Application.CreateForm(TTelaCadastroVendaRecebimento, TelaCadastroVendaRecebimento);
  TelaCadastroVendaRecebimento.FValorTotalVenda := pValorTotalVenda;
  TelaCadastroVendaRecebimento.edtValor.Text := pValorTotalVenda.ValorMonetario;
  TelaCadastroVendaRecebimento.ShowModal;

  Result := TelaCadastroVendaRecebimento.FListaVendaPagamento;
end;

class function TTelaCadastroVendaRecebimento.Exibir(const pVendaPagamento: TVendaPagamento; const pValorTotalVenda: Currency; const pValorRecebimento: Currency): TVendaPagamento;
begin
  Application.CreateForm(TTelaCadastroVendaRecebimento, TelaCadastroVendaRecebimento);

  TelaCadastroVendaRecebimento.FEdicao := True;

  TelaCadastroVendaRecebimento.cbFormaPagamento.ItemIndex :=
    TelaCadastroVendaRecebimento.cbFormaPagamento.Items.IndexOf(pVendaPagamento.DescricaoFormaPagamento);

  TelaCadastroVendaRecebimento.edtValor.Text := pVendaPagamento.ValorPagamento.ValorMonetario;

  TelaCadastroVendaRecebimento.FValorTotalVenda := pValorTotalVenda;
  TelaCadastroVendaRecebimento.FValorTotalRecebimento := pValorRecebimento;

  TelaCadastroVendaRecebimento.ShowModal;

  Result := TelaCadastroVendaRecebimento.FVendaPagamento;
end;

procedure TTelaCadastroVendaRecebimento.FormCreate(Sender: TObject);
begin
  FListaVendaPagamento := TObjectList<TVendaPagamento>.Create();
  FVendaPagamento := TVendaPagamento.Create();
end;

procedure TTelaCadastroVendaRecebimento.FormDestroy(Sender: TObject);
begin
  FListaVendaPagamento.Free();
  FVendaPagamento.Free();
end;

procedure TTelaCadastroVendaRecebimento.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_ESCAPE) then
    Close();
end;

procedure TTelaCadastroVendaRecebimento.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if ((key = #13) and  (not(ActiveControl.ClassType = TMemo))) then
  Begin
    Key:= #0;
    Perform(Wm_NextDlgCtl,0,0);
  end;
end;

procedure TTelaCadastroVendaRecebimento.FormShow(Sender: TObject);
begin
  edtValor.Focar();
end;

end.
