unit frmPesquisaPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.StdCtrls,
  WallVendas.DAO.Generico, System.Generics.Collections, WallVendas.Model.Pessoa, LibTypes,
  WallVendas.Helper.DBGrid;

type
  TTelaPesquisaPadrao = class(TForm)
    edtTrecho: TEdit;
    lblCampo: TLabel;
    cbCampo: TComboBox;
    dbgPesquisa: TDBGrid;
    btnOk: TSpeedButton;
    btnCancelar: TSpeedButton;
    dsPesquisa: TDataSource;
    lblTrecho: TLabel;
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure dbgPesquisaDblClick(Sender: TObject);
    procedure edtTrechoChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtTrechoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtTrechoKeyPress(Sender: TObject; var Key: Char);
    procedure cbCampoChange(Sender: TObject);
    procedure FormResize(Sender: TObject);
  public
    class function Pesquisa<T: class, constructor>(const pCampos: TArrayCamposSQL): TDadoLocalizado;
  end;

var
  TelaPesquisaPadrao: TTelaPesquisaPadrao;

implementation

{$R *.dfm}

{ TTelaPesquisaPadrao }

class function TTelaPesquisaPadrao.Pesquisa<T>(const pCampos: TArrayCamposSQL): TDadoLocalizado;
var
  lDAO: IDAO<T>;
  lDadoLocalizado: TDadoLocalizado;
  lCampo: string;
begin
  TelaPesquisaPadrao := TTelaPesquisaPadrao.Create(nil);

  lDAO := TDAOGenerico<T>.NovaInstancia(TelaPesquisaPadrao.dsPesquisa);
  lDAO.Find(pCampos);

  TelaPesquisaPadrao.cbCampo.Clear();

  for lCampo in pCampos do
    TelaPesquisaPadrao.cbCampo.Items.Add(lCampo.Replace('id', 'Código'));

  TelaPesquisaPadrao.cbCampo.ItemIndex := 1;

  try
    if (TelaPesquisaPadrao.ShowModal = 1) then
    begin
      lDadoLocalizado.Codigo := TelaPesquisaPadrao.dsPesquisa.DataSet.FieldByName(pCampos[0]).AsString;
      lDadoLocalizado.Descricao := TelaPesquisaPadrao.dsPesquisa.DataSet.FieldByName(pCampos[1]).AsString;

      if (Length(pCampos) = 3) then
        lDadoLocalizado.Complemento := TelaPesquisaPadrao.dsPesquisa.DataSet.FieldByName(pCampos[2]).AsString;
    end;

    Result := lDadoLocalizado;
  finally
    FreeAndNil(TelaPesquisaPadrao);
  end;
end;

procedure TTelaPesquisaPadrao.btnCancelarClick(Sender: TObject);
begin
  Close();
end;

procedure TTelaPesquisaPadrao.btnOkClick(Sender: TObject);
begin
  Close();
  Self.ModalResult := mrOk;
end;

procedure TTelaPesquisaPadrao.cbCampoChange(Sender: TObject);
begin
  edtTrecho.Clear();
end;

procedure TTelaPesquisaPadrao.dbgPesquisaDblClick(Sender: TObject);
begin
  Close();
  Self.ModalResult := mrOk;
end;

procedure TTelaPesquisaPadrao.edtTrechoChange(Sender: TObject);
const
  PESQUISA_TRECHO = '%s like ''%s''';
  PESQUISA_ESPECIFICA = '%s = ''%s''';
begin
  if (string(edtTrecho.Text).Trim().IsEmpty()) then
  begin
    dsPesquisa.DataSet.Filtered := False;
    Exit;
  end;

  dsPesquisa.DataSet.Filtered := False;
  dsPesquisa.DataSet.FilterOptions := [foCaseInsensitive];

  if cbCampo.ItemIndex = 0 then
    dsPesquisa.DataSet.Filter := Format(PESQUISA_ESPECIFICA, ['id', edtTrecho.Text])
  else
    dsPesquisa.DataSet.Filter := Format(PESQUISA_TRECHO, [cbCampo.Text, '%' + edtTrecho.Text + '%']);

  dsPesquisa.DataSet.Filtered := True;
end;

procedure TTelaPesquisaPadrao.edtTrechoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
  begin
    if ((string(edtTrecho.Text).Trim().IsEmpty()) or
        (dsPesquisa.DataSet.FieldByName('id').AsString = ''))  then
      Exit;

    Close();
    Self.ModalResult := mrOk
  end;
end;

procedure TTelaPesquisaPadrao.edtTrechoKeyPress(Sender: TObject; var Key: Char);
begin
  if (cbCampo.ItemIndex = 0) then
    if not(CharInSet(key, ['0'..'9',#8,#13])) then
      key := #0;
end;

procedure TTelaPesquisaPadrao.FormResize(Sender: TObject);
begin
  dbgPesquisa.AjustarColunas(1);
end;

procedure TTelaPesquisaPadrao.FormShow(Sender: TObject);
begin
  edtTrecho.SetFocus();
end;

end.
