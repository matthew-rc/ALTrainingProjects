page 50101 "Vehicle Card"
{
    PageType = Card;
    SourceTable = Vehicle;
    ApplicationArea = All;
    UsageCategory = Lists;
    DataCaptionExpression = 'Vehicle Identification Number: ' + Rec.VIN;
    layout
    {
        area(content)
        {
            group(Details)
            {
                field("VIN"; Rec."VIN")
                {
                    ApplicationArea = All;
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                }
                field("Description"; Rec."Description")
                {
                    ApplicationArea = All;
                }
                field("Transmission"; Rec."Transmission")
                {
                    ApplicationArea = All;
                }
                field("Total Service Visits"; Rec."Total Service Visits")
                {
                    Editable = false;
                    ApplicationArea = All;
                    DrillDown = true;
                    DrillDownPageId = "Service Log List";
                }
                field("Total Service Dollars"; Rec."Total Service Dollars")
                {
                    Editable = false;
                    ApplicationArea = All;
                    DrillDown = true;
                    DrillDownPageId = "Service Log List";
                }
            }
        }
    }
    actions
    {
        area(processing)
        {
            action(PrintServiceReport)
            {
                Caption = 'Print Service Report';
                ApplicationArea = All;
                Image = Print;
                ToolTip = 'Print the service report for this vehicle';
                trigger OnAction()
                var
                    ServiceReportRunner: Record "Vehicle";
                begin
                    ServiceReportRunner.Reset();
                    CurrPage.SetSelectionFilter(ServiceReportRunner);
                    Report.Run(Report::"Service Report", true, false, ServiceReportRunner);
                end;
            }
        }
    }

    // var
    //     IsDrillDownEnabled: Boolean;

    // procedure CheckIfFieldsFilled(): Boolean
    // begin
    //     IsDrillDownEnabled := false;
    //     if (Rec."VIN" <> '') and
    //        (Rec."Customer No." <> '') and
    //        (Rec."Description" <> '')
    //     then
    //         IsDrillDownEnabled := true;
    // end;
}
