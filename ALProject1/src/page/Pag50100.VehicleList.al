page 50100 "Vehicle List"
{
    PageType = List;
    SourceTable = Vehicle;
    ApplicationArea = All;
    UsageCategory = Lists;
    CardPageId = "Vehicle Card";

    layout
    {
        area(content)
        {
            repeater(Group)
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
                //drilldown
                field("Total Service Visits"; Rec."Total Service Visits")
                {
                    ApplicationArea = All;
                    DrillDown = true;
                    DrillDownPageId = "Service Log List";
                }
                field("Total Service Dollars"; Rec."Total Service Dollars")
                {
                    ApplicationArea = All;
                    DrillDown = true;
                    DrillDownPageId = "Service Log List";
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Log Service")
            {
                RunObject = page "Service Log List";
                RunPageLink = VIN = field(VIN);
                ApplicationArea = All;
                Caption = 'Log Service';
                Image = EditJournal;
                ToolTip = 'Log service for the selected vehicle';
            }
            action(PrintServiceReport)
            {
                Caption = 'Print Service Report';
                ApplicationArea = All;
                Image = Print;
                // RunObject = Report "Service Report";
                // trigger OnAction()
                // begin
                //     Report.Run(Report::"Service Report", true, false, Rec);
                // end;
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
}
