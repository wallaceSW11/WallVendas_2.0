unit WallVendas.Model.Produto;

interface

uses
  WallVendas.Model.Base,
  WallVendas.Model.ProdutoComposicao,
  SimpleAttributes,
  System.Generics.Collections;

type
  [Tabela('Produto')]
  TProduto = class(TModeloBase)
  private
    FUnidadeCompra: string;
    FDescricao: string;
    FPrecoVenda: Currency;
    FPossuiComposicao: Char;
    FMargemLucro: Double;
    FTempoMontagem: Integer;
    FVlFreteCompra: Currency;
    FCustoMinuto: Currency;
    FAcrescimoDescontoVenda: Currency;
    FDataCompra: TDateTime;
    FValorCompra: Currency;
    FAcrescimoDescontoCompra: Currency;

    FQtEmbalagemCompra: Double;
    FProdutosComposicao: TObjectList<TProdutoComposicao>;
    procedure SetDescricao(const Value: string);
    procedure SetUnidadeCompra(const Value: string);
    procedure SetPrecoVenda(const Value: Currency);
    procedure SetMargemLucro(const Value: Double);
    procedure SetPossuiComposicao(const Value: Char);
    function GetPrecoVenda: Currency;
    procedure SetAcrescimoDescontoCompra(const Value: Currency);
    procedure SetAcrescimoDescontoVenda(const Value: Currency);
    procedure SetCustoMinuto(const Value: Currency);
    procedure SetDataCompra(const Value: TDateTime);
    procedure SetQtEmbalagemCompra(const Value: Double);
    procedure SetTempoMontagem(const Value: Integer);
    procedure SetValorCompra(const Value: Currency);
    procedure SetVlFreteCompra(const Value: Currency);
    procedure SetProdutosComposicao(const Value: TObjectList<TProdutoComposicao>);
  public
    [Campo('Descricao'), Display('Descrição')]
    property Descricao: string read FDescricao write SetDescricao;
    [Campo('UnidadeCompra'), Display('Unidade')]
    property UnidadeCompra: string read FUnidadeCompra write SetUnidadeCompra;
    [Campo('QtEmbalagemCompra')]
    property QtEmbalagemCompra: Double read FQtEmbalagemCompra write SetQtEmbalagemCompra;
    [Campo('Custo')]
    property ValorCompra: Currency read FValorCompra write SetValorCompra;
    [Campo('VlFreteCompra')]
    property VlFreteCompra: Currency read FVlFreteCompra write SetVlFreteCompra;
    [Campo('AcrescimoDescontoCompra')]
    property AcrescimoDescontoCompra: Currency read FAcrescimoDescontoCompra write SetAcrescimoDescontoCompra;
    [Campo('DataCompra')]
    property DataCompra: TDateTime read FDataCompra write SetDataCompra;
    [Campo('StPossuiComposicao')]
    property PossuiComposicao: Char read FPossuiComposicao write SetPossuiComposicao;
    [Campo('AcrescimoDescontoVenda')]
    property AcrescimoDescontoVenda: Currency read FAcrescimoDescontoVenda write SetAcrescimoDescontoVenda;
    [Campo('VlPrecoVenda'), Display('Preço')]
    property PrecoVenda: Currency read GetPrecoVenda write SetPrecoVenda;
    [Campo('TempoMontagem')]
    property TempoMontagem: Integer read FTempoMontagem write SetTempoMontagem;
    [Campo('CustoMinuto')]
    property CustoMinuto: Currency read FCustoMinuto write SetCustoMinuto;
    [Campo('MargemLucro')]
    property MargemLucro: Double read FMargemLucro write SetMargemLucro;

    [Ignore]
    property ProdutosComposicao: TObjectList<TProdutoComposicao> read FProdutosComposicao write SetProdutosComposicao;

    constructor Create();
    destructor Destroy; override;

    function CustoReposicao(): Currency;
    function CustoReposicaoUnitario: Currency;
    function CustoMontagem(): Currency;

    function ValorTotalInsumos(): Currency;
    function ValorPrecoVenda(): Currency;
    function ValorMargemLucro(): Currency;
    function ValorLucroFinal(): Currency;
   end;

