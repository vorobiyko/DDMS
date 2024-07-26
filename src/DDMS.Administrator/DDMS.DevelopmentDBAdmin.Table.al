table 50101 "DDMS Dev DB Admin"
{
    DataClassification = CustomerContent;
    Caption = 'DDMS Dev DB Admin';
    DrillDownPageId = "DDMS Dev DB Admin List";
    LookupPageId = "DDMS Dev DB Admin List";

    fields
    {
        field(1; Code; Code[20])
        {
            Caption = 'Code';
            NotBlank = true;
        }
        field(2; "Contact Code"; Code[20])
        {
            Caption = 'Contact Code';
            TableRelation = Contact;
            NotBlank = true;
        }
        field(3; "Date Created"; Date)
        {
            Caption = 'Date Created';
            NotBlank = true;
        }
        field(4; Rights; Enum "DDMS Dev DB Admin Rights")
        {
            Caption = 'Rights';
            NotBlank = true;
        }
        field(5; "User Identifier"; Code[50])
        {
            Caption = 'User Id';
            DataClassification = EndUserIdentifiableInformation;
            TableRelation = User."User Name";
            ValidateTableRelation = false;
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
    fieldgroups
    {
        fieldgroup(DropDown; Code, "Contact Code", Rights) { }
    }
    var
        TodayDate: Date;
        SeriesCodeAdmin: Text;
        LabelErr: Label 'Your Series not initialization';


    trigger OnInsert()
    var
        UserSeriesCode: Record "DDMS Serias Setup";
        UserSeriesCodeCard: Page "DDMS Serias Setup Card";
    begin
         if not UserSeriesCode.FindFirst() then begin
            UserSeriesCodeCard.Run();
            Error(LabelErr);
        end; 
        SeriesCodeAdmin := UserSeriesCode."Series Admin";
        Rec."Date Created" := Today;
        Rec."User Identifier" := UserId;
        Rec.Code := InitNoSeriesCode(SeriesCodeAdmin);
    end;

    internal procedure InitNoSeriesCode(var SeriesCode: Text): Code[20]
    var
        NoSeries: Codeunit "No. Series";
    begin
        exit(NoSeries.GetNextNo(SeriesCode, TodayDate));
    end;
}