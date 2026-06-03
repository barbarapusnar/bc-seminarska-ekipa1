namespace bcseminarskaekipa.bcseminarskaekipa;

codeunit 50120 "RentalManagement"
{
    procedure StartRental(var RentalHeader: Record "RentalHeader")
    var
        RentalLine: Record "RentalLine";
        Bicycle: Record Bicycle;
    begin
        // Preveri status
        if RentalHeader.Status <> RentalHeader.Status::Open then
            Error('Rental must have status Open.');

        // Preveri ali obstajajo vrstice
        RentalLine.SetRange("Rental No.", RentalHeader."No.");

        if RentalLine.IsEmpty() then
            Error('Rental must contain at least one line.');

        // Preveri kolesa
        if RentalLine.FindSet() then
            repeat
                if not Bicycle.Get(RentalLine."Bicycle No.") then
                    Error('Bicycle %1 does not exist.', RentalLine."Bicycle No.");

                if Bicycle.Status <> Bicycle.Status::Available then
                    Error('Bicycle %1 is not available.', Bicycle."No.");

            until RentalLine.Next() = 0;

        // Nastavi kolesa na Rented
        if RentalLine.FindSet() then
            repeat
                Bicycle.Get(RentalLine."Bicycle No.");

                Bicycle.Status := Bicycle.Status::Rented;
                Bicycle.Modify();

            until RentalLine.Next() = 0;

        // Posodobi rental
        RentalHeader.Status := RentalHeader.Status::Active;
        RentalHeader.Modify();

        Message('Rental started successfully.');
    end;

    procedure ProcessReturn(var RentalHeader: Record "RentalHeader")
    var
        RentalLine: Record "RentalLine";
        Bicycle: Record Bicycle;
    begin
        // Preveri status
        if RentalHeader.Status <> RentalHeader.Status::Active then
            Error('Rental must have status Active.');

        // Preveri vrstice
        RentalLine.SetRange("Rental No.", RentalHeader."No.");

        if RentalLine.IsEmpty() then
            Error('Rental must contain at least one line.');

        // Preveri obstoj koles
        if RentalLine.FindSet() then
            repeat
                if not Bicycle.Get(RentalLine."Bicycle No.") then
                    Error('Bicycle %1 does not exist.', RentalLine."Bicycle No.");

            until RentalLine.Next() = 0;

        // Nastavi kolesa na Available
        if RentalLine.FindSet() then
            repeat
                Bicycle.Get(RentalLine."Bicycle No.");

                Bicycle.Status := Bicycle.Status::Available;
                Bicycle.Modify();

            until RentalLine.Next() = 0;

        // Posodobi rental
        RentalHeader."Actual Return Date" := Today;
        RentalHeader.Status := RentalHeader.Status::Returned;
        RentalHeader.Modify();

        Message('Rental returned successfully.');
    end;
}
