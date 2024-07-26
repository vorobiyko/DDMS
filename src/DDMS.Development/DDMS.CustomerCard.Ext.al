pageextension 50101 "DDMS Customer Card" extends "Customer Card"
{
    actions
    {
        addfirst(processing)
        {
            action("Open DBs")
            {
                Promoted = true;
                PromotedCategory = Process;
                Image = TestDatabase;
                ApplicationArea = All;

                trigger OnAction()
                var
                    DevelopmentDB: Page "DDMS Dev DB List";
                begin
                    DevelopmentDB.Editable(false);
                    DevelopmentDB.SetFilterCustomer(Rec."No.");
                    DevelopmentDB.Run();
                end;
            }
        }
    }
}