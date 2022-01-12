unit WallVendas.Model.InventarioItem;

interface

uses
  WallVendas.Model.Base,
  SimpleAttributes;

type
  [Tabela('InventarioItem')]
  TInventarioItem = class(TModeloBase)
  private
    FIdInventario: Integer;
    FAltura: string;
    FIdProduto: Integer;
    FLargura: string;
    FUnidade: string;
    FQuantidade: Double;
    FDescricao: string;
    procedure SetAltura(const Value: string);
    procedure SetIdInventario(const Value: Integer);
    procedure SetIdProduto(const Value: Integer);
    procedure SetLargura(const Value: string);
    procedure SetQuantidade(const Value: Double);
    procedure SetUnidade(const Value: string);
    procedure SetDescricao(const Value: string);

  public
    [Campo('idInventario'), Fk]
    property IdInventario: Integer read FIdInventario write SetIdInventario;
    [Campo('IdProduto')]
    property IdProduto: Integer read FIdProduto write SetIdProduto;
    [Ignore]
    property Descricao: string read FDescricao write SetDescricao;
    [Campo('Unidade')]
    property Unidade: string read FUnidade write SetUnidade;
    [Campo('Altura')]
    property Altura: string read FAltura write SetAltura;
    [Campo('Largura')]
    property Largura: string read FLargura write SetLargura;
    [Campo('Quantidade')]
    property Quantidade: Double read FQuantidade write SetQuantidade;
  end;

implementation

{ TInventarioItem }

procedure TInventarioItem.SetAltura(const Value: string);
begin
  FAltura := Value;
end;

procedure TInventarioItem.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

procedure TInventarioItem.SetIdInventario(const Value: Integer);
begin
  FIdInventario := Value;
end;

procedure TInventarioItem.SetIdProduto(const Value: Integer);
begin
  FIdProduto := Value;
end;

procedure TInventarioItem.SetLargura(const Value: string);
begin
  FLargura := Value;
end;

procedure TInventarioItem.SetQuantidade(const Value: Double);
begin
  FQuantidade := Value;
end;

procedure TInventarioItem.SetUnidade(const Value: string);
begin
  FUnidade := Value;
end;

end.
