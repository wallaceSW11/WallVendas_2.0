unit WallVendas.DAO.Produto;

interface

uses
  WallVendas.DAO.Generico,
  WallVendas.Model.Produto,
  WallVendas.Model.ProdutoComposicao,
  System.SysUtils,
  System.Generics.Collections;

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
    FProduto: TProduto;
    FDAOProduto: IDAO<TProduto>;
    FDAOProdutoComposicao: IDAO<TProdutoComposicao>;
    constructor Create( );

  public
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
  FDAOProduto := TDAOGenerico<TProduto>.NovaInstancia();
  FDAOProdutoComposicao := TDAOGenerico<TProdutoComposicao>.NovaInstancia();
end;

procedure TDAOProduto.Delete(const pIdentificadorProduto: Integer);
begin

end;

function TDAOProduto.Find(const pIdentificador: Integer): TProduto;
begin
  FProduto := FDAOProduto.FindOne(pIdentificador);

  if FProduto.PossuiComposicao = '1' then
    FProduto.ProdutosComposicao :=
      FDAOProdutoComposicao.FindJoin(
        'ProdutoComposicao.id,' +
        'ProdutoComposicao.idProduto,' +
        'ProdutoComposicao.idProdutoComposicao,' +
        'ProdutoComposicao.VlCusto,' +
        'ProdutoComposicao.QtComposicao,' +
        'ProdutoComposicao.VlItem,' +
        'Produto.Descricao',
        'Inner Join Produto on (Produto.id = ProdutoComposicao.IdProdutoComposicao)',
        'IdProduto =' + QuotedStr(pIdentificador.ToString));

  Result := FProduto;
end;

function TDAOProduto.Insert(const pProduto: TProduto): Integer;
var
  lIdentificadorProduto: Integer;
  lProdutoComposicao: TProdutoComposicao;
begin
  lIdentificadorProduto := FDAOProduto.Insert(pProduto);

  for lProdutoComposicao in pProduto.ProdutosComposicao do
  begin
    lProdutoComposicao.IdentificadorProduto := lIdentificadorProduto;
    FDAOProdutoComposicao.Insert(lProdutoComposicao);
  end;
end;

class function TDAOProduto.NovaInstancia: IDAOProduto;
begin
  Result := Self.Create;
end;

procedure TDAOProduto.Update(const pProduto: TProduto);
begin

end;

end.

