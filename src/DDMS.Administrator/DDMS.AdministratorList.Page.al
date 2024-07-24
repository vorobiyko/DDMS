page 50101 "Administrator List View"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Development DB Admin";
    CardPageId = "Administrator List Create";
    Caption = 'Administrator List View';
    
    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(Code; Rec.Code){}
                field(ContactCode; Rec.ContactCode){}
                field(DateCreated; Rec.DateCreated){}
                field(Rights; Rec.Rights){}
                field(UserID; Rec.UserIdentifier){}
            }
        }
        area(Factboxes)
        {
            
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
    internal procedure SetFilterAdminAccess(var AdminRight: Option)
    begin
        Rec.SetFilter(Rights, '=%1', AdminRight);
    end;
}