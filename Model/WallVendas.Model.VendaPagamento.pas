unit WallVendas.Model.VendaPagamento;

interface

uses
  wallvendas.Model.Base,
  SimpleAttributes,
  libTypes;

type
  [Tabela('DocumentoPagamento')]
  TVendaPagamento = class(TModeloBase)
  private
    FDescricaoFormaPagamento: string;
    FIdentificadorDocumento: Integer;
    FValorPagamento: Currency;
    procedure SetDescricaoFormaPagamento(const Value: string);
    procedure SetIdentificadorDocumento(const Value: Integer);
    procedure SetValorPagamento(const Value: Currency);
  public
    [Campo('IdDocumento')]
    property IdentificadorDocumento: Integer read FIdentificadorDocumento write SetIdentificadorDocumento;
    [Campo('DsFormaPagamento')]
    property DescricaoFormaPagamento: string read FDescricaoFormaPagamento write SetDescricaoFormaPagamento;
    [Campo('VlPagamento')]
    property ValorPagamento: Currency read FValorPagamento write SetValorPagamento;
  end;

implementation

{ TVendaPagamento }

procedure TVendaPagamento.SetDescricaoFormaPagamento(const Value: string);
begin
  FDescricaoFormaPagamento := Value;
end;

procedure TVendaPagamento.SetIdentificadorDocumento(const Value: Integer);
begin
  FIdentificadorDocumento := Value;
end;

procedure TVendaPagamento.SetValorPagamento(const Value: Currency);
begin
  FValorPagamento := Value;
end;

end.
