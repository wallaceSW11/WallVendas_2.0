unit WallVendas.Model.Pessoa;

interface

uses
  SimpleAttributes,
  WallVendas.Model.Base;

type
  [Tabela('Pessoa')]
  TPessoa = class(TModeloBase)
  private
    FNome: string;
    procedure SetNome(const Value: string);
  public
    [Campo('Nome')]
    property Nome: string read FNome write SetNome;
  end;

implementation

{ TPessoa }

procedure TPessoa.SetNome(const Value: string);
begin
  FNome := Value;
end;

end.
