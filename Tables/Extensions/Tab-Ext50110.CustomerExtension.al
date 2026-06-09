namespace bcseminarskaekipa.bcseminarskaekipa;

using Microsoft.Sales.Customer;

tableextension 50110 CustomerExtension extends Customer
{
    fields
    {
        field(50110; "Preferred Rental Type"; Code[20])
        {
            Caption = 'Preferred Rental Type';
            DataClassification = CustomerContent;

            TableRelation = RentalType.Code;
        }

        field(50111; "VIP Customer"; Boolean)
        {
            Caption = 'VIP Customer';
            DataClassification = CustomerContent;
        }

        field(50112; "Max Active Rentals"; Integer)
        {
            Caption = 'Max Active Rentals';
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                if "Max Active Rentals" < 0 then
                    Error('Max Active Rentals mora biti večji ali enak 0.');
            end;
        }
    }
}