implementation

{ TProduto }

constructor TProduto.Create;
begin
  FProdutosComposicao := TObjectList<TProdutoComposicao>.Create();
end;

destructor TProduto.Destroy;
begin
  FProdutosComposicao.Free();
  inherited;
end;

function TProduto.CustoMontagem: Currency;
begin
  Result := FTempoMontagem * FCustoMinuto;
end;

function TProduto.CustoReposicao: Currency;
begin
  Result :=
    FValorCompra +
    CustoMontagem() +
    FVlFreteCompra +
    FAcrescimoDescontoCompra;
end;

function TProduto.CustoReposicaoUnitario: Currency;
begin
  if ((CustoReposicao() <> 0) and (FQtEmbalagemCompra <> 0)) then
    Exit(CustoReposicao() / FQtEmbalagemCompra);

  Result := 0;
end;

function TProduto.GetPrecoVenda: Currency;
begin
  Result := FPrecoVenda;
end;

function TProduto.ValorLucroFinal: Currency;
begin
  Result := ValorPrecoVenda() - ValorTotalInsumos;
end;

function TProduto.ValorMargemLucro: Currency;
begin
  Result := (CustoReposicaoUnitario + ValorTotalInsumos) * (MargemLucro / 100);
end;

function TProduto.ValorPrecoVenda: Currency;
begin
  Result := (CustoReposicaoUnitario + ValorTotalInsumos()) * (1 + (FMargemLucro / 100)) + FAcrescimoDescontoVenda;
end;

procedure TProduto.SetAcrescimoDescontoCompra(const Value: Currency);
begin
  FAcrescimoDescontoCompra := Value;
end;

procedure TProduto.SetAcrescimoDescontoVenda(const Value: Currency);
begin
  FAcrescimoDescontoVenda := Value;
end;

procedure TProduto.SetCustoMinuto(const Value: Currency);
begin
  FCustoMinuto := Value;
end;

procedure TProduto.SetDataCompra(const Value: TDateTime);
begin
  FDataCompra := Value;
end;

procedure TProduto.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

procedure TProduto.SetMargemLucro(const Value: Double);
begin
  FMargemLucro := Value;
end;

procedure TProduto.SetPossuiComposicao(const Value: Char);
begin
  FPossuiComposicao := Value;
end;

procedure TProduto.SetPrecoVenda(const Value: Currency);
begin
  FPrecoVenda := Value;
end;

procedure TProduto.SetProdutosComposicao(const Value: TObjectList<TProdutoComposicao>);
begin
  FProdutosComposicao := Value;
end;

procedure TProduto.SetQtEmbalagemCompra(const Value: Double);
begin
  FQtEmbalagemCompra := Value;
end;

procedure TProduto.SetTempoMontagem(const Value: Integer);
begin
  FTempoMontagem := Value;
end;

procedure TProduto.SetUnidadeCompra(const Value: string);
begin
  FUnidadeCompra := Value;
end;

procedure TProduto.SetValorCompra(const Value: Currency);
begin
  FValorCompra := Value;
end;

procedure TProduto.SetVlFreteCompra(const Value: Currency);
begin
  FVlFreteCompra := Value;
end;

function TProduto.ValorTotalInsumos: Currency;
var
  lTotalInsumos: Currency;
  lProdutoComposicao: TProdutoComposicao;
begin
  lTotalInsumos := 0;

  for lProdutoComposicao in Self.FProdutosComposicao do
    lTotalInsumos := lTotalInsumos + lProdutoComposicao.ValorTotalItem;

  Result := lTotalInsumos;
end;

end.
