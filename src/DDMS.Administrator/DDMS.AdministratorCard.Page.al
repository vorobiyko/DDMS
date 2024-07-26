page 50102 "DDMS Dev DB Admin Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "DDMS Dev DB Admin";
    Caption = 'Administrator List Create';

    layout
    {
        area(Content)
        {
            group(CreateList)
            {
                field("Contact Code"; Rec."Contact Code")
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
            action("Check DBs Access")
            {
                Promoted = true;
                PromotedCategory = Process;
                Image = AbsenceCategories;
                ApplicationArea = All;

                trigger OnAction()
                var
                    AdminDB: Page "DDMS Dev DB Admin List";
                begin
                    AdminDB.Editable(false);
                    AdminDB.SetFilterAdminAccess(Rec.Rights);
                    AdminDB.Run();
                end;
            }
        }
    }
}