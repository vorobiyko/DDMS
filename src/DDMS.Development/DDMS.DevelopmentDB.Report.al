report 50101 "Development DB List Statistics"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = DevDBLayout;
    Caption = 'Development DB List Statistics';
    
    dataset
    {
        dataitem("Development DB"; "Development DB")
        {
            column(User; UserID){}
            column(Date; Today){}
            column(Code; Code){}
            column(Description; Description){}
            column(Version; Version){}
            column(Path; Path){}
            column(CustomerName; "Customer Name")
            {
                AutoCalcField = true;
            }
            trigger OnPreDataItem()
            begin
                "Development DB".SetCurrentKey("Customer No.");
            end;
        }
    }
    
     rendering
    {
        layout(DevDBLayout)
        {
            Type = RDLC;
            LayoutFile = './mySpreadsheet.rdl';
            Caption = 'RDLCLayout';
            Summary = 'RDLC Layout';
        }
    }
}