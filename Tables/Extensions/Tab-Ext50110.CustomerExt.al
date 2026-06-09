namespace bcseminarskaekipa.bcseminarskaekipa;

using Microsoft.Sales.Customer;

tableextension 50110 CustomerExt extends Customer
{
    fields
    {
        field(50110; "Preferred Rental Type"; Code[20])
        {
            Caption = 'Preferred Rental Type';
            TableRelation = RentalType.Code;
        }
        field(50111; "VIP Customer"; Boolean)
        {
            Caption = 'VIP Customer';
        }
        field(50112; "Max Active Rentals"; Integer)
        {
            Caption = 'Max Active Rentals';
            MinValue = 0;
        }
    }
}
