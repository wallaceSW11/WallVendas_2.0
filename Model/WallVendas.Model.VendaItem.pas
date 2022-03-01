unit WallVendas.Model.VendaItem;

interface

uses
  wallvendas.Model.Base,
  SimpleAttributes,
  libTypes;

type
  [Tabela('DocumentoItem')]
  TVendaItem = class(TModeloBase)
  private
    FIdentificadorProduto: Integer;
    FValorAcrescimo: Currency;
    FValorDesconto: Currency;
    FQuantidadeItem: Double;
    FDescricaoProduto: string;
    FValorLucro: Currency;
    FValorUnitario: Currency;
    FValorSalario: Currency;
    FIdentificadorDocumento: Integer;
    FValorTotalInsumo: Currency;
    FValorItem: Currency;
    procedure SetDescricaoProduto(const Value: string);
    procedure SetIdentificadorDocumento(const Value: Integer);
    procedure SetIdentificadorProduto(const Value: Integer);
    procedure SetQuantidadeItem(const Value: Double);
    procedure SetValorAcrescimo(const Value: Currency);
    procedure SetValorDesconto(const Value: Currency);
    procedure SetValorItem(const Value: Currency);
    procedure SetValorLucro(const Value: Currency);
    procedure SetValorSalario(const Value: Currency);
    procedure SetValorTotalInsumo(const Value: Currency);
    procedure SetValorUnitario(const Value: Currency);
  public
    [Campo('IdDocumento')]
    property IdentificadorDocumento: Integer read FIdentificadorDocumento write SetIdentificadorDocumento;
    [Campo('IdProduto')]
    property IdentificadorProduto: Integer read FIdentificadorProduto write SetIdentificadorProduto;
    [Campo('QtItem')]
    property QuantidadeItem: Double read FQuantidadeItem write SetQuantidadeItem;
    [Campo('VlUnitario')]
    property ValorUnitario: Currency read FValorUnitario write SetValorUnitario;
    [Campo('VlDesconto')]
    property ValorDesconto: Currency read FValorDesconto write SetValorDesconto;
    [Campo('VlAcrescimo')]
    property ValorAcrescimo: Currency read FValorAcrescimo write SetValorAcrescimo;
    [Campo('VlItem')]
    property ValorItem: Currency read FValorItem write SetValorItem;
    [Campo('DescricaoProduto')]
    property DescricaoProduto: string read FDescricaoProduto write SetDescricaoProduto;
    [Campo('VlSalario')]
    property ValorSalario: Currency read FValorSalario write SetValorSalario;
    [Campo('VlLucro')]
    property ValorLucro: Currency read FValorLucro write SetValorLucro;
    [Campo('VlTotalInsumo')]
    property ValorTotalInsumo: Currency read FValorTotalInsumo write SetValorTotalInsumo;
  end;

implementation

{ TVendaItem }

procedure TVendaItem.SetDescricaoProduto(const Value: string);
begin
  FDescricaoProduto := Value;
end;

procedure TVendaItem.SetIdentificadorDocumento(const Value: Integer);
begin
  FIdentificadorDocumento := Value;
end;

procedure TVendaItem.SetIdentificadorProduto(const Value: Integer);
begin
  FIdentificadorProduto := Value;
end;

procedure TVendaItem.SetQuantidadeItem(const Value: Double);
begin
  FQuantidadeItem := Value;
end;

procedure TVendaItem.SetValorAcrescimo(const Value: Currency);
begin
  FValorAcrescimo := Value;
end;

procedure TVendaItem.SetValorDesconto(const Value: Currency);
begin
  FValorDesconto := Value;
end;

procedure TVendaItem.SetValorItem(const Value: Currency);
begin
  FValorItem := Value;
end;

procedure TVendaItem.SetValorLucro(const Value: Currency);
begin
  FValorLucro := Value;
end;

procedure TVendaItem.SetValorSalario(const Value: Currency);
begin
  FValorSalario := Value;
end;

procedure TVendaItem.SetValorTotalInsumo(const Value: Currency);
begin
  FValorTotalInsumo := Value;
end;

procedure TVendaItem.SetValorUnitario(const Value: Currency);
begin
  FValorUnitario := Value;
end;

end.
