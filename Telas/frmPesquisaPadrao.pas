unit frmPesquisaPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.StdCtrls,
  WallVendas.DAO.Generico, System.Generics.Collections, WallVendas.Model.Pessoa;

type
  TTelaPesquisaPadrao = class(TForm)
    edtTrecho: TEdit;
    lblCampo: TLabel;
    cbCampo: TComboBox;
    btnPesquisar: TSpeedButton;
    DBGrid1: TDBGrid;
    btnOk: TSpeedButton;
    btnCancelar: TSpeedButton;
    dsPesquisa: TDataSource;
    procedure FormCreate(Sender: TObject);
  private
    FDAOPesquisa: IDAO<TPessoa>;
  public
    class function Pesquisa<TPessoa>:TPessoa;
  end;

var
  TelaPesquisaPadrao: TTelaPesquisaPadrao;

implementation

{$R *.dfm}

{ TTelaPesquisaPadrao }

class function TTelaPesquisaPadrao.Pesquisa<TPessoa>: TPessoa;
begin
  TelaPesquisaPadrao := TTelaPesquisaPadrao.Create(nil);

  TelaPesquisaPadrao.ShowModal();


end;

procedure TTelaPesquisaPadrao.FormCreate(Sender: TObject);
begin
  FDAOPesquisa := TDAOGenerico<TPessoa>.NovaInstancia();

end;

end.
