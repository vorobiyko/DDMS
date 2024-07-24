page 50104 "Development DB List View" 
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Development DB";
    Caption = 'Development DB List View';
    CardPageId = "Development DB Create";

    layout
    {
        area(Content)
        {
            repeater(ListDev)
            {
                field(Code; Rec.Code){}
                field(Description; Rec.Description){}
                field("Customer No."; Rec."Customer No."){}
                field("Customer Name"; Rec."Customer Name"){}
                field(Version; Rec.Version){}
                field(Path; Rec.Path){}
                field(Administrator; Rec.Administrator){}
            }
        }
    }
    actions{
        area(Processing){
            action("XML"){
                Promoted = true;
                PromotedCategory = Process;
                Image = CreateXMLFile;
                ApplicationArea = All;
                trigger OnAction()
                var XMLPort: XmlPort DevelopmentDBExport;
                begin
                    XMLPort.Run();
                end;
            }
        }
    }
    internal procedure SetFilterCustomer(var CustomerInfo: Code[20])
    begin
        Rec.SetFilter("Customer No.",'=%1', CustomerInfo);
    end;
}