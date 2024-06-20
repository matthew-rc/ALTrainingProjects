table 50101 "Service Log"
{
    DataClassification = CustomerContent;

    fields
    {
        field(10; "Line No."; Integer)
        {
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(20; "VIN"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "Vehicle"."VIN";
            trigger OnValidate()

            var
                Vehicle: Record Vehicle;
            begin
                if Vehicle.Get("VIN") then
                    "Customer No." := Vehicle."Customer No.";
            end;
        }
        field(30; "Date"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(40; "Customer No."; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(50; "Amount"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(60; "Fluids Checked"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(70; "Mileage"; Integer)
        {
            DataClassification = CustomerContent;
            trigger OnValidate()
            begin
                "Next Service Mileage" := "Mileage" + 3000;
            end;
        }
        field(80; "Next Service Mileage"; Integer)
        {
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "Line No.")
        {
            Clustered = true;
        }
        key(VINKey; "VIN")
        {
            SumIndexFields = "Amount";
        }
    }

    trigger OnInsert()
    begin
        "Date" := Today();
        "VIN" := GetFilter("VIN");
        VALIDATE("VIN", GetFilter("VIN"));
    end;
}
