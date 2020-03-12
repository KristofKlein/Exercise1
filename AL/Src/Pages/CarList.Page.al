page 70100 CarList
{
    PageType = List;
    Caption = 'Cars';
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Cars;
    CardPageId = CarCard;

    layout
    {
        area(Content)
        {
            repeater(Cars)
            {
                field(EntryNo; rec.EntryNo)
                {
                    ApplicationArea = All;
                }
                field(Brand; Brand)
                {
                    ApplicationArea = All;
                }

                field(MyField; rec.Milage)
                {
                    ApplicationArea = All;
                }
                field(Type; rec.EngineType)
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
                image = Reserve;
                trigger OnAction()
                begin
                    rec.HandleReservation();
                end;
            }
        }
    }

}