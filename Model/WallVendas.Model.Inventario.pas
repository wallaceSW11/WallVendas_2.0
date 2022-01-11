unit WallVendas.Model.Inventario;

interface

uses
  System.Generics.Collections,
  SimpleAttributes,
  WallVendas.Model.Base,
  WallVendas.Model.InventarioItem;

type
  [Tabela('Inventario')]
  TInventario = class(TModeloBase)
  private
    FDescricao: string;
    FData: TDateTime;
//    FProdutos: TObjectList<TInventarioItem>;
    procedure SetData(const Value: TDateTime);
    procedure SetDescricao(const Value: string);
//    procedure SetProdutos(const Value: TObjectList<TInventarioItem>);

  public
    [Campo('Descricao'), Display('Descrição')]
    property Descricao: string read FDescricao write SetDescricao;
    [Campo('Data')]
    property Data: TDateTime read FData write SetData;
//    [Campo('InventarioItem')]
//    property Produtos: TObjectList<TInventarioItem> read FProdutos write SetProdutos;
  end;

implementation

{ TInventario }

procedure TInventario.SetData(const Value: TDateTime);
begin
  FData := Value;
end;

procedure TInventario.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

//procedure TInventario.SetProdutos(const Value: TObjectList<TInventarioItem>);
//begin
//  FProdutos := Value;
//end;

end.
