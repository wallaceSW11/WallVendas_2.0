unit WallVendas.Model.Venda;

interface

uses
  wallvendas.Model.Base,
  WallVendas.Model.VendaItem,
  WallVendas.Model.VendaPagamento,
  System.Generics.Collections,
  SimpleAttributes,
  libTypes;

type
  [Tabela('Documento')]
  TVenda = class(TModeloBase)
  private
    FObservacao: string;
    FDataEntrega: TDateTime;
    FValorLucro: Currency;
    FValorDescontoVenda: Currency;
    FIdentificadorPessoa: Integer;
    FStatus: Char;
    FValorSalario: Currency;
    FValorTotalVenda: Currency;
    FValorTotalInsumo: Currency;
    FDataCadastro: TDateTime;
    FValorAcrescimoVenda: Currency;
    FTipo: Char;
    FNomePessoa: string;
    FRecebimentos: TObjectList<TVendaPagamento>;
    FItensVenda: TObjectList<TVendaItem>;
    procedure SetDataCadastro(const Value: TDateTime);
    procedure SetDataEntrega(const Value: TDateTime);
    procedure SetIdentificadorPessoa(const Value: Integer);
    procedure SetObservacao(const Value: string);
    procedure SetStatus(const Value: Char);
    procedure SetTipo(const Value: Char);
    procedure SetValorAcrescimoVenda(const Value: Currency);
    procedure SetValorDescontoVenda(const Value: Currency);
    procedure SetValorLucro(const Value: Currency);
    procedure SetValorSalario(const Value: Currency);
    procedure SetValorTotalInsumo(const Value: Currency);
    procedure SetValorTotalVenda(const Value: Currency);
    procedure SetNomePessoa(const Value: string);
    procedure SetFItensVenda(const Value: TObjectList<TVendaItem>);
    procedure SetFRecebimentos(const Value: TObjectList<TVendaPagamento>);
  public
    [Campo('Tipo')]
    property Tipo: Char read FTipo write SetTipo;
    [Campo('Status')]
    property Status: Char read FStatus write SetStatus;
    [Campo('DataCadastro')]
    property DataCadastro: TDateTime read FDataCadastro write SetDataCadastro;
    [Campo('DataEntrega')]
    property DataEntrega: TDateTime read FDataEntrega write SetDataEntrega;
    [Campo('IdPessoa')]
    property IdentificadorPessoa: Integer read FIdentificadorPessoa write SetIdentificadorPessoa;
    [Ignore]
    property NomePessoa: string read FNomePessoa write SetNomePessoa;
    [Campo('VlAcrescimoVenda')]
    property ValorAcrescimoVenda: Currency read FValorAcrescimoVenda write SetValorAcrescimoVenda;
    [Campo('VlDescontoVenda')]
    property ValorDescontoVenda: Currency read FValorDescontoVenda write SetValorDescontoVenda;
    [Campo('VlTotalVenda')]
    property ValorTotalVenda: Currency read FValorTotalVenda write SetValorTotalVenda;
    [Campo('Observacao')]
    property Observacao: string read FObservacao write SetObservacao;
    [Campo('VlSalario')]
    property ValorSalario: Currency read FValorSalario write SetValorSalario;
    [Campo('VlLucro')]
    property ValorLucro: Currency read FValorLucro write SetValorLucro;
    [Campo('VlTotalInsumo')]
    property ValorTotalInsumo: Currency read FValorTotalInsumo write SetValorTotalInsumo;

    [Ignore]
    property ItensVenda: TObjectList<TVendaItem> read FItensVenda write SetFItensVenda;
    [Ignore]
    property Recebimentos: TObjectList<TVendaPagamento> read FRecebimentos write SetFRecebimentos;

    constructor Create();
    destructor Destroy(); override;

  end;

implementation

{ TVenda }

constructor TVenda.Create;
begin
  FItensVenda := TObjectList<TVendaItem>.Create();
  FRecebimentos := TObjectList<TVendaPagamento>.Create();
end;

destructor TVenda.Destroy;
begin
  FItensVenda.Free();
  FRecebimentos.Free();
  inherited;
end;

procedure TVenda.SetDataCadastro(const Value: TDateTime);
begin
  FDataCadastro := Value;
end;

procedure TVenda.SetDataEntrega(const Value: TDateTime);
begin
  FDataEntrega := Value;
end;

procedure TVenda.SetFItensVenda(const Value: TObjectList<TVendaItem>);
begin
  FItensVenda := Value;
end;

procedure TVenda.SetFRecebimentos(const Value: TObjectList<TVendaPagamento>);
begin
  FRecebimentos := Value;
end;

procedure TVenda.SetIdentificadorPessoa(const Value: Integer);
begin
  FIdentificadorPessoa := Value;
end;

procedure TVenda.SetNomePessoa(const Value: string);
begin
  FNomePessoa := Value;
end;

procedure TVenda.SetObservacao(const Value: string);
begin
  FObservacao := Value;
end;

procedure TVenda.SetStatus(const Value: Char);
begin
  FStatus := Value;
end;

procedure TVenda.SetTipo(const Value: Char);
begin
  FTipo := Value;
end;

procedure TVenda.SetValorAcrescimoVenda(const Value: Currency);
begin
  FValorAcrescimoVenda := Value;
end;

procedure TVenda.SetValorDescontoVenda(const Value: Currency);
begin
  FValorDescontoVenda := Value;
end;

procedure TVenda.SetValorLucro(const Value: Currency);
begin
  FValorLucro := Value;
end;

procedure TVenda.SetValorSalario(const Value: Currency);
begin
  FValorSalario := Value;
end;

procedure TVenda.SetValorTotalInsumo(const Value: Currency);
begin
  FValorTotalInsumo := Value;
end;

procedure TVenda.SetValorTotalVenda(const Value: Currency);
begin
  FValorTotalVenda := Value;
end;

end.
