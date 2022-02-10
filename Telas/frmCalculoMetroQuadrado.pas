unit frmCalculoMetroQuadrado;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, EditCurrency, Vcl.StdCtrls, EditNumber,
  wallvendas.Helper.TEdit, WallVendas.Helper.Numbers, LibMessages;

type
  TTelaCalcularPrecoMetroQuadrado = class(TForm)
    edtAltura: TEditNumber;
    lblAltura: TLabel;
    lblLargura: TLabel;
    lblPrecoCompra: TLabel;
    lblPrecoMetroQuadrado: TLabel;
    lblValorMetroQuadrado: TLabel;
    edtLargura: TEditNumber;
    edtPreco: TEditCurrency;
    btnOK: TSpeedButton;
    btnCancelar: TSpeedButton;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnCancelarClick(Sender: TObject);
    procedure CalcularPreco(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    FValorMetroQuadrado: Currency;
  public
    class function PrecoMetroQuadradoCalculado(): Currency;
  end;

var
  TelaCalcularPrecoMetroQuadrado: TTelaCalcularPrecoMetroQuadrado;

implementation

{$R *.dfm}

procedure TTelaCalcularPrecoMetroQuadrado.btnCancelarClick(Sender: TObject);
begin
  Close();
  FValorMetroQuadrado := 0;
end;

procedure TTelaCalcularPrecoMetroQuadrado.btnOKClick(Sender: TObject);
begin
  MensagemCritica(
    (FValorMetroQuadrado = 0),
    'Por favor, informe os dados para o cálculo correto.',
    nil);

  Close();
end;

procedure TTelaCalcularPrecoMetroQuadrado.CalcularPreco(Sender: TObject);
var
  lMetroQuadradoCompra: Currency;
begin
  if ((edtAltura.ToFloat = 0) or (edtLargura.ToFloat = 0) or (edtPreco.ToCurrency = 0)) then
  begin
    FValorMetroQuadrado := 0;
    lblValorMetroQuadrado.Caption := FValorMetroQuadrado.ValorMonetarioCifrao;
    Exit();
  end;

  lMetroQuadradoCompra := (edtAltura.ToFloat() / 100) * (edtLargura.ToFloat() / 100);
  FValorMetroQuadrado := (edtPreco.ToCurrency() / lMetroQuadradoCompra);
  lblValorMetroQuadrado.Caption := FValorMetroQuadrado.ValorMonetarioCifrao;
end;

procedure TTelaCalcularPrecoMetroQuadrado.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if ((key = #13) and (not(ActiveControl.ClassType = TMemo))) then
  Begin
    Key:= #0;
    Perform(Wm_NextDlgCtl,0,0);
  end;
end;

class function TTelaCalcularPrecoMetroQuadrado.PrecoMetroQuadradoCalculado: Currency;
begin
  TelaCalcularPrecoMetroQuadrado := TTelaCalcularPrecoMetroQuadrado.Create(nil);

  try
    TelaCalcularPrecoMetroQuadrado.ShowModal();
    Result := TelaCalcularPrecoMetroQuadrado.FValorMetroQuadrado;
  finally
    TelaCalcularPrecoMetroQuadrado.Free();
  end;
end;

end.
