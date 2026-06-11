namespace bcseminarskaekipa.bcseminarskaekipa;

xmlport 50110 BicycleImport
{
    Caption = 'BicycleImport';
    Direction = Import;
    Format = Xml;

    schema
    {
        textelement(RootNodeName)
        {
            tableelement(Bicycle; Bicycle)
            {
                fieldelement(Description; Bicycle.Description)
                {
                }
                fieldelement(No; Bicycle."No.")
                {
                }
                fieldelement(RentalTypeCode; Bicycle."Rental Type Code")
                {
                }
                trigger OnBeforeInsertRecord()
                var
                    RentalTypeRec: Record RentalType;
                begin
                    if not RentalTypeRec.Get(Bicycle."Rental Type Code") then begin
                        CurrXMLport.Skip();
                        exit;
                    end;
                end;
            }
        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(Processing)
            {
            }
        }
    }
}
