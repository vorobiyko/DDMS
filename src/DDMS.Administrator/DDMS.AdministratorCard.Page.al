page 50102 "Administrator List Create"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Development DB Admin";
    Caption = 'Administrator List Create';

    layout
    {
        area(Content)
        {
            group(CreateList)
            {
                field(ContactCode; Rec.ContactCode)
                {
                    NotBlank = true;
                }
                field(Rights; Rec.Rights)
                {
                    NotBlank = true;
                }
            }
        }
    }
    
    actions
    {
        area(Creation)
        {
            action("Check DBs Access"){
                Promoted = true;
                PromotedCategory = Process;
                Image = AbsenceCategories;
                ApplicationArea = All;

                trigger OnAction()
                var AdminDB: Page "Administrator List View";
                begin
                    AdminDB.Editable(false);
                    AdminDB.SetFilterAdminAccess(Rec.Rights);
                    AdminDB.Run();
                end;
            }
        }
    }
}