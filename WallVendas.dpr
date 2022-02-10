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
  WallVendas.Context.Conexao in 'Context\WallVendas.Context.Conexao.pas',
  WallVendas.Context.Query in 'Context\WallVendas.Context.Query.pas',
  WallVendas.DAO.Generico in 'DAO\WallVendas.DAO.Generico.pas',
  LibMessages in 'lib\LibMessages.pas',
  LibTypes in 'lib\LibTypes.pas',
  WallVendas.Model.Pessoa in 'Model\WallVendas.Model.Pessoa.pas',
  WallVendas.Model.Cliente in 'Model\WallVendas.Model.Cliente.pas',
  frmPesquisaPadrao in 'Telas\frmPesquisaPadrao.pas' {TelaPesquisaPadrao},
  WallVendas.Model.Base in 'Model\WallVendas.Model.Base.pas',
  WallVendas.Model.Inventario in 'Model\WallVendas.Model.Inventario.pas',
  WallVendas.Model.InventarioItem in 'Model\WallVendas.Model.InventarioItem.pas',
  WallVendas.DAO.Inventario in 'DAO\WallVendas.DAO.Inventario.pas',
  WallVendas.Helper.DBGrid in 'Helper\WallVendas.Helper.DBGrid.pas',
  Vcl.Themes,
  Vcl.Styles,
  WallVendas.Model.Produto in 'Model\WallVendas.Model.Produto.pas',
  Lib in 'lib\Lib.pas',
  WallVendas.Model.ProdutoComposicao in 'Model\WallVendas.Model.ProdutoComposicao.pas',
  LibConstantes in 'lib\LibConstantes.pas',
  WallVendas.DAO.Produto in 'DAO\WallVendas.DAO.Produto.pas',
  WallVendas.DAO.Configuracao in 'DAO\WallVendas.DAO.Configuracao.pas',
  WallVendas.Model.Configuracao in 'Model\WallVendas.Model.Configuracao.pas',
  frmCalculoMetroQuadrado in 'Telas\frmCalculoMetroQuadrado.pas' {TelaCalcularPrecoMetroQuadrado};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmWallVendas, frmWallVendas);
  Application.CreateForm(TTelaCalcularPrecoMetroQuadrado, TelaCalcularPrecoMetroQuadrado);
  Application.Run;
end.
