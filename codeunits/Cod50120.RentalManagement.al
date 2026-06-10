namespace bcseminarskaekipa.bcseminarskaekipa;
using Microsoft.Sales.Document;

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

    procedure CreateSalesInvoice(var RentalHeader: Record "RentalHeader")
    var
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
        RentalLine: Record "RentalLine";
        LineNo: Integer;
    begin
        if RentalHeader.Status <> RentalHeader.Status::Returned then
            Error('Izposoja mora biti zaključena (Returned).');

        if RentalHeader."Customer No." = '' then
            Error('Customer No. mora biti nastavljen.');

        RentalLine.SetRange("Rental No.", RentalHeader."No.");
        if not RentalLine.FindFirst() then
            Error('Izposoja nima vrstic.');

        // Create Sales Header
        SalesHeader.Init();
        SalesHeader.Validate("Document Type", SalesHeader."Document Type"::Invoice);
        SalesHeader.Insert(true);

        SalesHeader.Validate("Sell-to Customer No.", RentalHeader."Customer No.");
        SalesHeader.Validate("Posting Date", Today());
        SalesHeader.Validate("Document Date", Today());
        SalesHeader.Modify(true);

        // Create Sales Lines
        LineNo := 10000;

        repeat
            SalesLine.Init();
            SalesLine.Validate("Document Type", SalesHeader."Document Type");
            SalesLine.Validate("Document No.", SalesHeader."No.");
            SalesLine."Line No." := LineNo;
            SalesLine.Insert(true);

            SalesLine.Validate(Type, SalesLine.Type::Item);
            SalesLine.Validate("No.", 'RENTAL');
            SalesLine.Validate(Description, RentalLine.Description);
            SalesLine.Validate(Quantity, RentalLine."Rental Days");
            SalesLine.Validate("Unit Price", RentalLine."Daily Rate");

            SalesLine.Modify(true);

            LineNo += 10000;
        until RentalLine.Next() = 0;

        Message('Sales Invoice %1 je bila ustvarjena.', SalesHeader."No.");
    end;
}
