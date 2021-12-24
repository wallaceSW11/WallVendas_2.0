unit WallVendas.Model.Base;

interface

uses
  SimpleAttributes;

type
  TModeloBase = class
  private
    FId: Integer;
    procedure SetId(const Value: Integer);

  public
    [Campo('id'), Pk, AutoInc, Display('Código')]
    property Id: Integer read FId write SetId;
  end;

implementation

{ TModeloBase }

procedure TModeloBase.SetId(const Value: Integer);
begin
  FId := Value;
end;

end.
