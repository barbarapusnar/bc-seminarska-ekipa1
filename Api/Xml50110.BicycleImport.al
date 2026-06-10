namespace bcseminarskaekipa.bcseminarskaekipa;

xmlport 50110 BicycleImport
{
    Caption = 'Bicycle Import';
    Direction = Import;
    Format = Xml;

    schema
    {
        textelement(Root)
        {
            tableelement(Bicycle; Bicycle)
            {
                AutoSave = true;

                fieldelement(No; Bicycle."No.") { }
                fieldelement(RentalTypeCode; Bicycle."Rental Type Code") { }
                fieldelement(Description; Bicycle.Description) { }

                trigger OnBeforeInsertRecord()
                var
                    RentalType: Record RentalType;
                begin
                    // preveri ali Rental Type obstaja
                    if not RentalType.Get(Bicycle."Rental Type Code") then begin
                        CurrXMLport.Skip(); // preskoči napačen zapis
                    end;
                end;
            }
        }
    }
}