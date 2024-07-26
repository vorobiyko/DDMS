page 50105 "DDMS Dev DB Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "DDMS Dev DB";
    Caption = 'DDMS Dev DB Card';

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
                field(Description; Rec.Description) { }
                field("Customer No."; Rec."Customer No.") { }
                field("Customer Name"; Rec."Customer Name")
                {
                    Editable = false;
                }
                field(Version; Rec.Version) { }
                field(Path; Rec.Path) { }
                field(Administrator; Rec.Administrator) { }
            }
        }
    }
}