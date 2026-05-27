namespace bcseminarskaekipa.bcseminarskaekipa;

codeunit 50110 "Rental Management"
{
    procedure StartRental(var RentalHeader: Record RentalHeader)
    var
        RentalLine: Record RentalLine;
        Bike: Record Bicycle;
    begin
        // Preveri status
        if RentalHeader.Status <> RentalHeader.Status::Open then
            Error('Rental must be Open.');

        // Preveri ali obstajajo vrstice
        RentalLine.SetRange("Rental No.", RentalHeader."No.");

        if RentalLine.IsEmpty() then
            Error('Rental contains no lines.');

        // Preveri ali so vsa kolesa available
        if RentalLine.FindSet() then begin
            repeat
                if not Bike.Get(RentalLine."Bicycle No.") then
                    Error('Bike %1 does not exist.', RentalLine."Bicycle No.");

                if Bike.Status <> Bike.Status::Available then
                    Error('Bike %1 is not available.', Bike."No.");
            until RentalLine.Next() = 0;
        end;

        // Nastavi bike status = Rented
        if RentalLine.FindSet() then begin
            repeat
                Bike.Get(RentalLine."Bicycle No.");
                Bike.Status := Bike.Status::Rented;
                Bike.Modify();
            until RentalLine.Next() = 0;
        end;

        // Spremeni status dokumenta
        RentalHeader.Status := RentalHeader.Status::Active;
        RentalHeader.Modify();

        Message('Rental started successfully.');
    end;

    procedure ProcessReturn(var RentalHeader: Record RentalHeader)
    var
        RentalLine: Record RentalLine;
        Bike: Record Bicycle;
    begin
        // Preveri status
        if RentalHeader.Status <> RentalHeader.Status::Active then
            Error('Rental must be Active.');

        // Preveri vrstice
        RentalLine.SetRange("Rental No.", RentalHeader."No.");

        if RentalLine.IsEmpty() then
            Error('Rental contains no lines.');

        // Preveri obstoj koles
        if RentalLine.FindSet() then begin
            repeat
                if not Bike.Get(RentalLine."Bicycle No.") then
                    Error('Bike %1 does not exist.', RentalLine."Bicycle No.");
            until RentalLine.Next() = 0;
        end;

        // Nastavi bike status = Available
        // Nastavi datum vračila
        if RentalLine.FindSet() then begin
            repeat
                Bike.Get(RentalLine."Bicycle No.");
                Bike.Status := Bike.Status::Available;
                Bike.Modify();

                RentalHeader."Actual Return Date" := Today;
                RentalLine.Modify();
            until RentalLine.Next() = 0;
        end;

        // Spremeni status dokumenta
        RentalHeader.Status := RentalHeader.Status::Returned;
        RentalHeader.Modify();

        Message('Rental returned successfully.');
    end;
}
