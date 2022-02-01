unit Lib;

interface

function CharToBoolean(const pChar: Char): Boolean;
function BooleanToChar(const pBoolean: Boolean): Char;

implementation

function CharToBoolean(const pChar: Char): Boolean;
begin
  Result := pChar = '1';
end;

function BooleanToChar(const pBoolean: Boolean): Char;
begin
  if (pBoolean) then
    Exit('1');

  Result := '0';
end;

end.
