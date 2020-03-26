codeunit 70112 "CarReservation"
{
    procedure ReserveCar(Var Car: Record Cars)
    var
        Impl: Codeunit CarReservationImplementation;
    begin
        IMpl.ReserveCar(Car);
    end;

    procedure ReserveCar(Var Car: Record Cars; DealChance: enum DealChance)
    var
        Impl: Codeunit CarReservationImplementation;
    begin
        IMpl.ReserveCar(Car, DealChance)
    end;
}