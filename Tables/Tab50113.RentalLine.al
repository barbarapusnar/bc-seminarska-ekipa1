table 50113 "RentalLine"
{
    Caption = 'Rental Line';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Rental No."; Code[20])
        {
            Caption = 'Rental No.';
            TableRelation = "RentalHeader"."No.";
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(3; "Bicycle No."; Code[20])
        {
            Caption = 'Bicycle No.';
            TableRelation = Bicycle."No.";
            trigger OnValidate()
            var
                Bike: Record Bicycle;
            begin
                if not Bike.Get("Bicycle No.") then
                    Error('Izbranega kolesa ni mogoče najti.');

                if Bike.Status <> Bike.Status::Available then
                    Error('Kolo mora biti Available (Na voljo).');

                Description := Bike.Description;

                UpdatePrice();
            end;
        }
        field(4; Description; Text[300])
        {
            Caption = 'Description';
        }
        field(5; "Daily Rate"; Decimal)
        {
            Caption = 'Daily Rate';

            trigger OnValidate()
            begin
                CalculateLineAmount();
            end;
        }
        field(6; "Rental Days"; Integer)
        {
            Caption = 'Rental Days';

            trigger OnValidate()
            begin
                if "Rental Days" <= 0 then
                    Error('Rental Days mora biti vecji od 0');

                CalculateLineAmount();
            end;
        }
        field(7; "Line Amount"; Decimal)
        {
            Caption = 'Line Amount';
            Editable = false;
        }
    }
    keys
    {
        key(PK; "Rental No.", "Line No.")
        {
            Clustered = true;
        }
    }
    local procedure UpdatePrice()
    var
        RentalHeader: Record "RentalHeader";
        Bike: Record Bicycle;
        RentalType: Record RentalType;
        RentalPrice: Record RentalPrice;
        PriceFound: Boolean;
    begin
        // Rental Header mora obstajati
        if not RentalHeader.Get("Rental No.") then
            Error('Za vrstico ne obstaja Rental Header.');

        // Kolo mora obstajati
        if not Bike.Get("Bicycle No.") then
            Error('Izbranega kolesa ni mogoče najti.');

        // Kolo mora imeti Rental Type
        if Bike."Rental Type Code" = '' then
            Error('Izbrano kolo nima določenega tipa kolesa.');

        // Poišči veljaven cenik
        RentalPrice.Reset();
        RentalPrice.SetRange(RentalTypeCode, Bike."Rental Type Code");
        RentalPrice.SetFilter(StartingDate, '<=%1', RentalHeader."Rental Date");
        RentalPrice.SetFilter(EndingDate, '>=%1', RentalHeader."Rental Date");

        PriceFound := false;

        if RentalPrice.FindFirst() then begin
            Validate("Daily Rate", RentalPrice.DailyRate);
            PriceFound := true;
        end;

        // Če cenika ni, uporabi Rental Type
        if not PriceFound then begin
            if not RentalType.Get(Bike."Rental Type Code") then
                Error(
                    'Za tip kolesa %1 ne obstaja Rental Type.',
                    Bike."Rental Type Code");

            if RentalType."Daily Rate" <= 0 then
                Error(
                    'Za tip kolesa %1 ne obstaja niti veljaven cenik niti osnovna cena.',
                    Bike."Rental Type Code");

            Validate("Daily Rate", RentalType."Daily Rate");
        end;

        CalculateLineAmount();
    end;

    local procedure CalculateLineAmount()
    begin
        "Line Amount" := "Daily Rate" * "Rental Days";
    end;
}
