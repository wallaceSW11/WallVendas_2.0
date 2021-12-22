unit frmPesquisaPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.StdCtrls,
  WallVendas.DAO.Generico, System.Generics.Collections, WallVendas.Model.Pessoa, LibTypes;

type
  TTelaPesquisaPadrao = class(TForm)
    edtTrecho: TEdit;
    lblCampo: TLabel;
    cbCampo: TComboBox;
    btnPesquisar: TSpeedButton;
    dbgPesquisa: TDBGrid;
    btnOk: TSpeedButton;
    btnCancelar: TSpeedButton;
    dsPesquisa: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure dbgPesquisaDblClick(Sender: TObject);
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
begin
  TelaPesquisaPadrao := TTelaPesquisaPadrao.Create(nil);

  lDAO := TDAOGenerico<T>.NovaInstancia(TelaPesquisaPadrao.dsPesquisa);
  lDAO.Find(pCampos);

  try
    if (TelaPesquisaPadrao.ShowModal = 1) then
    begin
      lDadoLocalizado.Codigo := TelaPesquisaPadrao.dsPesquisa.DataSet.FieldByName(pCampos[0]).AsString;
      lDadoLocalizado.Descricao := TelaPesquisaPadrao.dsPesquisa.DataSet.FieldByName(pCampos[1]).AsString;

      if (Length(pCampos) = 2) then
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
  Self.ModalResult := mrCancel;

end;

procedure TTelaPesquisaPadrao.btnOkClick(Sender: TObject);
begin
  Close();
  Self.ModalResult := mrOk;

end;

procedure TTelaPesquisaPadrao.dbgPesquisaDblClick(Sender: TObject);
begin
  Close();
  Self.ModalResult := mrOk;
end;

procedure TTelaPesquisaPadrao.FormCreate(Sender: TObject);
begin
//  FDAOPesquisa := TDAOGenerico<T>.NovaInstancia(dsPesquisa);
//
//  FDAOPesquisa.FindOne;


end;

end.
