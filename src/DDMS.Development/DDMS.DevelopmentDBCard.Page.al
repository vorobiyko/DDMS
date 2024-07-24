page 50105 "Development DB Create"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Development DB";
    Caption = 'Development DB Card Create';
    
    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(Code; Rec.Code)
                {
                    Editable = false;
                }
                field(Description; Rec.Description){}
                field("Customer No."; Rec."Customer No."){}
                field("Customer Name"; Rec."Customer Name"){
                    Editable = false;
                }
                field(Version; Rec.Version){}
                field(Path; Rec.Path){}
                field(Administrator; Rec.Administrator){}
            }
        }
    }
}