unit WallVendas.Model.Produto;

interface

uses
  WallVendas.Model.Base,
  SimpleAttributes;

type
  [Tabela('Produto')]
  TProduto = class(TModeloBase)
  private
    FUnidadeCompra: string;
    FDescricao: string;
    procedure SetDescricao(const Value: string);
    procedure SetUnidadeCompra(const Value: string);
  public
    [Campo('Descricao'), Display('Descrição')]
    property Descricao: string read FDescricao write SetDescricao;
    [Campo('UnidadeCompra'), Display('Unidade')]
    property UnidadeCompra: string read FUnidadeCompra write SetUnidadeCompra;
  end;

implementation

{ TProduto }

procedure TProduto.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

procedure TProduto.SetUnidadeCompra(const Value: string);
begin
  FUnidadeCompra := Value;
end;

end.
