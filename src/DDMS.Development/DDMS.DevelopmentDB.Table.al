table 50102 "DDMS Dev DB"
{
    DataClassification = CustomerContent;
    Caption = 'DDMS Dev DB';

    fields
    {
        field(1; Code; Code[20])
        {
            Caption = 'Code';
        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';
            NotBlank = true;
        }
        field(3; "Customer No."; Code[20])
        {
            TableRelation = Customer;
            Caption = 'Customer No.';
            NotBlank = true;
        }
        field(4; "Customer Name"; Text[100])
        {
            Caption = 'Customer Name';
            FieldClass = FlowField;
            Editable = false;
            CalcFormula = lookup(Customer.Name where("No." = field("Customer No.")));
        }
        field(5; "Version"; Enum "DDMS Dev DB Version")
        {
            Caption = 'Version';
            NotBlank = true;
        }
        field(6; Path; Text[250])
        {
            Caption = 'Path';
            NotBlank = true;
        }
        field(7; Administrator; Code[20])
        {
            TableRelation = "DDMS Dev DB Admin";
            Caption = 'Administrator';
            NotBlank = true;
        }
    }

    keys
    {
        key(PK; Code)
        {
            Clustered = true;
        }
    }
    var
        SeriesCodeDB: Text;
        LabelErr: Label 'Your Series not initialization';

    trigger OnInsert()
    var
        DevAdmin: Record "DDMS Dev DB Admin";
        UserSeriesCode: Record "DDMS Serias Setup";
        UserSeriesCodeCard: Page "DDMS Serias Setup Card";
    begin
        if not UserSeriesCode.FindFirst() then begin
            UserSeriesCodeCard.Run();
            Error(LabelErr);
        end;
        SeriesCodeDB := UserSeriesCode."Series User";
        Rec.Code := DevAdmin.InitNoSeriesCode(SeriesCodeDB);
    end;
}