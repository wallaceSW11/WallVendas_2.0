unit Lib;

interface

function CharToBoolean(const pChar: Char): Boolean;

implementation

function CharToBoolean(const pChar: Char): Boolean;
begin
  Result := pChar = '1';
end;

end.
