unit frmCadastroConfiguracao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frmCadastroPadrao, Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TTelaCadastroConfiguracao = class(TTelaCadastroPadrao)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TelaCadastroConfiguracao: TTelaCadastroConfiguracao;

implementation

{$R *.dfm}

end.
