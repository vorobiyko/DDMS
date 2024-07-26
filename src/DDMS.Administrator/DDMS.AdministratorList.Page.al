page 50101 "DDMS Dev DB Admin List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "DDMS Dev DB Admin";
    CardPageId = "DDMS Dev DB Admin Card";
    Caption = 'DDMS Dev DB Admin List';
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(Code; Rec.Code) { }
                field("Contact Code"; Rec."Contact Code") { }
                field("Date Created"; Rec."Date Created") { }
                field(Rights; Rec.Rights) { }
                field(UserID; Rec."User Identifier") { }
            }
        }
    }
    internal procedure SetFilterAdminAccess(var AdminRight: Enum "DDMS Dev DB Admin Rights")
    begin
        Rec.SetRange(Rights, AdminRight);
    end;
}