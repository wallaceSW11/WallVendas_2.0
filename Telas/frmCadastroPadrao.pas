unit frmCadastroPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons, System.ImageList,
  Vcl.ImgList, Styles, Vcl.ComCtrls, Vcl.DBGrids, WallVendas.Helper.DBGrid, Data.DB, Datasnap.DBClient,
  System.Generics.Collections, LibConstantes;

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
    procedure btnNovoClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);

    procedure OnMouseEnterButton(Sender: TObject);
    procedure OnMouseLeaveButton(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnDuplicarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure PrepararBotoesEdicaoNovoCadastro();
    procedure PrepararBotoesIniciais;
    procedure HabilitarCampos(const pHabilitar: Boolean = True);
    procedure AplicarCorBotao(pPainel: TPanel; pButton: TSpeedButton; pCorPrimaria: Boolean);
    procedure HabilitarComponentes(pComponente: TWinControl; pHabilitar: Boolean);
    procedure FocarPrimeiroCampo;
    procedure LimparCampos;
    procedure LimparCamposDeAcordoComATag(pComponente: TWinControl);
  public
    FNovoCadastro: Boolean;
    FCadastroDuplicado: Boolean;
    procedure HabilitarCamposPesquisaValida();
  end;

var
  TelaCadastroPadrao: TTelaCadastroPadrao;

implementation

{$R *.dfm}

procedure TTelaCadastroPadrao.btnCancelarClick(Sender: TObject);
begin

  LimparCampos();
  PrepararBotoesIniciais();
  FNovoCadastro := False;
  FCadastroDuplicado := False;
end;

procedure TTelaCadastroPadrao.btnDuplicarClick(Sender: TObject);
begin
  btnCancelarClick(nil);
end;

procedure TTelaCadastroPadrao.btnEditarClick(Sender: TObject);
begin
  PrepararBotoesEdicaoNovoCadastro();
end;

procedure TTelaCadastroPadrao.btnExcluirClick(Sender: TObject);
begin
  btnCancelarClick(nil);
end;

procedure TTelaCadastroPadrao.btnNovoClick(Sender: TObject);
begin
  PrepararBotoesEdicaoNovoCadastro();
  FNovoCadastro := True;
  FCadastroDuplicado := False;
  LimparCampos();
end;

procedure TTelaCadastroPadrao.btnSalvarClick(Sender: TObject);
begin
  if (FCadastroDuplicado) then
    Exit();

  PrepararBotoesIniciais();

  LimparCampos();

  if (FNovoCadastro) then
    btnNovoClick(nil);
end;

procedure TTelaCadastroPadrao.FormCreate(Sender: TObject);
begin
  pnlBarraTop.Color := COLOR_PRIMARY;
  pnlBarraTop.BevelOuter := bvNone;
  pnlBotoes.BevelOuter := bvNone;

  PrepararBotoesIniciais();
  HabilitarCampos(False);
  FNovoCadastro := False;
  FCadastroDuplicado := False;
end;

procedure TTelaCadastroPadrao.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if ((key = #13) and  (not(ActiveControl.ClassType = TMemo))) then
  Begin
    Key:= #0;
    Perform(Wm_NextDlgCtl,0,0);
  end;
end;

procedure TTelaCadastroPadrao.FormShow(Sender: TObject);
begin
//  LimparCampos();
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
  FocarPrimeiroCampo();
end;

procedure TTelaCadastroPadrao.FocarPrimeiroCampo();
var
  I: Integer;
begin
  for I := 0 to pnlMain.ControlCount -1 do
    if (pnlMain.Controls[I] is TWinControl) then
      if (pnlMain.Controls[I] as TWinControl).TabOrder = 0 then
      begin
        (pnlMain.Controls[I] as TWinControl).SetFocus;
        Break;
      end;
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
  I, J: Integer;
begin
  for I := 0 to pnlMain.ControlCount -1 do
  begin
    HabilitarComponentes(pnlMain, pHabilitar);

    if ((pnlMain.Controls[I] is TGroupBox) or (pnlMain.Controls[I] is TPanel)) then
      HabilitarComponentes(TPanel(pnlMain.Controls[I]), pHabilitar);

    if (pnlMain.Controls[I] is TPageControl) then
      for J:= 0 to TPageControl(pnlMain.Controls[I]).PageCount-1 do
        HabilitarComponentes(TTabSheet(TPageControl(pnlMain.Controls[I]).Pages[J]), pHabilitar);
  end;
end;

procedure TTelaCadastroPadrao.HabilitarCamposPesquisaValida;
begin
  btnEditar.Enabled := True;
  btnDuplicar.Enabled := True;
  btnExcluir.Enabled := True;
  btnCancelar.Enabled := True;
end;

procedure TTelaCadastroPadrao.HabilitarComponentes(pComponente: TWinControl; pHabilitar: Boolean);
var
  I: Integer;
begin
  for I := 0 to pComponente.ControlCount -1 do
  begin
    if (pComponente.Controls[I] is TEdit) or (pComponente.Controls[I] is TComboBox) or
       (pComponente.Controls[I] is TMemo) or (pComponente.Controls[I] is TCheckBox) or
       (pComponente.Controls[I] is TSpeedButton) or (pComponente.Controls[I] is TButton) or
       (pComponente.Controls[I] is TDateTimePicker) or (pComponente.Controls[I] is TDBGrid) then
      if (pComponente.Controls[I].Tag in [TAG_DISABLE, TAG_DISABLE_TEXT_ONE, TAG_DISABLE_TEXT_ZERO_COMA_ZERO]) then
        pComponente.Controls[I].Enabled := False
      else
        pComponente.Controls[I].Enabled := pHabilitar;

    if (pComponente.Controls[I] is TDBGrid) then
      TDBGrid(pComponente.Controls[I]).Refresh();
  end;
end;

procedure TTelaCadastroPadrao.LimparCampos();
var
  I, J: Integer;
begin
  for I := 0 to pnlMain.ControlCount -1 do
  begin
    LimparCamposDeAcordoComATag(pnlMain);

    if ((pnlMain.Controls[I] is TGroupBox) or (pnlMain.Controls[I] is TPanel)) then
      LimparCamposDeAcordoComATag(TPanel(pnlMain.Controls[I]));

    if (pnlMain.Controls[I] is TPageControl) then
    begin
      for J:= 0 to TPageControl(pnlMain.Controls[I]).PageCount-1 do
        LimparCamposDeAcordoComATag(TTabSheet(TPageControl(pnlMain.Controls[I]).Pages[J]));

      TPageControl(pnlMain.Controls[I]).ActivePageIndex := 0;
    end;
  end;

  for J := 0 to ComponentCount-1 do
    if (Components[J] is TClientDataSet) then
    begin
      TClientDataSet(Components[J]).Close();
      TClientDataSet(Components[J]).CreateDataSet();
    end;
end;

procedure TTelaCadastroPadrao.LimparCamposDeAcordoComATag(pComponente: TWinControl);
var
  I: Integer;
begin
  for I := 0 to pComponente.ControlCount -1 do
  begin
    if (pComponente.Controls[I] is TEdit) then
    case TEdit(pComponente.Controls[I]).Tag of
      TAG_ENABLE,
      TAG_DISABLE: TEdit(pComponente.Controls[I]).Clear();
      TAG_ENABLE_TEXT_ZERO: TEdit(pComponente.Controls[I]).Text := '0';
      TAG_ENABLE_TEXT_ZERO_COMA_ZERO,
      TAG_DISABLE_TEXT_ZERO_COMA_ZERO: TEdit(pComponente.Controls[I]).Text := '0,00';
      TAG_ENABLE_TEXT_ONE,
      TAG_DISABLE_TEXT_ONE: TEdit(pComponente.Controls[I]).Text := '1';
    end;

    if (pComponente.Controls[I] is TLabel) then
    case TEdit(pComponente.Controls[I]).Tag of
      TAG_ENABLE_TEXT_ZERO_COMA_ZERO: TEdit(pComponente.Controls[I]).Text := '0,00';
      TAG_ENABLE_MONETARY: TEdit(pComponente.Controls[I]).Text := 'R$ 0,00';
    end;

    if (pComponente.Controls[I] is TCheckBox) then
      TCheckBox(pComponente.Controls[I]).Checked := False;

    if (pComponente.Controls[I] is TDateTimePicker) then
      TDateTimePicker(pComponente.Controls[I]).DateTime := Now();

    if (pComponente.Controls[I] is TMemo) then
      TMemo(pComponente.Controls[I]).Lines.Clear();

    if (pComponente.Controls[I] is TComboBox) then
      TComboBox(pComponente.Controls[I]).ItemIndex := 0;

    if (pComponente.Controls[I] is TDBGrid) then
    begin
      TDBGrid(pComponente.Controls[I]).DataSource.DataSet.Close();
      TDBGrid(pComponente.Controls[I]).AjustarColunas(1);
    end;
  end;
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
