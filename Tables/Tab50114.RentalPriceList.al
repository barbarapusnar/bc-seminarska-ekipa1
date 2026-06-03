table 50114 "RentalPriceList"
{
    Caption = 'Rental Price List';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Code; Code[20])
        {
            Caption = 'Code';
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                if Code = '' then
                    Error('Code ne sme biti prazen.');
            end;
        }

        field(2; Description; Text[100])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }

        field(3; RentalTypeCode; Code[20])
        {
            Caption = 'Rental Type Code';
            DataClassification = CustomerContent;
            TableRelation = RentalType.Code;

            trigger OnValidate()
            begin
                if RentalTypeCode = '' then
                    Error('Rental Type Code ne sme biti prazen.');
            end;
        }

        field(4; StartingDate; Date)
        {
            Caption = 'Starting Date';

            trigger OnValidate()
            begin
                if (EndingDate <> 0D) and (StartingDate > EndingDate) then
                    Error('Starting Date mora biti manjši ali enak Ending Date.');
            end;
        }

        field(5; EndingDate; Date)
        {
            Caption = 'Ending Date';

            trigger OnValidate()
            begin
                if (StartingDate <> 0D) and (StartingDate > EndingDate) then
                    Error('Starting Date mora biti manjši ali enak Ending Date.');
            end;
        }

        field(6; DailyRate; Decimal)
        {
            Caption = 'Daily Rate';

            trigger OnValidate()
            begin
                if DailyRate < 0 then
                    Error('Daily Rate ne sme biti negativen.');
            end;
        }
    }

    keys
    {
        key(PK; Code)
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    begin
        CheckOverlap();
    end;

    trigger OnModify()
    begin
        CheckOverlap();
    end;

    local procedure CheckOverlap()
    var
        RecCheck: Record RentalPriceList;
    begin
        if (RentalTypeCode = '') or (StartingDate = 0D) or (EndingDate = 0D) then
            exit;

        RecCheck.Reset();
        RecCheck.SetRange(RentalTypeCode, RentalTypeCode);

        if RecCheck.FindSet() then
            repeat
                if (RecCheck.Code <> Code) and
                   (StartingDate <= RecCheck.EndingDate) and
                   (EndingDate >= RecCheck.StartingDate) then
                    Error('Za izbrani tip kolesa že obstaja veljaven cenik v tem časovnem obdobju.');
            until RecCheck.Next() = 0;
    end;
}