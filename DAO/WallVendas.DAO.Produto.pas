unit WallVendas.DAO.Produto;

interface

uses
  WallVendas.DAO.Generico,
  WallVendas.Model.Produto,
  WallVendas.Model.ProdutoComposicao,
  System.SysUtils,
  System.Generics.Collections,
  Data.DB,
  LibTypes,
  FireDAC.Comp.Client;

type

  IDAOProduto = interface
    ['{1AD40FFA-B1BC-4CFA-8F44-04C45C298918}']
    function Find(const pIdentificador: Integer): TProduto;
    function Insert(const pProduto: TProduto): Integer;
    procedure Update(const pProduto: TProduto);
    procedure Delete(const pIdentificadorProduto: Integer);
  end;

  TDAOProduto = class (TInterfacedObject, IDAOProduto)
  private
    FDAOGenericoProduto: IDAO<TProduto>;
    FDAOGenericoProdutoComposicao: IDAO<TProdutoComposicao>;
    constructor Create( );
  public
    destructor Destroy; override;
    class function NovaInstancia(): IDAOProduto;
    function Find(const pIdentificador: Integer): TProduto;
    function Insert(const pProduto: TProduto): Integer;
    procedure Update(const pProduto: TProduto);
    procedure Delete(const pIdentificadorProduto: Integer);

  end;

implementation

{ TDAOProduto<T> }

constructor TDAOProduto.Create;
begin
  FDAOGenericoProduto := TDAOGenerico<TProduto>.NovaInstancia();
  FDAOGenericoProdutoComposicao := TDAOGenerico<TProdutoComposicao>.NovaInstancia();
end;

procedure TDAOProduto.Delete(const pIdentificadorProduto: Integer);
begin
  FDAOGenericoProduto.Delete('idProduto', pIdentificadorProduto.ToString);
end;

destructor TDAOProduto.Destroy;
begin

  inherited;
end;

function TDAOProduto.Find(const pIdentificador: Integer): TProduto;
var
  lListaProdutoComposicao: TObjectList<TProdutoComposicao>;
  I: Integer;
begin
  Result := FDAOGenericoProduto.FindOne(pIdentificador);

  lListaProdutoComposicao := TObjectList<TProdutoComposicao>.Create;

  try
    FDAOGenericoProdutoComposicao
        .FindJoin(
          'ProdutoComposicao.id,' +
          'ProdutoComposicao.idProduto,' +
          'ProdutoComposicao.idProdutoComposicao,' +
          'ProdutoComposicao.VlCusto,' +
          'ProdutoComposicao.QtComposicao,' +
          'Produto.Descricao',
          'ProdutoComposicao Inner Join Produto on (Produto.id = ProdutoComposicao.IdProdutoComposicao)',
          'ProdutoComposicao.IdProduto =' + QuotedStr(Result.Id.ToString),
          lListaProdutoComposicao);

    for I := 0 to lListaProdutoComposicao.Count-1 do
    begin
      Result.ProdutosComposicao.Add(TProdutoComposicao.Create());
      Result.ProdutosComposicao[I].IdentificadorProduto := lListaProdutoComposicao[I].IdentificadorProduto;
      Result.ProdutosComposicao[I].IdentificadorProdutoComposicao := lListaProdutoComposicao[I].IdentificadorProdutoComposicao;
      Result.ProdutosComposicao[I].Descricao := lListaProdutoComposicao[I].Descricao;
      Result.ProdutosComposicao[I].Quantidade := lListaProdutoComposicao[I].Quantidade;
      Result.ProdutosComposicao[I].ValorCusto := lListaProdutoComposicao[I].ValorCusto;
    end;
  finally
    lListaProdutoComposicao.Free();
  end;
end;

function TDAOProduto.Insert(const pProduto: TProduto): Integer;
var
  lIdentificadorProduto: Integer;
  lProdutoComposicao: TProdutoComposicao;
begin
  lIdentificadorProduto := FDAOGenericoProduto.Insert(pProduto);

  for lProdutoComposicao in pProduto.ProdutosComposicao do
  begin
    lProdutoComposicao.IdentificadorProduto := lIdentificadorProduto;
    FDAOGenericoProdutoComposicao.Insert(lProdutoComposicao);
  end;

  Result := lIdentificadorProduto;
end;

class function TDAOProduto.NovaInstancia: IDAOProduto;
begin
  Result := Self.Create;
end;

procedure TDAOProduto.Update(const pProduto: TProduto);
var
  lProdutoComposicao: TProdutoComposicao;
begin
  FDAOGenericoProduto.Update(pProduto);

  FDAOGenericoProdutoComposicao.Delete('idProduto', pProduto.Id.ToString);

  for lProdutoComposicao in pProduto.ProdutosComposicao do
  begin
    lProdutoComposicao.IdentificadorProduto := pProduto.Id;
    FDAOGenericoProdutoComposicao.Insert(lProdutoComposicao);
  end;
end;

end.

