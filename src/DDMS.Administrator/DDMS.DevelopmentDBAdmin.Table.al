table 50101 "Development DB Admin"
{
    DataClassification = CustomerContent;
    Caption = 'Development DB Admin';
    DrillDownPageId = "Administrator List View";
    LookupPageId = "Administrator List View";
    
    fields
    {
        field(1;Code; Code[20]){
            Caption = 'Code';
        }
        field(2;ContactCode; Code[20]){
            Caption = 'Contact Code';
            TableRelation = Contact;
        }
        field(3;DateCreated; Date){
            Caption = 'Date Created';
        }
        field(4;Rights; Option){
            Caption = 'Rights';
            OptionMembers = "System Admin","Data Admin","Rights Admin";
        }
        field(5;UserIdentifier; Code[50]){
            Caption = 'User Id';
        }
        
    }
    
    keys
    {
        key(PK; Code)
        {
            Clustered = true;
        }
    }
    fieldgroups{
         fieldgroup(DropDown; Code, Rights){}
    }
    var
        TodayDate: Date;
        SeriesCodeAdmin: Text;
    trigger OnInsert()
    begin
        AddDateInserted();
        Rec.UserIdentifier:= UserId;
        SeriesCodeAdmin:= 'DDMS';
        Rec.Code:= InitNoSeriesCode(SeriesCodeAdmin);
    end;
    local procedure AddDateInserted()
    begin
        TodayDate:= System.Today();
        Rec.DateCreated:= TodayDate;
    end;
    internal procedure InitNoSeriesCode(var SeriesCode: Text):Code[20]
    var NoSeries: Codeunit "No. Series";
    begin
        exit(NoSeries.GetNextNo(SeriesCode, TodayDate));
    end;
}