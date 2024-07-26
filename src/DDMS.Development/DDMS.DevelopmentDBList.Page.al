page 50104 "DDMS Dev DB List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "DDMS Dev DB";
    Caption = 'DDMS Dev DB List';
    CardPageId = "DDMS Dev DB Card";
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(ListDev)
            {
                field(Code; Rec.Code) { }
                field(Description; Rec.Description) { }
                field("Customer No."; Rec."Customer No.") { }
                field("Customer Name"; Rec."Customer Name") { }
                field(Version; Rec.Version) { }
                field(Path; Rec.Path) { }
                field(Administrator; Rec.Administrator) { }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("XML")
            {
                Promoted = true;
                PromotedCategory = Process;
                Image = CreateXMLFile;
                ApplicationArea = All;
                trigger OnAction()
                var
                    XMLPort: XmlPort "DDMS Dev DB Export";
                begin
                    XMLPort.Run();
                end;
            }
        }
    }
    internal procedure SetFilterCustomer(var CustomerInfo: Code[20])
    begin
        Rec.SetFilter("Customer No.", CustomerInfo);
    end;
}