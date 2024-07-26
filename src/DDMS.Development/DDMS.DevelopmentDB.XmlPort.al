xmlport 50101 "DDMS Dev DB Export"
{
    schema
    {
        textelement(NodeName1)
        {
            tableelement(NodeName2; "DDMS Dev DB")
            {
                fieldattribute(Code; NodeName2.Code) { }
                fieldattribute(CustomerNo; NodeName2."Customer No.") { }
                fieldattribute(Description; NodeName2.Description) { }
                fieldattribute(CustomerName; NodeName2."Customer Name")
                {
                    AutoCalcField = true;
                }
                fieldattribute(Version; NodeName2.Version) { }
                fieldattribute(Path; NodeName2.Path) { }
                fieldattribute(Administrator; NodeName2.Administrator) { }
            }
        }
    }
}