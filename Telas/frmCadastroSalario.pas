unit frmCadastroSalario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frmCadastroPadrao, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  WallVendas.Model.Salario, WallVendas.Helper.TEdit, EditCurrency, EditNumber, WallVendas.Helper.Numbers,
  frmCadastroDespesas, WallVendas.Controller.Salario, WallVendas.DAO.Generico, SimpleAttributes;

type
  TTelaCadastroSalario = class(TTelaCadastroPadrao)
    lblValorSalario: TLabel;
    lblTotalHorasPorDia: TLabel;
    lblTotalDiasSemana: TLabel;
    lblTotalHorasPorSemana: TLabel;
    lblTotalHoraMes: TLabel;
    lblValorCustoPorHora: TLabel;
    lblValorCustoPorMinuto: TLabel;
    lblTotalDespesas: TLabel;
    lblSalarioDespesa: TLabel;
    edtTotalHorasPorSemana: TEdit;
    edtTotalHorasMes: TEdit;
    edtVlCustoPorHora: TEdit;
    edtVlCustoPorMinuto: TEdit;
    edtVlSalarioSomandoDespesas: TEdit;
    lblQuantidadeSemanasNoMes: TLabel;
    edtVlSalario: TEditCurrency;
    edtTotalHorasPorDia: TEditNumber;
    pnlDespesas: TPanel;
    btnDespesas: TSpeedButton;
    edtTotalDiasSemana: TEditNumber;
    edtQuantidadeSemanasMes: TEditNumber;
    edtVlTotalDespesas: TEditCurrency;
    procedure FormCreate(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure edtVlSalarioChange(Sender: TObject);
    procedure btnDespesasClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure edtQuantidadeSemanasMesExit(Sender: TObject);
    procedure edtQuantidadeSemanasMesChange(Sender: TObject);
  private
    FControllerSalario: IControllerSalario;
    FSalario: TSalario;
    FDAOSalario: IDAO<TSalario>;
    procedure CalcularSalario();
    procedure PreencherTela;
  public
    { Public declarations }
  end;

var
  TelaCadastroSalario: TTelaCadastroSalario;

implementation

{$R *.dfm}



procedure TTelaCadastroSalario.btnDespesasClick(Sender: TObject);
begin
  edtVlTotalDespesas.Text := TTelaCadastroDespesas.ValorTotalDespesas().ValorMonetario;
end;

procedure TTelaCadastroSalario.btnSalvarClick(Sender: TObject);
begin
  // validar o cadastro
  //preencher o objeto
  //salvar no banco
  FSalario.Id := 1;
  FSalario.SalarioDesejado := edtVlSalario.ToCurrency;
  FSalario.TotalDeHorasPorDia := edtTotalHorasPorDia.ToFloat;
  FSalario.TotalDeDiasTrabalhadosNaSemana := edtTotalDiasSemana.ToInteger;
  FSalario.QuantidadeDeSemanasPorMes := edtQuantidadeSemanasMes.ToInteger;
  FSalario.Despesas := edtVlTotalDespesas.ToCurrency;
  FDaoSalario.Update(FSalario);

  inherited;
end;

procedure TTelaCadastroSalario.CalcularSalario();
var
  lSalario: TSalario;
begin
  if (btnEditar.Enabled) then
    Exit;

  lSalario := TSalario.Create();
  try
    lSalario.SalarioDesejado := edtVlSalario.ToCurrency;
    lSalario.TotalDeHorasPorDia := edtTotalHorasPorDia.ToFloat;
    lSalario.TotalDeDiasTrabalhadosNaSemana := edtTotalDiasSemana.ToInteger;
    lSalario.QuantidadeDeSemanasPorMes := edtQuantidadeSemanasMes.ToInteger;
    lSalario.Despesas := edtVlTotalDespesas.ToCurrency;

    edtVlCustoPorMinuto.Text := lSalario.ValorDoSalarioPorMinuto.ValorMonetario;
    edtVlCustoPorHora.Text := lSalario.ValorDoSalarioPorHora.ValorMonetario;
    edtTotalHorasPorSemana.Text := lSalario.TotalDeHorasTrabalhadasPorSemana.ToString;
    edtTotalHorasMes.Text := lSalario.TotalDeHorasTrabalhadasPorMes.ToString;
    edtVlSalarioSomandoDespesas.Text := lSalario.TotalSalarioComDespesas.ValorMonetario;
  finally
    lSalario.Free();
  end;
end;

procedure TTelaCadastroSalario.edtQuantidadeSemanasMesChange(Sender: TObject);
begin
  inherited;
  CalcularSalario();
end;

procedure TTelaCadastroSalario.edtQuantidadeSemanasMesExit(Sender: TObject);
begin
 // inherited;
  CalcularSalario();
end;


procedure TTelaCadastroSalario.edtVlSalarioChange(Sender: TObject);
begin
  inherited;
  //CalcularSalario();
end;

procedure TTelaCadastroSalario.FormCreate(Sender: TObject);
begin
  inherited;
  btnEditar.Enabled := True;
  FDAOSalario := TDAOGenerico<TSalario>.NovaInstancia();
end;

procedure TTelaCadastroSalario.FormDestroy(Sender: TObject);
begin
  inherited;
  if (Assigned(FSalario)) then
    FSalario.Free();
end;

procedure TTelaCadastroSalario.FormShow(Sender: TObject);
begin
  inherited;
  FSalario := FDAOSalario.FindOne(1);
  PreencherTela();
end;

procedure TTelaCadastroSalario.PreencherTela();
begin
  edtVlSalario.Text := FSalario.SalarioDesejado.ValorMonetario;
  edtTotalHorasPorDia.Text := FSalario.TotalDeHorasPorDia.ToString;
  edtTotalDiasSemana.Text := FSalario.TotalDeDiasTrabalhadosNaSemana.ToString;
  edtQuantidadeSemanasMes.Text := FSalario.QuantidadeDeSemanasPorMes.ToString;
  edtVlTotalDespesas.Text := FSalario.Despesas.ValorMonetario;

  edtVlCustoPorMinuto.Text := FSalario.ValorDoSalarioPorMinuto.ValorMonetario;
  edtVlCustoPorHora.Text := FSalario.ValorDoSalarioPorHora.ValorMonetario;
  edtTotalHorasPorSemana.Text := FSalario.TotalDeHorasTrabalhadasPorSemana.ToString;
  edtTotalHorasMes.Text := FSalario.TotalDeHorasTrabalhadasPorMes.ToString;
  edtVlSalarioSomandoDespesas.Text := FSalario.TotalSalarioComDespesas.ValorMonetario;
end;

end.
