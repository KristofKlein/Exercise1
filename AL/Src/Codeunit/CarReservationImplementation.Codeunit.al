codeunit 70113 "CarReservationImplementation"
{
    Access = Internal;
    procedure ReserveCar(Var Car: Record Cars)
    begin
        if Car.Reserved then
            Car.Validate(Reserved, false)
        else
            Car.Validate(Reserved, true);
        Car.Modify(true);
    end;

    procedure ReserveCar(Var Car: Record Cars; DealChance: Enum DealChance)
    begin
        if Car.Reserved then
            Car.DealChance := DealChance::" "
        else
            Car.DealChance := DealChance;

        ReserveCar(Car);
    end;
}