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
                RentalType: Record "RentalType";
                RentalPriceList: Record RentalPriceList;
                Price: Decimal;
            begin
                // preveri ali kolo obstaja
                if not Bike.Get("Bicycle No.") then
                    Error('Izbranega kolesa ni mogoče najti.');

                // preveri status
                if Bike.Status <> Bike.Status::Available then
                    Error('Kolo mora biti Available (Na voljo).');

                // nastavi opis
                Description := Bike.Description;

                // preveri Rental Header
                if not RentalHeader.Get("Rental No.") then
                    Error('Za vrstico ne obstaja Rental Header.');

                // preveri Rental Type
                if Bike."Rental Type Code" = '' then
                    Error('Izbrano kolo nima določenega tipa kolesa.');

                // poišči ceno iz cenika
                Price := RentalPriceList.FindPrice(
                    Bike."Rental Type Code",
                    RentalHeader."Rental Date");

                // če cenik obstaja
                if Price <> 0 then
                    "Daily Rate" := Price
                else begin

                    // fallback na osnovno ceno iz RentalType
                    if not RentalType.Get(Bike."Rental Type Code") then
                        Error('Rental Type ne obstaja.');

                    if RentalType."Daily Rate" <= 0 then
                        Error(
                            'Za izbrani tip kolesa ne obstaja niti veljaven cenik niti osnovna cena.');

                    "Daily Rate" := RentalType."Daily Rate";
                end;

                UpdateLineAmount();
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
                UpdateLineAmount();
            end;
        }

        field(6; "Rental Days"; Integer)
        {
            Caption = 'Rental Days';

            trigger OnValidate()
            begin
                if "Rental Days" <= 0 then
                    Error('Rental Days mora biti večji od 0.');

                UpdateLineAmount();
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

    local procedure UpdateLineAmount()
    begin
        "Line Amount" := "Daily Rate" * "Rental Days";
    end;
}