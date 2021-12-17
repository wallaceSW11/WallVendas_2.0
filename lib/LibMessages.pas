unit LibMessages;

interface

uses
  vcl.Dialogs, SysUtils, winapi.windows, vcl.forms, libtypes, stdCtrls, WallVendas.Helper.TEdit;


procedure ShowInformationMessage(const pMensagem: string; const pAbort: Boolean = True); overload;
procedure ShowInformationMessage(const pCondicao: Boolean; const pMensagem: string; const pAbort: Boolean = True); overload;
function Mensagem(
  const pTexto: string;
  const pTitulo: string = '';
  const pIcone: TTipoIconeMensagem = timInformacao;
  const pbotao: TTipoBotaoMensagem = tbmOk): Integer; overload;
function Mensagem(
  const pCondicao: Boolean;
  const pTexto: string;
  const pTitulo: string = '';
  const pIcone: TTipoIconeMensagem = timInformacao;
  const pbotao: TTipoBotaoMensagem = tbmOk;
  const pAbort: Boolean = True): Integer; overload;
function Confirma(
  const pTexto: string;
  const pTitulo: string = ''): Boolean;
function MensagemCritica(
  const pCondicao: Boolean;
  const pTexto: string;
  const pCampoFocado: TEdit = nil): Integer;

implementation

procedure ShowInformationMessage(const pMensagem: string; const pAbort: Boolean = True);
begin
  ShowMessage(pMensagem);

  if (pAbort) then
    Abort;
end;

procedure ShowInformationMessage(const pCondicao: Boolean; const pMensagem: string; const pAbort: Boolean); overload;
begin
  if (pCondicao) then
    ShowInformationMessage(pMensagem, pAbort);
end;

function Mensagem(
  const pTexto: string;
  const pTitulo: string = '';
  const pIcone: TTipoIconeMensagem = timInformacao;
  const pbotao: TTipoBotaoMensagem = tbmOk): Integer;
var
  lTitulo: string;
begin
  lTitulo := pTitulo;

  if (pTitulo = EmptyStr) then
    lTitulo := pIcone.ToString;

  Result := MessageBox(application.handle, PWideChar(pTexto), PWideChar(lTitulo) , pIcone.ToInteger + pBotao.ToInteger);
end;

function Confirma(
  const pTexto: string;
  const pTitulo: string): Boolean;
begin
  Result := (
    Mensagem(
      pTexto,
      pTitulo,
      timPergunta,
      tbmSimNao) = IdYes);
end;

function Mensagem(
  const pCondicao: Boolean;
  const pTexto: string;
  const pTitulo: string = '';
  const pIcone: TTipoIconeMensagem = timInformacao;
  const pbotao: TTipoBotaoMensagem = tbmOk;
  const pAbort: Boolean = True): Integer; overload;
begin
  Result := -1;

  if (pCondicao) then
    Result :=
      Mensagem(
        pTexto,
        pTitulo,
        timInformacao,
        tbmOk);

  if (pAbort) then
    Abort;
end;

function MensagemCritica(
  const pCondicao: Boolean;
  const pTexto: string;
  const pCampoFocado: TEdit): Integer;
begin
  Result := -1;

  if (pCondicao) then
    Result :=
      Mensagem(
        pTexto);

  if (pCondicao and (pCampoFocado <> nil)) then
    pCampoFocado.Focar();

  if (pCondicao) then
    Abort;
end;

end.
