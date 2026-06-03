table 50114 RentalPriceList
{
    Caption = 'RentalPriceList';
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
        field(3; RentalTypeCode; Code[20])
        {
            Caption = 'RentalTypeCode';
            NotBlank = true;
        }
        field(4; StartingDate; Date)
        {
            Caption = 'StartingDate';
            trigger OnValidate()
            begin
                if EndingDate <= StartingDate then
                    Error('Starting date must be smaller than ending date');
            end;
        }
        field(5; EndingDate; Date)
        {
            Caption = 'EndingDate';
        }
        field(6; DailyRate; Decimal)
        {
            Caption = 'DailyRate';
            MinValue = 0;
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
