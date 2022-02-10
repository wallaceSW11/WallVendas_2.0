unit frmCadastroVendaDetalhe;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons;

type
  TTelaCadastroVendaDetalhe = class(TForm)
    btnFinalizar: TSpeedButton;
    btnOk: TSpeedButton;
    btnCancelar: TSpeedButton;
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FIdVenda: Integer;
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

procedure TTelaCadastroVendaDetalhe.FormShow(Sender: TObject);
begin
  if (FIdVenda = 0) then
    Self.Caption := Self.Caption + ' (novo cadastro)'
  else
    Self.Caption := Self.Caption + ' (Alteração)'

end;

end.
