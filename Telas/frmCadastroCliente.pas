unit frmCadastroCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frmCadastroPadrao, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  WallVendas.DAO.Generico, WallVendas.Model.Pessoa, LibMessages, WallVendas.Helper.TEdit;

type
  TTelaCadastroCliente = class(TTelaCadastroPadrao)
    lblCodigoPessoa: TLabel;
    lblNomePessoa: TLabel;
    edtIdPessoa: TEdit;
    edtNomePessoa: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
  private
    FDAOCliente: IDAO<TPessoa>;
  public
    { Public declarations }
  end;

var
  TelaCadastroCliente: TTelaCadastroCliente;

implementation

{$R *.dfm}

procedure TTelaCadastroCliente.btnSalvarClick(Sender: TObject);
var
  lCliente: TPessoa;
begin
  MensagemCritica(
    edtNomePessoa.IsEmpty,
    'Por favor, informe o nome do cliente.',
    edtNomePessoa);

  lCliente := TPessoa.Create;
  try
    lCliente.Nome := edtNomePessoa.Text;

    if (FNovoCadastro) then
    begin
      FDAOCliente.Insert(lCliente);
      Exit;
    end;

    lCliente.Id := edtIdPessoa.ToInteger;
    FDAOCliente.Update(lCliente);
  finally
    lCliente.Free();
  end;

  inherited;
end;

procedure TTelaCadastroCliente.FormCreate(Sender: TObject);
begin
  inherited;
  FDAOCliente := TDAOGenerico<TPessoa>.NovaInstancia();
end;

end.
