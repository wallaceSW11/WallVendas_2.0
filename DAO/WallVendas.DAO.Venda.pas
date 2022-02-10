unit WallVendas.DAO.Venda;

interface

uses
  wallvendas.DAO.Generico,
  wallvendas.Model.Venda,
  Data.DB, System.SysUtils;

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
//    FDAOVendaItem: IDAO<TVendaItem>;
//    FDAOVendaPagamento: IDAO<TVendaPagamento>;
    constructor Create(var pDataSource: TDataSource);
  public
    destructor Destroy(); override;
    class function NovaInstancia(var pDataSource: TDataSource): IDAOVenda;
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
end;

procedure TDAOVenda.Delete(const pIdentificadorVenda: Integer);
begin

end;

destructor TDAOVenda.Destroy;
begin

  inherited;
end;

function TDAOVenda.Find(const pIdentificador: Integer): TVenda;
begin
  Result := FDAOVenda.FindOne(pIdentificador);
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

end;

class function TDAOVenda.NovaInstancia(var pDataSource: TDataSource): IDAOVenda;
begin
  Result := Self.Create(pDataSource);
end;

procedure TDAOVenda.Update(const pVenda: TVenda);
begin

end;

end.
