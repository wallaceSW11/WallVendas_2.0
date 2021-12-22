unit WallVendas.Model.Pessoa;

interface

uses
  SimpleAttributes;

type
  [Tabela('Pessoa')]
  TPessoa = class
  private
    FId: Integer;
    FNome: string;
    procedure SetId(const Value: Integer);
    procedure SetNome(const Value: string);
  public
    [Campo('id'), Pk, AutoInc, Display('Código')]
    property Id: Integer read FId write SetId;
    [Campo('Nome')]
    property Nome: string read FNome write SetNome;
  end;

implementation

{ TPessoa }

procedure TPessoa.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TPessoa.SetNome(const Value: string);
begin
  FNome := Value;
end;

end.
