table 50111 Bicycle
{
    Caption = 'Bicycle';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
        }
        field(2; "Rental Type Code"; Code[20])
        {
            Caption = 'Rental Type Code';
            NotBlank = true;
            // dropdown
            TableRelation = "Rental Type"."Code";
        }
        field(3; Description; Text[300])
        {
            Caption = 'Description';
            FieldClass = FlowField;
            CalcFormula = lookup("Rental Type".Description where(Code = field("Rental Type Code")));
        }
        field(4; Status; Enum "Bicycle Status")
        {
            Caption = 'Status';
            InitValue = Available;
        }
        field(5; "Purchase Date"; Date)
        {
            Caption = 'Purchase Date';
        }
        field(6; "Purchase Price"; Decimal)
        {
            Caption = 'Purchase Price';
            MinValue = 0;
        }
        field(7; "Current Location"; Text[150])
        {
            Caption = 'Current Location';
        }
        field(8; "Last Service Date"; Date)
        {
            Caption = 'Last Service Date';
        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
}
