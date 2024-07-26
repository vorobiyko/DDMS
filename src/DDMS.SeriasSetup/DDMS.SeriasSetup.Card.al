page 50110 "DDMS Serias Setup Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "DDMS Serias Setup";
    Caption = 'Serias Setup Card';
    
    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("Series Admin"; Rec."Series Admin"){}
                field("Series User"; Rec."Series User"){}
            }
        }
    }
    
    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;
                
                trigger OnAction()
                begin
                    
                end;
            }
        }
    }
    
    var
        myInt: Integer;
}