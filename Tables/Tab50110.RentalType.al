table 50110 "RentalType"
{
    Caption = 'Rental Type';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
            NotBlank = true;
        }
        field(2; Description; Text[300])
        {
            Caption = 'Description';
        }
        field(3; "Daily Rate"; Decimal)
        {
            Caption = 'Daily Rate';
            MinValue = 0;
        }
        field(4; "Max Rental Days"; Integer)
        {
            Caption = 'Max Rental Days';
            MinValue = 1;
        }
        field(5; "Requires Deposit"; Boolean)
        {
            Caption = 'Requires Deposit';
        }
        field(6; "Deposit Amount"; Decimal)
        {
            Caption = 'Deposit Amount';
            trigger OnValidate()
            begin
                if "Requires Deposit" = true then
                    if "Deposit Amount" <= 0 then
                        Error('Deposit amount must be greater than 0 if a deposit is required');
            end;
        }
    }
    keys
    {
        key(PK; "Code")
        {
            Clustered = true;
        }
    }
}
