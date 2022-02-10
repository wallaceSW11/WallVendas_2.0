unit frmWallvenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons, Vcl.WinXCtrls, Vcl.Imaging.pngimage,
  System.Generics.Collections, System.ImageList, Vcl.ImgList,
  frmHome,
  frmCadastroSalario,
  frmCadastroInventario,
  frmCadastroCliente,
  frmCadastroProduto,
  frmCadastroVenda,
  frmLog,
  frmCadastroConfiguracao,
  Styles;



type
  TTela = (tCadastroCliente, tCadastroProduto);

  TfrmWallVendas = class(TForm)
    pnlTop: TPanel;
    pnlMain: TPanel;
    btnClose: TSpeedButton;
    btnMinimize: TSpeedButton;
    lblNomeEmpresa: TLabel;
    lblSistema: TLabel;
    ImageList1: TImageList;
    pnlMenu: TPanel;
    pnlHome: TPanel;
    btnHome: TSpeedButton;
    pnlVenda: TPanel;
    pnlProduto: TPanel;
    pnlCliente: TPanel;
    pnlInventario: TPanel;
    pnlSalario: TPanel;
    btnSalario: TSpeedButton;
    btnInventario: TSpeedButton;
    btnCliente: TSpeedButton;
    btnProduto: TSpeedButton;
    btnVenda: TSpeedButton;
    pnlOpcoes: TPanel;
    pnlLogs: TPanel;
    btnLogs: TSpeedButton;
    btnOpcoes: TSpeedButton;
    pnlMenuToggle: TPanel;
    btnMenuToggle: TSpeedButton;
    procedure btnCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnClienteClick(Sender: TObject);
    procedure btnSalarioClick(Sender: TObject);
    procedure btnMenuToggleClick(Sender: TObject);
    procedure btnInventarioClick(Sender: TObject);
    procedure btnHomeClick(Sender: TObject);
    procedure btnLogsClick(Sender: TObject);
    procedure btnOpcoesClick(Sender: TObject);
    procedure btnProdutoClick(Sender: TObject);
    procedure btnVendaClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnHomeMouseEnter(Sender: TObject);
    procedure btnHomeMouseLeave(Sender: TObject);

    procedure OnMouseLeaveButton(Sender: TObject);
    procedure OnMouseEnterButton(Sender: TObject);
    procedure btnMinimizeClick(Sender: TObject);

  private
    FTela: TForm;
    procedure ExibirTela<T: TForm>(Sender: TObject);
    procedure ToggleMenu();
    procedure TelaCheia;
  public
    { Public declarations }
  end;

var
  frmWallVendas: TfrmWallVendas;

implementation

{$R *.dfm}

procedure TfrmWallVendas.btnCloseClick(Sender: TObject);
begin
  Close();
end;

procedure TfrmWallVendas.btnInventarioClick(Sender: TObject);
begin
  ExibirTela<TTelaCadastroInventario>(Sender);
end;

procedure TfrmWallVendas.btnSalarioClick(Sender: TObject);
begin
  ExibirTela<TTelaCadastroSalario>(Sender);
end;

procedure TfrmWallVendas.btnVendaClick(Sender: TObject);
begin
  ExibirTela<TTelaCadastroVenda>(Sender);
end;

 procedure TfrmWallVendas.ExibirTela<T>(Sender: TObject);
var
  I: Integer;
begin
  //Validar troca de tela

  Application.CreateForm(T, FTela);
  FTela.Parent := pnlMain;
  FTela.BorderStyle := bsNone;
  FTela.Align := alClient;
  FTela.Show();

  for I := 0 to pnlMenu.ControlCount-1 do
    if (TPanel(pnlMenu.Controls[I]).Name = string(TSpeedButton(Sender).Name).Replace('btn', 'pnl')) then
      TPanel(pnlMenu.Controls[I]).Color := COLOR_SECONDARY
    else
      TPanel(pnlMenu.Controls[I]).Color := COLOR_PRIMARY

end;

procedure TfrmWallVendas.btnClienteClick(Sender: TObject);
begin
  ExibirTela<TTelaCadastroCliente>(Sender);
