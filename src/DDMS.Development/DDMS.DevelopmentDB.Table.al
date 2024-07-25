table 50102 "Development DB"
{
    DataClassification = CustomerContent;
    Caption = 'Development DB';

    fields
    {
        field(1;Code; Code[20])
        {
            Caption = 'Code';
        }
        field(2;Description; Text[100])
        {
            Caption = 'Description';
        }
        field(3;"Customer No."; Code[20])
        {
            TableRelation = Customer;
            Caption = 'Customer No.';
            NotBlank = true;
        }
        field(4;"Customer Name"; Text[100])
        {
            Caption = 'Customer Name';
            FieldClass = FlowField;
            Editable = false;
            CalcFormula = lookup(Customer.Name where("No." = field("Customer No.")));
        }
        field(5;"Version"; Option)
        {
            OptionMembers = "BC14","BC15","BC16","BC17";
            Caption = 'Version';
        }
        field(6; Path; Text[250])
        {
            Caption = 'Path';
        }
        field(7;Administrator; Code[20])
        {
            TableRelation = "Development DB Admin";
            Caption = 'Administrator';
        }
    }
    
    keys
    {
        key(PK; Code)
        {
            Clustered = true;
        }
    }    
    var SeriesCodeDB: Text;
    
    trigger OnInsert()
    var DevAdmin: Record "Development DB Admin";
    begin
        SeriesCodeDB:= 'DDMSDB';
        Rec.Code:= DevAdmin.InitNoSeriesCode(SeriesCodeDB);
    end;
}