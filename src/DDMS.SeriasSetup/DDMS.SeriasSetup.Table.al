table 50110 "DDMS Serias Setup"
{
    DataClassification = ToBeClassified;
    Caption = 'Serias SetUp Table';

    
    fields
    {
        field(1; "Prived Key"; Integer){}
        field(2;"Series Admin"; Code[20])
        {
            Caption = 'Dev DB Admin Code'; 
            TableRelation = "No. Series";
            NotBlank = true;
        }
        field(3;"Series User"; Code[20])
        {
            Caption = 'Dev DB Code';
            TableRelation = "No. Series";
            NotBlank = true;   
        }
    }
    
    keys
    {
        key(PK; "Prived Key")
        {
            Clustered = true;
        }
    }
    
    fieldgroups
    {
        // Add changes to field groups here
    }
    
    var
        myInt: Integer;
    
    trigger OnInsert()
    begin
        
    end;
    
    trigger OnModify()
    begin
        
    end;
    
    trigger OnDelete()
    begin
        
    end;
    
    trigger OnRename()
    begin
        
    end;
    
}