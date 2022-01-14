unit frmCadastroCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frmCadastroPadrao, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  WallVendas.DAO.Generico, WallVendas.Model.Pessoa, LibMessages, WallVendas.Helper.TEdit, frmPesquisaPadrao,
  LibTypes, SimpleAttributes;

type
  TTelaCadastroCliente = class(TTelaCadastroPadrao)
    lblCodigoPessoa: TLabel;
    lblNomePessoa: TLabel;
    [Bind('id')]
    edtIdPessoa: TEdit;
    [Bind('Nome')]
    edtNomePessoa: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnDuplicarClick(Sender: TObject);
  private
    FDAOCliente: IDAO<TPessoa>;
  public
    { Public declarations }
  end;

var
  TelaCadastroCliente: TTelaCadastroCliente;

implementation

{$R *.dfm}

procedure TTelaCadastroCliente.btnDuplicarClick(Sender: TObject);
begin
  if (not Confirma('Deseja duplicar o cadastro do cliente?', 'Duplicar cadastro')) then
    Exit();

  edtIdPessoa.Clear;
  FNovoCadastro := True;
  FCadastroDuplicado := True;

  btnSalvarClick(nil);

  if (Confirma('Deseja editar o cadastro duplicado?', 'Editar o cadastro')) then
  begin
    btnEditarClick(nil);
    FNovoCadastro := False;
    FCadastroDuplicado := False;
    Exit();
  end;

  inherited;
end;

procedure TTelaCadastroCliente.btnExcluirClick(Sender: TObject);
begin
  if (not Confirma('Confirma excluir o cadastro do cliente?', 'Exclusão de cadastro')) then
    Exit();

  FDAOCliente.Delete('id', edtIdPessoa.Text);
  inherited;
end;

procedure TTelaCadastroCliente.btnPesquisarClick(Sender: TObject);
var
  lDadoLocalizado: TDadoLocalizado;
begin
  lDadoLocalizado := TTelaPesquisaPadrao.Pesquisa<TPessoa>(['id', 'Nome']);

  if (lDadoLocalizado.Codigo.IsEmpty()) then
    Exit;

  edtIdPessoa.Text := lDadoLocalizado.Codigo;
  edtNomePessoa.Text := lDadoLocalizado.Descricao;

  Self.HabilitarCamposPesquisaValida();
end;

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
    lCliente.Id := edtIdPessoa.ToInteger;
    lCliente.Nome := edtNomePessoa.Text;

    if (FNovoCadastro) then
      edtIdPessoa.Text := FDAOCliente.Insert(lCliente).ToString()
    else
      FDAOCliente.Update(lCliente);
  finally
    lCliente.Free();
  end;

  FNovoCadastro := False;
  inherited;
end;

procedure TTelaCadastroCliente.FormCreate(Sender: TObject);
begin
  inherited;
  FDAOCliente := TDAOGenerico<TPessoa>.NovaInstancia();
end;

end.
