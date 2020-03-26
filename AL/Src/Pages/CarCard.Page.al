page 70101 "CarCard"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Cars;

    layout
    {
        area(Content)
        {
            group(Cars)
            {
                field(EntryNo; rec.EntryNo)
                {
                    ApplicationArea = All;

                }
                field(Brand; Brand)
                {
                    ApplicationArea = All;
                }

                field(Miage; rec.Milage)
                {
                    ApplicationArea = All;
                }
                field(Type; rec.EngineType)
                {
                    ApplicationArea = All;
                }
                field(EngineSpecs; rec.EngineSpecs)
                {
                    ApplicationArea = All;
                }
                field(ManfacureYear; ManfacureYear)
                {
                    ApplicationArea = All;
                }
            }
            group(ReservationStatus)
            {
                Editable = false;
                field(Reserved;
                Reserved)
                {
                    ApplicationArea = All;
                }
                field(ReservedAt; ReservedAt)
                {
                    ApplicationArea = All;
                }
                field(ReservedBy; ReservedBy)
                {
                    ApplicationArea = All;
                }
                field(Chance; DealChance)
                {
                    ApplicationArea = All;
                }

            }

        }
    }

    actions
    {
        area(Processing)
        {
            action(ToggleReservation)
            {
                ApplicationArea = All;
                Image = Reserve;

                trigger OnAction()
                var
                    CarReservation: Codeunit CarReservation;

                    EnumHelper: Codeunit EnumHelper;
                    _DealChance: Enum DealChance;

                begin
                    if rec.Reserved = false then begin
                        if Dialog.Confirm('Want to apply a winning chance as well?') then begin
                            _DealChance := Dialog.StrMenu(EnumHelper.EnumToCommaSeperatedText(_DealChance), 2);
                            if (_DealChance <> 0) then
                                CarReservation.ReserveCar(rec, _DealChance);
                        end else
                            CarReservation.ReserveCar(rec);
                    end
                    else
                        CarReservation.ReserveCar(rec);
                end;
            }
        }
    }
}