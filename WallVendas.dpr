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
  WallVendas.Helper.Numbers in 'Helper\WallVendas.Helper.Numbers.pas',
  frmCadastroDespesas in 'Telas\frmCadastroDespesas.pas' {TelaCadastroDespesas},
  WallVendas.Repository.Salario in 'Repository\WallVendas.Repository.Salario.pas',
  WallVendas.Controller.Salario in 'Controller\WallVendas.Controller.Salario.pas',
  WallVendas.Repository.Interfaces in 'Repository\WallVendas.Repository.Interfaces.pas',
  WallVendas.Context.Conexao in 'Context\WallVendas.Context.Conexao.pas',
  WallVendas.Context.Query in 'Context\WallVendas.Context.Query.pas',
  WallVendas.DAO.Generico in 'DAO\WallVendas.DAO.Generico.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmWallVendas, frmWallVendas);
  Application.CreateForm(TTelaCadastroDespesas, TelaCadastroDespesas);
  Application.Run;
end.
