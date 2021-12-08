unit frmCadastroVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frmCadastroPadrao, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Buttons, Vcl.ExtCtrls;

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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TelaCadastroVenda: TTelaCadastroVenda;

implementation

{$R *.dfm}

end.
