program WallVendas;

uses
  Vcl.Forms,
  frmWallvenda in 'frmWallvenda.pas' {frmWallVendas},
  frmCadastroPadrao in 'Telas\frmCadastroPadrao.pas' {TelaCadastroPadrao},
  frmCadastroCliente in 'Telas\frmCadastroCliente.pas' {TelaCadastroCliente},
  frmCadastroSalario in 'Telas\frmCadastroSalario.pas' {TelaCadastroSalario},
  frmCadastroInventario in 'Telas\frmCadastroInventario.pas' {TelaCadastroInventario},
  frmCadastroProduto in 'Telas\frmCadastroProduto.pas' {TelaCadastroProduto},
  frmCadastroVenda in 'Telas\frmCadastroVenda.pas' {TelaCadastroVenda},
  frmCadastroConfiguracao in 'Telas\frmCadastroConfiguracao.pas' {TelaCadastroConfiguracao},
  frmLog in 'Telas\frmLog.pas' {TelaLog},
  frmHome in 'Telas\frmHome.pas' {TelaHome},
  Styles in 'Styles\Styles.pas',
  WallVendas.Model.Despesas in 'Model\WallVendas.Model.Despesas.pas',
  WallVendas.Model.Salario in 'Model\WallVendas.Model.Salario.pas',
  WallVendas.Helper.TEdit in 'Helper\WallVendas.Helper.TEdit.pas',
  WallVendas.Helper.Numbers in 'Helper\WallVendas.Helper.Numbers.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmWallVendas, frmWallVendas);
  Application.Run;
end.
