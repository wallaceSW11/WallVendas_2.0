unit frmLog;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frmCadastroPadrao, Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TTelaLog = class(TTelaCadastroPadrao)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TelaLog: TTelaLog;

implementation

{$R *.dfm}

end.
