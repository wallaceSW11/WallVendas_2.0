unit WallVendas.Model.Configuracao;

interface

uses
  WallVendas.Model.Base,
  SimpleAttributes;

type
  [Tabela('Configuracao')]
  TConfiguracao = class(TModeloBase)
  private
    FValorConfiguracao: string;
    FNomeConfiguracao: string;
    FSecao: string;
    procedure SetNomeConfiguracao(const Value: string);
    procedure SetSecao(const Value: string);
    procedure SetValorConfiguracao(const Value: string);
  public
    [Campo('Secao')]
    property Secao: string read FSecao write SetSecao;
    [Campo('NomeConfiguracao')]
    property NomeConfiguracao: string read FNomeConfiguracao write SetNomeConfiguracao;
    [Campo('ValorConfiguracao')]
    property ValorConfiguracao: string read FValorConfiguracao write SetValorConfiguracao;

  end;

implementation

{ TConfiguracao }

procedure TConfiguracao.SetNomeConfiguracao(const Value: string);
begin
  FNomeConfiguracao := Value;
end;

procedure TConfiguracao.SetSecao(const Value: string);
begin
  FSecao := Value;
end;

procedure TConfiguracao.SetValorConfiguracao(const Value: string);
begin
  FValorConfiguracao := Value;
end;

end.
