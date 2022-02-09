unit WallVendas.DAO.ProdutoComposicao;

interface

uses
  WallVendas.DAO.Generico,
  WallVendas.Model.Produto,
  WallVendas.Model.ProdutoComposicao,
  System.SysUtils,
  System.Generics.Collections,

  SimpleInterface,
  SimpleDAO,
  SimpleAttributes,
  SimpleQueryFiredac,
  WallVendas.Context.Conexao,

  Vcl.Forms, Data.DB, LibTypes,
  FireDAC.Comp.Client;

type

  IDAOProdutoComposicao = interface
    ['{1AD40FFA-B1BC-4CFA-8F44-04C45C298918}']
    function Find(const pIdentificador: Integer): TObjectList<TProdutoComposicao>;
    function Insert(const pProduto: TProduto): Integer;
    procedure Update(const pProduto: TProduto);
    procedure Delete(const pIdentificadorProduto: Integer);
  end;

  TDAOProdutoComposicao = class (TInterfacedObject, IDAOProdutoComposicao)
  private
    FProduto: TProduto;
    FDAOGenericoProduto: IDAO<TProduto>;
    FDAOGenericoProdutoComposicao: IDAO<TProdutoComposicao>;

    FConexao: IConexao;

    FDAOProdutoComposicao: iSimpleDAO<TProdutoComposicao>;

    FLista: TObjectList<TProdutoComposicao>;
    constructor Create( );

  public
    destructor Destroy; override;
    class function NovaInstancia(): IDAOProdutoComposicao;
    function Find(const pIdentificador: Integer): TObjectList<TProdutoComposicao>;
    function Insert(const pProduto: TProduto): Integer;
    procedure Update(const pProduto: TProduto);
    procedure Delete(const pIdentificadorProduto: Integer);

  end;

implementation

{ TDAOProdutoComposicao<T> }

constructor TDAOProdutoComposicao.Create;
begin
//  FDAOGenericoProduto := TDAOGenerico<TProduto>.NovaInstancia();
//  FDAOGenericoProdutoComposicao := TDAOGenerico<TProdutoComposicao>.NovaInstancia();

//
  FConexao := TConexao.NovaInstancia();
//  FDAOGenerico := TSimpleDAO<TProduto>
//                    .New(TSimpleQueryFiredac.New(FConexao.Conexao));

//
  FDAOProdutoComposicao := TSimpleDAO<TProdutoComposicao>
                            .New(TSimpleQueryFiredac.New(FConexao.Conexao));


 // FListaEntidade := TObjectList<T>.Create(True);

  FLista := TObjectList<TProdutoComposicao>.Create(True);

//  FProduto := TProduto.Create();
end;

procedure TDAOProdutoComposicao.Delete(const pIdentificadorProduto: Integer);
begin
  FDAOGenericoProduto.Delete('idProduto', pIdentificadorProduto.ToString);
end;

destructor TDAOProdutoComposicao.Destroy;
begin
  FLista.Free();
//   if (Assigned(FLista)) then
//    FLista.Free();

//  FProduto.Free();
  inherited;
end;

function TDAOProdutoComposicao.Find(const pIdentificador: Integer): TObjectList<TProdutoComposicao>;
var
  lListaProdutoComposicao: TObjectList<TProdutoComposicao>;
  lProduto: TProduto;
  lProdutoComposicao: TProdutoComposicao;
begin
//  Result := FDAOGenerico.Find(pIdentificador);

 // lListaProdutoComposicao := TObjectList<TProdutoComposicao>.Create(true);

  FDAOProdutoComposicao
    .SQL
      .Where('idProduto=292')
    .&End
    .Find(FLista);

    Result := FLista;

//  for lProdutoComposicao in lListaProdutoComposicao do
//    Result.ProdutosComposicao.Add(lProdutoComposicao);

 // Result.ProdutosComposicao := FLista;

 // lListaProdutoComposicao.Free();






  //lProdutoComposicao := FDAOGenericoPC.Find(1682);

//  if (Assigned(FLista)) then
//    FLista.Free();

//  lListaProdutoComposicao := TObjectList<TProdutoComposicao>.Create();
//
//  FDAOGenericoPC
//    .SQL
//      .Where('idProduto=292')
//    .&End
//    .Find(lListaProdutoComposicao);
//
//  for lProdutoComposicao in lListaProdutoComposicao do
//    FProduto.ProdutosComposicao.Add(lProdutoComposicao);

//  lListaProdutoComposicao.Free();





{ funcionou
  Result := FDAOGenerico.Find(pIdentificador);

  lProdutoComposicao := FDAOGenericoPC.Find(1682);

  Result.ProdutosComposicao.Add(lProdutoComposicao);
  }

