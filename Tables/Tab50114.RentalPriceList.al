table 50114 RentalPriceList
{
    Caption = 'RentalPriceList';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
        }
        field(2; Description; Text[300])
        {
            Caption = 'Description';
        }
        field(3; RentalTypeCode; Code[20])
        {
            Caption = 'RentalTypeCode';
        }
        field(4; StartingDate; Date)
        {
            Caption = 'StartingDate';
        }
        field(5; EndingDate; Date)
        {
            Caption = 'EndingDate';
        }
        field(6; DailyRate; Decimal)
        {
            Caption = 'DailyRate';
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
