codeunit 70114 "EnumHelper"
{
    procedure EnumToCommaSeperatedText(var enum: Enum DealChance): Text
    var
        Names: List of [Text];
        Name: text;
        returnvalue: text;
    begin
        Names := enum.Names();
        foreach Name in Names do
            if Name <> ' ' then
                returnvalue += Name + ',';
        exit(returnvalue);
    end;
}