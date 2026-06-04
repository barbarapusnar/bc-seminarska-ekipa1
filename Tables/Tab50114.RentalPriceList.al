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
            TableRelation = "RentalType".Code;
        }
        field(4; StartingDate; Date)
        {
            Caption = 'StartingDate';
            trigger OnValidate()
            begin
                if (EndingDate <> 0D) and (StartingDate > EndingDate) then
                    Error('Starting Date must be less than or equal to Ending Date.');
            end;
        }
        field(5; EndingDate; Date)
        {
            Caption = 'EndingDate';
            trigger OnValidate()
            begin
                if (StartingDate <> 0D) and (EndingDate < StartingDate) then
                    Error('Ending Date must be greater than or equal to Starting Date.');
            end;
        }
        field(6; DailyRate; Decimal)
        {
            Caption = 'DailyRate';
            trigger OnValidate()
            begin
                if DailyRate < 0 then
                    Error('Daily Rate cannot be negative.');
            end;
        }

    }
    keys
    {
        key(PK; "Code")
        {
            Clustered = true;
        }
        key(Key2; RentalTypeCode, StartingDate, EndingDate)
        {
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
        Existing: Record RentalPriceList;
    begin
        Existing.SetRange(RentalTypeCode, RentalTypeCode);
        Existing.SetFilter(Code, '<>%1', Code);

        if Existing.FindSet() then
            repeat
                if (StartingDate <= Existing.EndingDate) and
                   (EndingDate >= Existing.StartingDate) then
                    Error('For this Rental Type there is already a price list defined for the selected period.');
            until Existing.Next() = 0;
    end;

    procedure FindPrice(RentalType: Code[20]; WorkDate: Date): Decimal
    var
        PriceList: Record RentalPriceList;
    begin
        PriceList.SetRange(RentalTypeCode, RentalType);
        PriceList.SetFilter(StartingDate, '<=%1', WorkDate);
        PriceList.SetFilter(EndingDate, '>=%1', WorkDate);

        if PriceList.FindLast() then
            exit(PriceList.DailyRate);

        exit(0);
    end;
}
