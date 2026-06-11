namespace bcseminarskaekipa.bcseminarskaekipa;

page 50112 BicycleList
{
    ApplicationArea = All;
    Caption = 'Bicycle List';
    PageType = List;
    SourceTable = Bicycle;
    UsageCategory = Lists;
    CardPageId = BicycleCard;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.', Comment = '%';
                }
                field("Rental Type Code"; Rec."Rental Type Code")
                {
                    ToolTip = 'Specifies the value of the Rental Type Code field.', Comment = '%';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                }
                field("Current Location"; Rec."Current Location")
                {
                    ToolTip = 'Specifies the value of the Current Location field.', Comment = '%';
                }
                field("Last Service Date"; Rec."Last Service Date")
                {
                    ToolTip = 'Specifies the value of the Last Service Date field.', Comment = '%';
                }
                field("Purchase Date"; Rec."Purchase Date")
                {
                    ToolTip = 'Specifies the value of the Purchase Date field.', Comment = '%';
                }
                field("Purchase Price"; Rec."Purchase Price")
                {
                    ToolTip = 'Specifies the value of the Purchase Price field.', Comment = '%';
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.', Comment = '%';
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(ImportBicycles)
            {
                ApplicationArea = All;
                Caption = 'Import Bicycles';
                Image = Import;

                trigger OnAction()
                var
                    InS: InStream;
                    FileName: Text;
                begin
                    if UploadIntoStream('Izberi XML datoteko', '', 'XML Files (*.xml)|*.xml', FileName, InS) then begin
                        XmlPort.Import(50110, InS);
                    end;
                end;
            }
        }
    }
}
