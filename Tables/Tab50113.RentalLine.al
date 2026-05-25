table 50113 "Rental Line"
{
    Caption = 'Rental Line';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Rental No."; Code[20])
        {
            Caption = 'Rental No.';
            TableRelation = "Rental Header"."No.";
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
                if Bike.Get("Bicycle No.") then begin

                    if Bike.Status <> Bike.Status::Available then
                        Error('Kolo mora biti Available (Na voljo).');

                    Description := Bike.Description;
                end;
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
