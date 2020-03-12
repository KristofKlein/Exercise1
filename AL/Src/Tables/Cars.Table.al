table 70100 Cars
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
                    Rec.ReservedAt := WorkDate;
                    rec.ReservedBy := UserId;
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

    }

    keys
    {
        key(PK; EntryNo)
        {
            Clustered = true;
        }
    }
    procedure HandleReservation()
    begin
        if Reserved then begin
            rec.Validate(Reserved, false);
        end else begin
            rec.Validate(Reserved, true);
        end;

        Rec.Modify(true);


    end;

}