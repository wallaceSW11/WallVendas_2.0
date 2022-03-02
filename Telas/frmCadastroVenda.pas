unit frmCadastroVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frmCadastroPadrao, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Buttons, Vcl.ExtCtrls, Wallvendas.Helper.DBGrid,
  wallvendas.DAO.Venda, System.DateUtils, LibTypes, frmPesquisaPadrao, wallvendas.Model.Venda,
  frmCadastroVendaDetalhe;

type
  TTelaCadastroVenda = class(TTelaCadastroPadrao)
    btnFiltarVendas: TButton;
    grpPeriodo: TGroupBox;
    lblPeriodoAte: TLabel;
    dtpVendaInicial: TDateTimePicker;
    dtpVendaFinal: TDateTimePicker;
    grpTipoVenda: TGroupBox;
    chkTipoOrcamento: TCheckBox;
    chkTipoEncomenda: TCheckBox;
    chkTipoVenda: TCheckBox;
    grpStatusVenda: TGroupBox;
    chkStatusAberto: TCheckBox;
    chkStatusFinalizado: TCheckBox;
    dbgVenda: TDBGrid;
    chkFechamento: TCheckBox;
    dsVenda: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnFiltarVendasClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure dbgVendaDblClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
  private
    FDAOVenda: IDAOVenda;
  public
    { Public declarations }
  end;

var
  TelaCadastroVenda: TTelaCadastroVenda;

implementation

{$R *.dfm}

procedure TTelaCadastroVenda.btnEditarClick(Sender: TObject);
begin
  if (dsVenda.DataSet.IsEmpty) then
    Exit;

  TTelaCadastroVendaDetalhe.Exibir(dsVenda.DataSet.FieldByName('id').AsInteger);
  btnFiltarVendasClick(nil);
end;

procedure TTelaCadastroVenda.btnFiltarVendasClick(Sender: TObject);
begin
  inherited;
  FDAOVenda.Find(dtpVendaInicial.DateTime, dtpVendaFinal.DateTime);
end;

procedure TTelaCadastroVenda.btnNovoClick(Sender: TObject);
begin
  TTelaCadastroVendaDetalhe.Exibir();
  btnFiltarVendasClick(nil);
end;

procedure TTelaCadastroVenda.btnPesquisarClick(Sender: TObject);
var
  lDadoLocalizado: TDadoLocalizado;
begin
  lDadoLocalizado := TTelaPesquisaPadrao.Pesquisa<TVenda>(['id', 'idPessoa', 'VlTotalVenda'], 2);
end;

procedure TTelaCadastroVenda.dbgVendaDblClick(Sender: TObject);
begin
   if (dsVenda.DataSet.IsEmpty) then
    Exit;

  TTelaCadastroVendaDetalhe.Exibir(dsVenda.DataSet.FieldByName('id').AsInteger);
end;

procedure TTelaCadastroVenda.FormCreate(Sender: TObject);
begin
  inherited;

  FDAOVenda := TDAOVenda.NovaInstancia(dsVenda);
end;

procedure TTelaCadastroVenda.FormResize(Sender: TObject);
begin
  inherited;
  dbgVenda.AjustarColunas(2);
end;

procedure TTelaCadastroVenda.FormShow(Sender: TObject);
begin
  inherited;

  Panel12.Visible := False;
  Panel14.Visible := False;
  pnlSalvar.Visible := False;
  pnlCancelar.Visible := False;
  HabilitarCampos();
  btnEditar.Enabled := True;

  dtpVendaInicial.DateTime := StartOfTheMonth(Now());
  dtpVendaFinal.DateTime := EndOfTheMonth(Now());

  btnFiltarVendas.Click();
end;

end.
