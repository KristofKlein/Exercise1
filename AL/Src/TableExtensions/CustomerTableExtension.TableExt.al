tableextension 70100 "CustomerTableExtension" extends Customer //18
{
    fields
    {
        field(70100; CD_Membership; Option)
        {
            OptionMembers = " ","base","silver","gold";
        }
        field(70101; CD_MemberID; Guid)
        {
        }
        field(70102; CD_UserName; Text[250])
        {
            trigger OnValidate()
            begin
                if (Rec.CD_UserName <> '') then begin
                    Rec.CD_UserName := CopyStr(Rec.CD_UserName.TrimStart(' ').TrimEnd(' '), 1, MaxStrLen(Rec.CD_UserName));
                    if Rec.CD_UserName.Contains('*') then
                        Error(InvalidCharacterInUserNameErr, '*', Rec.CD_UserName.IndexOf('*'));
                end;
            end;
        }
    }
    var
        InvalidCharacterInUserNameErr: Label '%1 is an invalid Character (Pos: %2)';

}
