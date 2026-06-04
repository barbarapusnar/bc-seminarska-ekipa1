table 50114 RentalPrice
{
    Caption = 'RentalPrice';
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
            TableRelation = "RentalType".Code;
            Caption = 'RentalTypeCode';
            NotBlank = true;
        }
        field(4; StartingDate; Date)
        {
            Caption = 'StartingDate';
            trigger OnValidate()
            var
                RentalPriceRec: Record "RentalPrice";
            begin
                if EndingDate <= StartingDate then
                    Error('Starting date must be smaller than ending date');

                // Preverjanje prekrivanja obdobij
                RentalPriceRec.SetRange(RentalTypeCode, Rec.RentalTypeCode);
                RentalPriceRec.SetRange("Code", ''); // reset
                RentalPriceRec.SetFilter("StartingDate", '<=%1', Rec.EndingDate);
                RentalPriceRec.SetFilter("EndingDate", '>=%1', Rec.StartingDate);

                if RentalPriceRec.FindFirst() and (RentalPriceRec."Code" <> Rec."Code") then
                    Error('Za izbrani tip izposoje že obstaja veljaven cenik v tem časovnem obdobju.');
            end;
        }
        field(5; EndingDate; Date)
        {
            Caption = 'EndingDate';
            trigger OnValidate()
            var
                RentalPriceRec: Record "RentalPrice";
            begin
                if EndingDate <= StartingDate then
                    Error('Ending date must be greater than starting date');

                // Preverjanje prekrivanja obdobij
                RentalPriceRec.SetRange(RentalTypeCode, Rec.RentalTypeCode);
                RentalPriceRec.SetFilter("StartingDate", '<=%1', Rec.EndingDate);
                RentalPriceRec.SetFilter("EndingDate", '>=%1', Rec.StartingDate);

                if RentalPriceRec.FindFirst() and (RentalPriceRec."Code" <> Rec."Code") then
                    Error('Za izbrani tip izposoje že obstaja veljaven cenik v tem časovnem obdobju.');
            end;
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
