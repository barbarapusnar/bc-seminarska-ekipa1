namespace bcseminarskaekipa.bcseminarskaekipa;

using Microsoft.Sales.Customer;
tableextension 50110 CustomerExtension extends Customer
{
    fields
    {
        field(50100; "Preferred Rental Type"; Code[20])
        {
            Caption = 'Preferred Rental Type';
            TableRelation = RentalType.Code;
        }

        field(50101; "VIP Customer"; Boolean)
        {
            Caption = 'VIP Customer';
        }

        field(50102; "Max Active Rentals"; Integer)
        {
            Caption = 'Max Active Rentals';

            trigger OnValidate()
            begin
                if "Max Active Rentals" < 0 then
                    Error('Max Active Rentals must be greater than or equal to 0.');
            end;
        }
    }
}