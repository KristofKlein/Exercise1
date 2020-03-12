page 70101 CarCard
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
                begin
                    rec.HandleReservation();
                end;
            }
        }
    }
}