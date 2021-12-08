unit frmCadastroPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons, System.ImageList,
  Vcl.ImgList, Styles, Vcl.ComCtrls, Vcl.DBGrids;

type
  TTelaCadastroPadrao = class(TForm)
    pnlTop: TPanel;
    lblTitulo: TLabel;
    pnlBarraTop: TPanel;
    pnlMain: TPanel;
    pnlBotoes: TPanel;
    pnlDuplicar: TPanel;
    btnDuplicar: TSpeedButton;
    pnlPesquisar: TPanel;
    btnPesquisar: TSpeedButton;
    pnlNovo: TPanel;
    btnNovo: TSpeedButton;
    Panel6: TPanel;
    pnlEditar: TPanel;
    btnEditar: TSpeedButton;
    Panel8: TPanel;
    pnlSalvar: TPanel;
    btnSalvar: TSpeedButton;
    Panel10: TPanel;
    pnlCanelar: TPanel;
    btnCancelar: TSpeedButton;
    Panel12: TPanel;
    pnlExcluir: TPanel;
    btnExcluir: TSpeedButton;
    Panel14: TPanel;
    Panel15: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);

    procedure OnMouseEnterButton(Sender: TObject);
    procedure OnMouseLeaveButton(Sender: TObject);
  private
    procedure PrepararBotoesEdicaoNovoCadastro();
    procedure PrepararBotoesIniciais;
    procedure HabilitarCampos(const pHabilitar: Boolean = True);
    procedure AplicarCorBotao(pPainel: TPanel; pButton: TSpeedButton; pCorPrimaria: Boolean);
    procedure HabilitarComponentes(pComponente: TWinControl; pHabilitar: Boolean);
  public
    { Public declarations }
  end;

var
  TelaCadastroPadrao: TTelaCadastroPadrao;

implementation

{$R *.dfm}

procedure TTelaCadastroPadrao.btnCancelarClick(Sender: TObject);
begin
  PrepararBotoesIniciais();
end;

procedure TTelaCadastroPadrao.btnEditarClick(Sender: TObject);
begin
  PrepararBotoesEdicaoNovoCadastro();
end;

procedure TTelaCadastroPadrao.btnNovoClick(Sender: TObject);
begin
  PrepararBotoesEdicaoNovoCadastro();
end;

procedure TTelaCadastroPadrao.btnPesquisarClick(Sender: TObject);
begin
  btnEditar.Enabled := True;
  btnDuplicar.Enabled := True;
  btnExcluir.Enabled := True;
  btnCancelar.Enabled := True;
end;

procedure TTelaCadastroPadrao.btnSalvarClick(Sender: TObject);
begin
  PrepararBotoesIniciais();
end;

procedure TTelaCadastroPadrao.FormCreate(Sender: TObject);
begin
  pnlBarraTop.Color := COLOR_PRIMARY;
  pnlBarraTop.BevelOuter := bvNone;
  pnlBotoes.BevelOuter := bvNone;

  PrepararBotoesIniciais();
  HabilitarCampos(False);
end;

procedure TTelaCadastroPadrao.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if ((key = #13) and  (not(ActiveControl.ClassType = TMemo))) then
  Begin
    Key:= #0;
    Perform(Wm_NextDlgCtl,0,0);
  end;
end;

procedure TTelaCadastroPadrao.PrepararBotoesEdicaoNovoCadastro();
begin
  btnPesquisar.Enabled := False;
  btnNovo.Enabled := False;
  btnEditar.Enabled := False;
  btnSalvar.Enabled := True;
  btnCancelar.Enabled := True;
  btnExcluir.Enabled := False;
  btnDuplicar.Enabled := False;

  AplicarCorBotao(pnlNovo, btnNovo, False);
  AplicarCorBotao(pnlEditar, btnEditar, False);
  AplicarCorBotao(pnlSalvar, btnSalvar, True);

  HabilitarCampos();
end;

procedure TTelaCadastroPadrao.PrepararBotoesIniciais();
begin
  btnPesquisar.Enabled := True;
  btnNovo.Enabled := True;
  btnEditar.Enabled := (False or not pnlPesquisar.Visible);
  btnSalvar.Enabled := False;
  btnCancelar.Enabled := False;
  btnExcluir.Enabled := False;
  btnDuplicar.Enabled := False;

  if (pnlNovo.Visible) then
    begin
      pnlNovo.Color := COLOR_PRIMARY;
      pnlNovo.BevelKind := bkNone;
      btnNovo.Font.Color := clWhite;
    end
  else
    begin
      pnlEditar.Color := COLOR_PRIMARY;
      pnlEditar.BevelKind := bkNone;
      btnEditar.Font.Color := clWhite;
    end;

  pnlSalvar.Color := COLOR_BACKGROUND_BUTTON;
  pnlSalvar.BevelKind := bkTile;
  btnSalvar.Font.Color := COLOR_FONT_DARK;

  HabilitarCampos(False);
end;

procedure TTelaCadastroPadrao.HabilitarCampos(const pHabilitar: Boolean = True);
var
  I: Integer;
begin
  for I := 0 to pnlMain.ControlCount -1 do
  begin
    HabilitarComponentes(pnlMain, pHabilitar);

    if ((pnlMain.Controls[I] is TGroupBox) or (pnlMain.Controls[I] is TPanel)) then
      HabilitarComponentes(TPanel(pnlMain.Controls[I]), pHabilitar);
  end;
end;

procedure TTelaCadastroPadrao.HabilitarComponentes(pComponente: TWinControl; pHabilitar: Boolean);
var
  I: Integer;
begin
  for I := 0 to pComponente.ControlCount -1 do
    if (pComponente.Controls[I] is TEdit) or (pComponente.Controls[I] is TComboBox) or
       (pComponente.Controls[I] is TMemo) or (pComponente.Controls[I] is TCheckBox) or
       (pComponente.Controls[I] is TSpeedButton) or (pComponente.Controls[I] is TButton) or
       (pComponente.Controls[I] is TDateTimePicker) or (pComponente.Controls[I] is TDBGrid) then
      if (pComponente.Controls[I].Tag = 1) then
        pComponente.Controls[I].Enabled := False
      else
        pComponente.Controls[I].Enabled := pHabilitar;
end;


procedure TTelaCadastroPadrao.OnMouseEnterButton(Sender: TObject);
begin
  if (TPanel(FindComponent(string(TSpeedButton(Sender).Name).Replace('btn', 'pnl'))).BevelKind = bkNone) then
    TPanel(FindComponent(string(TSpeedButton(Sender).Name).Replace('btn', 'pnl'))).Color := COLOR_SECONDARY;
end;

procedure TTelaCadastroPadrao.OnMouseLeaveButton(Sender: TObject);
begin
  if (TPanel(FindComponent(string(TSpeedButton(Sender).Name).Replace('btn', 'pnl'))).BevelKind = bkNone) then
    TPanel(FindComponent(string(TSpeedButton(Sender).Name).Replace('btn', 'pnl'))).Color := COLOR_PRIMARY;
end;

procedure TTelaCadastroPadrao.AplicarCorBotao(pPainel: TPanel; pButton: TSpeedButton; pCorPrimaria: Boolean);
begin
  if (pCorPrimaria) then
  begin
    pPainel.Color := COLOR_PRIMARY;
    pPainel.BevelKind := bkNone;
    pButton.Font.Color := COLOR_FONT_LIGHT;
    Exit;
  end;

  pPainel.Color := COLOR_BACKGROUND_BUTTON;
  pPainel.BevelKind := bkTile;
  pButton.Font.Color := COLOR_FONT_DARK;
end;

end.
