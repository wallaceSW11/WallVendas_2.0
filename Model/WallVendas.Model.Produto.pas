unit WallVendas.Model.Produto;

interface

uses
  WallVendas.Model.Base,
  SimpleAttributes;

type
  [Tabela('Produto')]
  TProduto = class(TModeloBase)
  private
    FUnidadeCompra: string;
    FDescricao: string;
    FPrecoVenda: Double;
    FPossuiComposicao: Char;
    FMargemLucro: Double;
    procedure SetDescricao(const Value: string);
    procedure SetUnidadeCompra(const Value: string);
//    function PrecoVenda: Double;
    procedure SetPrecoVenda(const Value: Double);
   function GetPrecoVenda: Double;
    procedure SetMargemLucro(const Value: Double);
    procedure SetPossuiComposicao(const Value: Char);
  public
    [Campo('Descricao'), Display('Descrição')]
    property Descricao: string read FDescricao write SetDescricao;
    [Campo('UnidadeCompra'), Display('Unidade')]
    property UnidadeCompra: string read FUnidadeCompra write SetUnidadeCompra;
    [Campo('StPossuiComposicao')]
    property PossuiComposicao: Char read FPossuiComposicao write SetPossuiComposicao;
    [Campo('MargemLucro')]
    property MargemLucro: Double read FMargemLucro write SetMargemLucro;





    function PrecoVenda(): Double;
  end;

implementation

{ TProduto }

function TProduto.PrecoVenda: Double;
begin
  Result := 101;
end;

function TProduto.GetPrecoVenda: Double;
begin
  Result := 10;
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

procedure TProduto.SetPrecoVenda(const Value: Double);
begin
  FPrecoVenda := Value;
end;

procedure TProduto.SetUnidadeCompra(const Value: string);
begin
  FUnidadeCompra := Value;
end;

end.
