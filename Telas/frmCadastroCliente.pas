unit frmCadastroCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frmCadastroPadrao, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TTelaCadastroCliente = class(TTelaCadastroPadrao)
    lblCodigoPessoa: TLabel;
    lblNomePessoa: TLabel;
    edtIdPessoa: TEdit;
    edtNomePessoa: TEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TelaCadastroCliente: TTelaCadastroCliente;

implementation

{$R *.dfm}

end.
