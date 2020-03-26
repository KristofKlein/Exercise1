table 70100 "Cars"
{
    DataClassification = SystemMetadata;

    fields
    {
        field(1; EntryNo; BigInteger)
        {
            AutoIncrement = true;
        }
        field(2; Brand; Text[250])
        {
        }
        field(3; ManfacureYear; Integer)
        {
            NotBlank = true;
            MinValue = 0;
        }
        field(4; EngineType; Option)
        {
            OptionMembers = "None","Diesel","Gas","Electro","Fluxcompensator";
        }

        field(5; used; Boolean)
        {
        }
        field(6; Milage; Integer)
        {
        }
        field(7; "EngineSpecs"; Text[250])
        {
        }
        field(8; Reserved; Boolean)
        {
            trigger OnValidate()
            begin
                if Rec.Reserved = true then begin
                    Rec.ReservedAt := WorkDate();
                    rec.ReservedBy := COPYSTR(UserId(), 1, 250);
                end else begin
                    Rec.ReservedAt := 0D;
                    Rec.ReservedBy := '';

                end;
            end;
        }
        field(9; ReservedBy; Text[250])
        {
        }
        field(10; ReservedAt; Date) { }
        field(11; DealChance; Enum DealChance)
        {
        }
    }

    keys
    {
        key(PK; EntryNo)
        {
            Clustered = true;
        }
    }
}