end;

procedure TfrmWallVendas.FormCreate(Sender: TObject);

begin
  ReportMemoryLeaksOnShutdown := True;

  TelaCheia();
end;

procedure TfrmWallVendas.TelaCheia();
var
  TaskBarH: THandle;
  TaskBarR: TRect;
begin
  TaskBarH := FindWindow('Shell_TrayWnd', nil);
  GetWindowRect(TaskBarH, TaskBarR);
  Self.Top := 0;
  Self.Left := 0;
  Self.Height := Screen.Height - (TaskBarR.Bottom - TaskBarR.Top);
  Self.Width := Screen.Width;
end;

procedure TfrmWallVendas.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if ((key = #13) and  (not(ActiveControl.ClassType = TMemo))) then
  Begin
    Key:= #0;
    Perform(Wm_NextDlgCtl,0,0);
  end;
end;

procedure TfrmWallVendas.FormShow(Sender: TObject);
begin
  pnlTop.Color := COLOR_PRIMARY;
  pnlMenu.Color := COLOR_PRIMARY;
  pnlMain.Color := COLOR_BACKGROUND;

  ExibirTela<TTelaCadastroVenda>(btnVenda);
  ToggleMenu();
end;

procedure TfrmWallVendas.OnMouseEnterButton(Sender: TObject);
begin
  TPanel(FindComponent(string(TSpeedButton(Sender).Name).Replace('btn', 'pnl'))).Color := COLOR_SECONDARY;
end;

procedure TfrmWallVendas.OnMouseLeaveButton(Sender: TObject);
begin
  if (not Assigned(FTela)) then
    Exit;

  if (string(TSpeedButton(Sender).Name).Replace('btn', '') <> FTela.Caption)  then
    TPanel(FindComponent(string(TSpeedButton(Sender).Name).Replace('btn', 'pnl'))).Color := COLOR_PRIMARY;
end;

procedure TfrmWallVendas.btnOpcoesClick(Sender: TObject);
begin
  ExibirTela<TTelaCadastroConfiguracao>(Sender);
end;

procedure TfrmWallVendas.btnLogsClick(Sender: TObject);
begin
  ExibirTela<TTelaLog>(Sender);
end;

procedure TfrmWallVendas.btnHomeClick(Sender: TObject);
begin
  ExibirTela<TTelaHome>(Sender);
end;

procedure TfrmWallVendas.btnHomeMouseEnter(Sender: TObject);
begin
  TPanel(FindComponent(string(TSpeedButton(Sender).Name).Replace('btn', 'pnl'))).Color := COLOR_SECONDARY;
end;

procedure TfrmWallVendas.btnHomeMouseLeave(Sender: TObject);
begin
  if (not TSpeedButton(FindComponent(TSpeedButton(Sender).name)).Down) then
    TPanel(FindComponent(string(TSpeedButton(Sender).Name).Replace('btn', 'pnl'))).Color := COLOR_PRIMARY;
end;

procedure TfrmWallVendas.btnMenuToggleClick(Sender: TObject);
begin
  ToggleMenu();
end;

procedure TfrmWallVendas.btnMinimizeClick(Sender: TObject);
begin
  Application.Minimize();
end;

procedure TfrmWallVendas.ToggleMenu();
const
  LARGURA_MENU_COMPACTADO = 60;
  LARGURA_MENU_EXPANDIDO = 170;
  SETA_PARA_DIREITA = 19;
  SETA_PARA_ESQUERDA = 20;
begin
  btnMenuToggle.Down := False;

  if (pnlMenu.Width = LARGURA_MENU_COMPACTADO) then
  begin
    pnlMenu.Width := LARGURA_MENU_EXPANDIDO;
    btnMenuToggle.ImageIndex := SETA_PARA_DIREITA;
    Exit;
  end;

  pnlMenu.Width := LARGURA_MENU_COMPACTADO;
  btnMenuToggle.ImageIndex := SETA_PARA_ESQUERDA;
end;

procedure TfrmWallVendas.btnProdutoClick(Sender: TObject);
begin
  ExibirTela<TTelaCadastroProduto>(Sender);
end;

end.
