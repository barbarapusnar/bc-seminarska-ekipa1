table 50113 RentalLine
{
    Caption = 'RentalLine';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Rental No."; Code[20])
        {
            Caption = 'Rental No.';
        }
        field(2; "Line No."; Code[20])
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
                        Error('ojoj 😱');
                    Description := Bike.Description;
                end
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
            MinValue = 1;
        }
        field(7; "Line Amount"; Decimal)
        {
            Caption = 'Line Amount';
            Editable = false;
        }
    }
    keys
    {
        key(PK; "Rental No.")
        {
            Clustered = true;
        }
    }
}
