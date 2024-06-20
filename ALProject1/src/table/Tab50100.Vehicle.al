table 50100 "Vehicle"
{
    DataClassification = CustomerContent;
    LookupPageID = "Vehicle List";

    fields
    {
        field(10; "VIN"; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(20; "Customer No."; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = Customer."No." where(Blocked = filter(0));
        }
        field(30; "Description"; Text[30])
        {
            DataClassification = CustomerContent;
        }
        field(40; "Transmission"; Option)
        {
            DataClassification = CustomerContent;
            OptionMembers = Automatic,"4-Speed","5-Speed",Other;
        }
        field(50; "Total Service Visits"; Integer)
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = count("Service Log" where("VIN" = field("VIN")));

        }
        field(60; "Total Service Dollars"; Decimal)
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = sum("Service Log"."Amount" where("VIN" = field("VIN")));
        }
    }

    keys
    {
        key(PK; "VIN")
        {
            Clustered = true;
        }
    }
}
