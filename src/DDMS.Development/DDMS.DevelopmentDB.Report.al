report 50101 "DDMS Dev DB Stats"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = "Dev DB Layout";
    Caption = 'DDMS Dev DB Stats';

    dataset
    {
        dataitem("DDMS Dev DB"; "DDMS Dev DB")
        {
            column(User; UserID) { }
            column(Date; Today) { }
            column(Code; Code) { }
            column(Description; Description) { }
            column(Version; Version) { }
            column(Path; Path) { }
            column(CustomerName; "Customer Name")
            {
                AutoCalcField = true;
            }
            trigger OnPreDataItem()
            begin
                "DDMS Dev DB".SetCurrentKey("Customer No.");
            end;
        }
    }

    rendering
    {
        layout("Dev DB Layout")
        {
            Type = RDLC;
            LayoutFile = './mySpreadsheet.rdl';
            Caption = 'RDLCLayout';
            Summary = 'RDLC Layout';
        }
    }
}