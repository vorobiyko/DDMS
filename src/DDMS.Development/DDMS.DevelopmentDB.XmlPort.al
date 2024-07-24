xmlport 50101 DevelopmentDBExport
{
   
    schema
    {
        textelement(NodeName1)
        {
            tableelement(NodeName2; "Development DB")
            {
                fieldattribute(Code; NodeName2.Code){}
                fieldattribute(CustomerNo; NodeName2."Customer No."){}
                fieldattribute(Description; NodeName2.Description){}
                fieldattribute(CustomerName; NodeName2."Customer Name")
                {
                    AutoCalcField = true;
                }
                fieldattribute(Version; NodeName2.Version){}
                fieldattribute(Path; NodeName2.Path){}
                fieldattribute(Administrator; NodeName2.Administrator){}
            }
        }
    }
    
    requestpage
    {
        // layout
        // {
        //     area(content)
        //     {
        //         group(GroupName)
        //         {
        //             field(Name; SourceExpression)
        //             {
                        
        //             }
        //         }
        //     }
        // }
    
        actions
        {
            area(processing)
            {
                action(ActionName)
                {
                    
                }
            }
        }
    }
}