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



    procedure OpenFreeCars(var x: Notification);
    var
        Cars: Record Cars;
        CarsList: Page CarList;
    begin
        Cars.Reset();
        Cars.SetRange(Reserved, false);

        CarsList.SetRecord(Cars);
        CarsList.Run();
    end;
}