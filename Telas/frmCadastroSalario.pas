unit frmCadastroSalario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frmCadastroPadrao, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  WallVendas.Model.Salario, WallVendas.Helper.TEdit, EditCurrency, EditNumber, WallVendas.Helper.Numbers;

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
    edtVlTotalDespesas: TEdit;
    edtVlSalarioSomandoDespesas: TEdit;
    lblQuantidadeSemanasNoMes: TLabel;
    edtQuantidadeSemanasMes: TEditNumber;
    edtVlSalario: TEditCurrency;
    edtTotalDiasSemana: TEditNumber;
    edtTotalHorasPorDia: TEditNumber;
    pnlDespesas: TPanel;
    btnDespesas: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure edtVlSalarioChange(Sender: TObject);
  private
    FSalario: TSalario;
    procedure CalcularSalario();
  public
    { Public declarations }
  end;

var
  TelaCadastroSalario: TTelaCadastroSalario;

implementation

{$R *.dfm}

procedure TTelaCadastroSalario.btnSalvarClick(Sender: TObject);
begin
  // validar o cadastro
  //preencher o objeto
  //salvar no banco



  inherited;
end;

procedure TTelaCadastroSalario.CalcularSalario();
begin
  FSalario.SalarioDesejado := edtVlSalario.ToCurrency;
  FSalario.TotalDeHorasPorDia := edtTotalHorasPorDia.ToFloat;
  FSalario.TotalDeDiasTrabalhadosNaSemana := edtTotalDiasSemana.ToInteger;
  FSalario.QuantidadeDeSemanasPorMes := edtQuantidadeSemanasMes.ToInteger;
  FSalario.Despesas := edtVlTotalDespesas.ToCurrency;

  edtVlCustoPorMinuto.Text := FSalario.ValorDoSalarioPorMinuto.ValorMonetario;
  edtVlCustoPorHora.Text := FSalario.ValorDoSalarioPorHora.ValorMonetario;
  edtTotalHorasPorSemana.Text := FSalario.TotalDeHorasTrabalhadasPorSemana.ToString;
  edtTotalHorasMes.Text := FSalario.TotalDeHorasTrabalhadasPorMes.ToString;
  edtVlSalarioSomandoDespesas.Text := FSalario.TotalSalarioComDespesas.ValorMonetario;
end;

procedure TTelaCadastroSalario.edtVlSalarioChange(Sender: TObject);
begin
  inherited;
  CalcularSalario();
end;

procedure TTelaCadastroSalario.FormCreate(Sender: TObject);
begin
  inherited;
  btnEditar.Enabled := True;
  FSalario := TSalario.Create;
end;

procedure TTelaCadastroSalario.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(FSalario);
end;

end.
