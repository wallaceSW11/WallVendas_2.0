unit WallVendas.Model.Despesas;

interface

type
  TDespesas = class
  private
    FValor: Currency;
    FDescricao: string;
    procedure SetDescricao(const Value: string);
    procedure SetValor(const Value: Currency);
  public
    property Descricao: string read FDescricao write SetDescricao;
    property Valor: Currency read FValor write SetValor;
  end;

implementation

{ TDespesas }

procedure TDespesas.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

procedure TDespesas.SetValor(const Value: Currency);
begin
  FValor := Value;
end;

end.
