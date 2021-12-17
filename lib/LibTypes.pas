unit LibTypes;

interface

uses
  winapi.windows;

Type
  TTipoVenda = (tvOrcamento, tvEncomenda, tvVenda);
  TTipoIconeMensagem = (timInformacao, timAtencao, timAsteristico, timPergunta, timStop, timErro, timMao);
  TTipoBotaoMensagem = (tbmOk, tbmOKCancelar, tbmAbortar, tbmSimNaoCancelar, tbmSimNao, tbmTentarCancelar);
  TTipoOperacao = (toCadastro, toAlteracao, toVisualizacao, toReabertura);

  TTipoIconeMensagem_Helper = record Helper for TTipoIconeMensagem
    function ToInteger: Integer;
    function ToString: string;
  end;

  TTipoBotaoMensagem_Helper = record Helper for TTipoBotaoMensagem
    function ToInteger: Integer;
  end;

  TTipoVenda_Helper = class
    class function TipoVendaExtenso(const pTipoVenda: Char): string;
    class function TipoVendaChar(const pTipoVenda: TTipoVenda): Char;
  end;

  TStatusVenda = (svAberto, svFinalizado);

  TStatusVenda_Helper = class
    class function StatusVendaExtenso(const pStatusVenda: Char): string;
    class function StatusVendaChar(const pStatusVenda: TStatusVenda): char;
  end;

  TTipoOperacao_Helper = record Helper for TTipoOperacao
    function Descricao(): string;
  end;

  TMetroQuadrado = record
    Altura: string;
    Largura: string;
    MetroQuadrado: string;
  end;

  const
    LOG_ALTERACAO = 'Alteração';
    LOG_INCLUSAO = 'Inclusao';
    LOG_EXCLUSAO = 'Exclusão';
    LOG_ERRO = 'Erro';

implementation

{ TTipoVenda_Helper }

class function TTipoVenda_Helper.TipoVendaChar(const pTipoVenda: TTipoVenda): Char;
begin
  case pTipoVenda of
    tvOrcamento: Result := 'O';
    tvEncomenda: Result := 'E';
    tvVenda: Result := 'V';
  else
    Result := 'O';
  end;
end;

class function TTipoVenda_Helper.TipoVendaExtenso(const pTipoVenda: Char): string;
begin
  case pTipoVenda of
    'O': Result := 'Orçamento';
    'E': Result := 'Encomenda';
    'V': Result := 'Venda';
  else
    Result := 'Orçamento';
  end;
end;

{ TStatusVenda_Helper }

class function TStatusVenda_Helper.StatusVendaChar(const pStatusVenda: TStatusVenda): Char;
begin
  case pStatusVenda of
    svAberto: Result := 'A';
    svFinalizado: Result := 'F';
  else
    Result := 'A';
  end;
end;

class function TStatusVenda_Helper.StatusVendaExtenso(const pStatusVenda: Char): string;
begin
  case pStatusVenda of
    'A': Result := 'Aberto';
    'F': Result := 'Finalizado';
  else
    Result := 'A';
  end;
end;

{ TTipoIconeMensagem_Helper }

function TTipoIconeMensagem_Helper.ToInteger: integer;
begin
  case Self of
    timInformacao: Result := MB_ICONINFORMATION;
    timAtencao: Result := MB_ICONWARNING;
    timAsteristico: Result := MB_ICONASTERISK;
    timPergunta: Result := MB_ICONQUESTION;
    timStop: Result := MB_ICONSTOP;
    timErro: Result := MB_ICONERROR;
    timMao: Result := MB_ICONHAND;
  else
    Result := MB_ICONINFORMATION;
  end;
end;

function TTipoIconeMensagem_Helper.ToString: string;
begin
  case Self of
    timInformacao: Result := 'Informação';
    timAtencao: Result := 'Atenção!';
    timStop: Result := 'Pare!';
    timErro: Result := 'Inconsistência';
    timMao: Result := 'Pare!';
  else
    Result := 'Informação';
  end;
end;

{ TTipoBotaoMensagem_Helper }

function TTipoBotaoMensagem_Helper.ToInteger: integer;
begin
  case Self of
    tbmOk: Result := MB_OK;
    tbmOKCancelar: Result := MB_OKCANCEL;
    tbmAbortar: Result := MB_ABORTRETRYIGNORE;
    tbmSimNaoCancelar: Result := MB_YESNOCANCEL;
    tbmSimNao: Result := MB_YESNO;
    tbmTentarCancelar: Result := MB_RETRYCANCEL;
  else
    Result := MB_OK;
  end;
end;

{ TTipoOperacao_Helper }

function TTipoOperacao_Helper.Descricao: string;
begin
  case Self of
    toCadastro: Result := 'Cadastro';
    toAlteracao: Result := 'Alteração';
    toVisualizacao: Result := 'Visualização';
  else
    Result := 'Cadastro';
  end;
end;
end.
