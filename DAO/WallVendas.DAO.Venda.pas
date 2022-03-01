unit WallVendas.DAO.Venda;

interface

uses
  wallvendas.DAO.Generico,
  wallvendas.Model.Venda,
  Data.DB, System.SysUtils,
  System.Generics.Collections,
  WallVendas.Model.VendaItem,
  WallVendas.Model.VendaPagamento;

type
  IDAOVenda = interface
    ['{13D92361-AC60-4144-B82A-E92E6B42AAA9}']
    function Find(const pIdentificador: Integer): TVenda; overload;
    procedure Find(const pDataInicial: TDateTime; const pDataFinal: TDateTime); overload;
    function Insert(const pVenda: TVenda): Integer;
    procedure Update(const pVenda: TVenda);
    procedure Delete(const pIdentificadorVenda: Integer);
  end;

  TDAOVenda = class(TInterfacedObject, IDAOVenda)
  private
    FDAOVenda: IDAO<TVenda>;
    FDAOVendaItem: IDAO<TVendaItem>;
    FDAOVendaPagamento: IDAO<TVendaPagamento>;
    constructor Create(var pDataSource: TDataSource); overload;
    constructor Create(); overload;
  public
    destructor Destroy(); override;
    class function NovaInstancia(var pDataSource: TDataSource): IDAOVenda; overload;
    class function NovaInstancia(): IDAOVenda; overload;
    function Find(const pIdentificador: Integer): TVenda; overload;
    procedure Find(const pDataInicial: TDateTime; const pDataFinal: TDateTime); overload;
    function Insert(const pVenda: TVenda): Integer;
    procedure Update(const pVenda: TVenda);
    procedure Delete(const pIdentificadorVenda: Integer);
  end;

implementation

{ TDAOVenda }

constructor TDAOVenda.Create(var pDataSource: TDataSource);
begin
  FDAOVenda := TDAOGenerico<TVenda>.NovaInstancia(pDataSource);
  FDAOVendaItem := TDAOGenerico<TVendaItem>.NovaInstancia();
  FDAOVendaPagamento := TDAOGenerico<TVendaPagamento>.NovaInstancia();
end;

constructor TDAOVenda.Create();
begin
  FDAOVenda := TDAOGenerico<TVenda>.NovaInstancia();
  FDAOVendaItem := TDAOGenerico<TVendaItem>.NovaInstancia();
  FDAOVendaPagamento := TDAOGenerico<TVendaPagamento>.NovaInstancia();
end;

procedure TDAOVenda.Delete(const pIdentificadorVenda: Integer);
begin

end;

destructor TDAOVenda.Destroy;
begin

  inherited;
end;

function TDAOVenda.Find(const pIdentificador: Integer): TVenda;
var
  lItens: TObjectList<TVendaItem>;
  lRecebimentos: TObjectList<TVendaPagamento>;
  I: Integer;
begin
  Result := FDAOVenda.FindOne(pIdentificador);

  lItens := TObjectList<TVendaItem>.Create;
  lRecebimentos := TObjectList<TVendaPagamento>.Create();

  try
    FDAOVendaItem.FindWhere('IdDocumento=' + QuotedStr(pIdentificador.ToString), lItens);

    for I := 0 to lItens.Count-1 do
    begin
      Result.ItensVenda.Add(TVendaItem.Create());
      Result.ItensVenda[I].IdentificadorDocumento := pIdentificador;
      Result.ItensVenda[I].IdentificadorProduto := lItens[I].IdentificadorProduto;
      Result.ItensVenda[I].DescricaoProduto := lItens[I].DescricaoProduto;
      Result.ItensVenda[I].QuantidadeItem := lItens[I].QuantidadeItem;
      Result.ItensVenda[I].ValorUnitario := lItens[I].ValorUnitario;
      Result.ItensVenda[I].ValorDesconto := lItens[I].ValorDesconto;
      Result.ItensVenda[I].ValorAcrescimo := lItens[I].ValorAcrescimo;
      Result.ItensVenda[I].ValorItem := lItens[I].ValorItem;
      Result.ItensVenda[I].ValorSalario := lItens[I].ValorSalario;
      Result.ItensVenda[I].ValorLucro := lItens[I].ValorLucro;
      Result.ItensVenda[I].ValorTotalInsumo := lItens[I].ValorTotalInsumo;
    end;

    FDAOVendaPagamento.FindWhere('IdDocumento=' + QuotedStr(pIdentificador.ToString), lRecebimentos);

    for I := 0 to lRecebimentos.Count-1 do
    begin
      Result.Recebimentos.Add(TVendaPagamento.Create());
      Result.Recebimentos[I].IdentificadorDocumento := pIdentificador;
      Result.Recebimentos[I].DescricaoFormaPagamento := lRecebimentos[I].DescricaoFormaPagamento;
      Result.Recebimentos[I].ValorPagamento := lRecebimentos[I].ValorPagamento;
    end;

  finally
    lItens.Free();
    lRecebimentos.Free();
  end;
end;

procedure TDAOVenda.Find(const pDataInicial: TDateTime; const pDataFinal: TDateTime);
begin
  FDAOVenda.FindWhereDataSource(
    'Documento.*, Pessoa.Nome as NomePessoa',
    'Inner Join Pessoa on (Pessoa.id = Documento.IdPessoa)',
    '(DataCadastro >=' + QuotedStr(FormatDateTime('yyyy-mm-dd', pDataInicial)) + ' and DataCadastro <=' +
     QuotedStr(FormatDateTime('yyyy-mm-dd', pDataFinal)) + ')' );
end;

function TDAOVenda.Insert(const pVenda: TVenda): Integer;
begin
  Result := 0;
end;

class function TDAOVenda.NovaInstancia(var pDataSource: TDataSource): IDAOVenda;
begin
  Result := Self.Create(pDataSource);
end;

class function TDAOVenda.NovaInstancia(): IDAOVenda;
begin
  Result := Self.Create();
end;

procedure TDAOVenda.Update(const pVenda: TVenda);
begin

end;

end.