//  lListaProdutoComposicao := TObjectList<TProdutoComposicao>.Create();
//
//  try
//    FDAOGenericoPC
//      .SQL
//        .Where('idProduto = 292')
//      .&End
//      .Find(lListaProdutoComposicao);
//
//    for lProdutoComposicao in lListaProdutoComposicao do
//      Result.ProdutosComposicao.Add(lProdutoComposicao);
//
//  finally
//    lListaProdutoComposicao.Free();
//  end;









 // FDAOGenericoPC.Find('idProduto', 292);

//  //lProdutoComposicao := FDAOGenericoPC.Find(1682);
//  try
//    lListaProdutoComposicao := TObjectList<TProdutoComposicao>.Create();
//
//    try
////      FDAOGenericoPC
////        .SQL
////          .Where('idProduto=292')
////        .&End
////        .Find(lListaProdutoComposicao);
////
////     // Result.ProdutosComposicao := lListaProdutoComposicao;
////
////      for lProdutoComposicao in lListaProdutoComposicao do
////      begin
////        Result.ProdutosComposicao.Add(lProdutoComposicao);
////      end;
//
//
//    finally
//      lListaProdutoComposicao.Free();
//    end;
//  finally
////    lProduto.Free();
//  end;













//  Result := FDAOGenericoProduto.FindOne(pIdentificador);
//
//  lListaProdutoComposicao := TObjectList<TProdutoComposicao>.Create();
//
//  try
//   lListaProdutoComposicao := TObjectList<TProdutoComposicao>.Create();
////
//    try
//      FDAOGenericoPC
//        .SQL
//          .Where('idProduto=292')
//        .&End
//        .Find(lListaProdutoComposicao);
//
//      for lProdutoComposicao in lListaProdutoComposicao do
//      begin
//        lProduto.ProdutosComposicao.Add(lProdutoComposicao);
//      end;
//
//
//    finally
//      lListaProdutoComposicao.Free();
//    end;




//    Result.ProdutosComposicao :=
//
//    FDAOGenericoProdutoComposicao
//      .FindJoin(
//        'ProdutoComposicao.id,' +
//        'ProdutoComposicao.idProduto,' +
//        'ProdutoComposicao.idProdutoComposicao,' +
//        'ProdutoComposicao.VlCusto,' +
//        'ProdutoComposicao.QtComposicao,' +
//        'Produto.Descricao',
//        'ProdutoComposicao Inner Join Produto on (Produto.id = ProdutoComposicao.IdProdutoComposicao)',
//        'ProdutoComposicao.IdProduto =' + QuotedStr(lProduto.Id.ToString));
//  finally
//    lListaProdutoComposicao.Free;
//  end;
//  //



  //lProduto.Free();

//  //FDAOGenericoPC.Find('idProduto', 292);
//
//  //lProdutoComposicao := FDAOGenericoPC.Find(1682);
//  try
//    lListaProdutoComposicao := TObjectList<TProdutoComposicao>.Create();
//
//    try
//      FDAOGenericoPC
//        .SQL
//          .Where('idProduto=292')
//        .&End
//        .Find(lListaProdutoComposicao);
//
//      for lProdutoComposicao in lListaProdutoComposicao do
//      begin
//        lProduto.ProdutosComposicao.Add(lProdutoComposicao);
//      end;
//
//
//    finally
//      lListaProdutoComposicao.Free();
//    end;
//  finally
//    lProduto.Free();
//  end;
 //





//  FProduto := FDAOGenericoProduto.FindOne(pIdentificador);
//
//  //lProdutoComposicao := FDAOGenericoProdutoComposicao.FindOne(1682);
//
//  //FProduto.ProdutosComposicao.Add(lProdutoComposicao);
//
//  if FProduto.PossuiComposicao = '1' then
//    FProduto.ProdutosComposicao :=
//      FDAOGenericoProdutoComposicao.FindJoin(
//        'ProdutoComposicao.id,' +
//        'ProdutoComposicao.idProduto,' +
//        'ProdutoComposicao.idProdutoComposicao,' +
//        'ProdutoComposicao.VlCusto,' +
//        'ProdutoComposicao.QtComposicao,' +
//        'ProdutoComposicao.VlItem,' +
//        'Produto.Descricao',
//        'Inner Join Produto on (Produto.id = ProdutoComposicao.IdProdutoComposicao)',
//        'ProdutoComposicao.IdProduto =' + QuotedStr(pIdentificador.ToString));
//
//  Result := FProduto;
end;

function TDAOProdutoComposicao.Insert(const pProduto: TProduto): Integer;
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

class function TDAOProdutoComposicao.NovaInstancia: IDAOProdutoComposicao;
begin
  Result := Self.Create;
end;

procedure TDAOProdutoComposicao.Update(const pProduto: TProduto);
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

