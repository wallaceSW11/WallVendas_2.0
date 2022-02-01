unit WallVendas.Model.ProdutoComposicao;

interface

uses
  SimpleAttributes, WallVendas.Model.Base;

type
  [Tabela('ProdutoComposicao')]
  TProdutoComposicao = class (TModeloBase)
  private
    FValorCusto: Currency;
    FIdentificadorProdutoComposicao: Integer;
    FIdentificadorProduto: Integer;
    FQuantidade: Double;
//    FValorItem: Currency;
    FDescricao: string;
    FAltura: Integer;
    FLargura: Integer;
    procedure SetIdentificadorProduto(const Value: Integer);
    procedure SetIdentificadorProdutoComposicao(const Value: Integer);
    procedure SetQuantidade(const Value: Double);
    procedure SetValorCusto(const Value: Currency);
//    procedure SetValorItem(const Value: Currency);
    procedure SetDescricao(const Value: string);
    procedure SetAltura(const Value: Integer);
    procedure SetLargura(const Value: Integer);
//    procedure SetValorItem(const Value: Currency);
  public
    [Campo('idProduto')]
    property IdentificadorProduto: Integer read FIdentificadorProduto write SetIdentificadorProduto;
    [Campo('idProdutoComposicao')]
    property IdentificadorProdutoComposicao: Integer read FIdentificadorProdutoComposicao write SetIdentificadorProdutoComposicao;
    [ignore]
    property Descricao: string read FDescricao write SetDescricao;
    [Campo('VlCusto')]
    property ValorCusto: Currency read FValorCusto write SetValorCusto;
    [Ignore]
    property Altura: Integer read FAltura write SetAltura;
    [Ignore]
    property Largura: Integer read FLargura write SetLargura;
    [Campo('QtComposicao')]
    property Quantidade: Double read FQuantidade write SetQuantidade;
//    [Campo('VlItem')]
//    property ValorItem: Currency read FValorItem write SetValorItem;

   function ValorTotalItem(): Currency;

  end;

implementation

{ TProdutoComposicao }

procedure TProdutoComposicao.SetAltura(const Value: Integer);
begin
  FAltura := Value;
end;

procedure TProdutoComposicao.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

procedure TProdutoComposicao.SetIdentificadorProduto(const Value: Integer);
begin
  FIdentificadorProduto := Value;
end;

procedure TProdutoComposicao.SetIdentificadorProdutoComposicao(const Value: Integer);
begin
  FIdentificadorProdutoComposicao := Value;
end;

procedure TProdutoComposicao.SetLargura(const Value: Integer);
begin
  FLargura := Value;
end;

procedure TProdutoComposicao.SetQuantidade(const Value: Double);
begin
  FQuantidade := Value;
end;

procedure TProdutoComposicao.SetValorCusto(const Value: Currency);
begin
  FValorCusto := Value;
end;

//procedure TProdutoComposicao.SetValorItem(const Value: Currency);
//begin
//  FValorItem := Value;
//end;

function TProdutoComposicao.ValorTotalItem: Currency;
begin
  Result := FQuantidade * FValorCusto;
end;

end.
