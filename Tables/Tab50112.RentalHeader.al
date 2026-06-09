table 50112 "RentalHeader"
{
    Caption = 'Rental Header';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
        }
        field(2; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
            TableRelation = Customer."No.";

            trigger OnValidate()
            begin
                if "Customer No." = '' then
                    Error('Customer No. ne sme biti prazen');

                CheckMaxActiveRentals();
            end;
        }
        field(3; "Rental Date"; Date)
        {
            Caption = 'Rental Date';
        }
        field(4; "Expected Return Date"; Date)
        {
            Caption = 'Expected Return Date';
            trigger OnValidate()
            begin
                if "Expected Return Date" < "Rental Date" then
                    Error('Expected Return Date ne sme biti manjsi od Rental Date');
            end;
        }
        field(5; "Actual Return Date"; Date)
        {
            Caption = 'Actual Return Date';
        }
        field(6; Status; Enum "Rental Status")
        {
            Caption = 'Status';
        }
        field(7; "Total Amount"; Decimal)
        {
            Caption = 'Total Amount';
            FieldClass = FlowField;
            CalcFormula = Sum("RentalLine"."Line Amount"
                    WHERE("Rental No." = FIELD("No.")));
            Editable = false;
        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
    local procedure CheckMaxActiveRentals()
    var
        CustomerRec: Record Customer;
        RentalHeaderRec: Record RentalHeader;
        ActiveRentals: Integer;
    begin
        if not CustomerRec.Get("Customer No.") then
            Error('Customer does not exist.');

        // 0 pomeni brez omejitve
        if CustomerRec."Max Active Rentals" = 0 then
            exit;

        RentalHeaderRec.Reset();
        RentalHeaderRec.SetRange("Customer No.", "Customer No.");
        RentalHeaderRec.SetRange(Status, Status::Active);

        ActiveRentals := RentalHeaderRec.Count();

        if ActiveRentals >= CustomerRec."Max Active Rentals" then
            Error(
                'Stranka je že dosegla maksimalno dovoljeno število aktivnih izposoj (%1).',
                CustomerRec."Max Active Rentals");
    end;
}
