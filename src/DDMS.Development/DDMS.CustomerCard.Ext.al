pageextension 50101 DevDBViewExt extends "Customer Card"
{
    actions
    {
        addfirst(processing){
            action("Open DBs"){
                Promoted = true;
                PromotedCategory = Process;
                Image = TestDatabase;
                ApplicationArea = All;

                trigger OnAction()
                var DevelopmentDB: Page "Development DB List View";
                begin
                    DevelopmentDB.Editable(false);
                    DevelopmentDB.SetFilterCustomer(Rec."No.");
                    DevelopmentDB.Run();
                end;
            }
        }
    }
}