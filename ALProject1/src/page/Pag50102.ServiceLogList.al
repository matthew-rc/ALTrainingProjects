page 50102 "Service Log List"
{
    PageType = List;
    SourceTable = "Service Log";
    ApplicationArea = All;
    UsageCategory = Lists;
    AutoSplitKey = true;

    layout

    {
        area(content)
        {
            repeater(Group)
            {
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = All;
                }
                field("VIN"; Rec."VIN")
                {
                    ApplicationArea = All;
                }
                field("Date"; Rec."Date")
                {
                    ApplicationArea = All;
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                }
                field("Amount"; Rec."Amount")
                {
                    ApplicationArea = All;
                }
                field("Fluids Checked"; Rec."Fluids Checked")
                {
                    ApplicationArea = All;
                }
                field("Mileage"; Rec."Mileage")
                {
                    ApplicationArea = All;
                }
                field("Next Service Mileage"; Rec."Next Service Mileage")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
