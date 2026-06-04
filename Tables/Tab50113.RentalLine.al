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
                RentalHeader: Record "RentalHeader";
                RentalType: Record RentalType;
                PriceList: Record RentalPriceList;
            begin
                // 1. Header check
                if not RentalHeader.Get("Rental No.") then
                    Error('Rental Header ne obstaja.');

                if RentalHeader."Rental Date" = 0D then
                    Error('Rental Date ni nastavljen v glavi izposoje.');

                // 2. Bicycle check
                if not Bike.Get("Bicycle No.") then
                    Error('Izbranega kolesa ni mogoče najti.');

                if Bike.Status <> Bike.Status::Available then
                    Error('Kolo mora biti Available (Na voljo).');

                if Bike."Rental Type Code" = '' then
                    Error('Kolo nima določenega tipa kolesa.');

                Description := Bike.Description;

                // 3. Price list (CENIK)
                PriceList.Reset();
                PriceList.SetRange(RentalTypeCode, Bike."Rental Type Code");
                PriceList.SetFilter(StartingDate, '<=%1', RentalHeader."Rental Date");
                PriceList.SetFilter(EndingDate, '>=%1', RentalHeader."Rental Date");

                if PriceList.FindFirst() then begin
                    "Daily Rate" := PriceList.DailyRate;
                end else begin

                    // fallback na Rental Type
                    if not RentalType.Get(Bike."Rental Type Code") then
                        Error('Rental Type ne obstaja.');

                    if RentalType."Daily Rate" <= 0 then
                        Error(
                            'Za tip kolesa %1 ni veljavne cene (cenik ali osnovna cena).',
                            Bike."Rental Type Code");

                    "Daily Rate" := RentalType."Daily Rate";
                end;

                // 4. Calculate amount
                "Line Amount" := "Daily Rate" * "Rental Days";
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
                "Line Amount" := "Daily Rate" * "Rental Days";
            end;
        }

        field(6; "Rental Days"; Integer)
        {
            Caption = 'Rental Days';

            trigger OnValidate()
            begin
                if "Rental Days" <= 0 then
                    Error('Rental Days mora biti vecji od 0');

                "Line Amount" := "Daily Rate" * "Rental Days";
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
}