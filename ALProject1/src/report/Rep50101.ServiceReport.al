report 50101 "Service Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'src/report/ServiceReport.rdl';
    ApplicationArea = Basic, Suite;
    Caption = 'Service Report';
    PreviewMode = PrintLayout;
    UsageCategory = ReportsAndAnalysis;

    dataset
    {
        dataitem(Vehicle; "Vehicle")
        {
            DataItemTableView = sorting("VIN");
            RequestFilterFields = "Customer No.", VIN;

            column("VIN"; "VIN")
            {
            }
            column("CustomerNo"; "Customer No.")
            {
            }
            column("Description"; "Description")
            {
            }
            column("Transmission"; "Transmission")
            {
            }
            column("TotalServiceVisits"; "Total Service Visits")
            {
            }
            column("TotalServiceDollars"; "Total Service Dollars")
            {
            }
            column(COMPANYNAME; COMPANYPROPERTY.DisplayName())
            {
            }
            column("ReportCaption"; ReportCaptionLbl)
            {
            }
            dataitem("Service Log"; "Service Log")
            {
                DataItemTableView = sorting("Date");
                DataItemLink = "VIN" = field("VIN");

                column("Date"; "Date")
                {
                }
                column("Amount"; "Amount")
                {
                }
                column("Fluids"; "Fluids Checked")
                {
                }
                column("Mileage"; "Mileage")
                {
                }
                column("LineNo"; "Line No.")
                {
                }
                trigger OnAfterGetRecord()
                begin
                    if not ShowService then
                        CurrReport.Skip();
                end;
            }
            // trigger OnAfterGetRecord()
            // begin
            //     if CustomerFilter <> '' then
            //         if "Customer No." <> CustomerFilter then
            //             CurrReport.Skip();
            // end;
        }
    }

    requestpage
    {
        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field(ShowService; ShowService)
                    {
                        ApplicationArea = All;
                        Caption = 'Include Service Log';
                        ToolTip = 'Include details of the service log entries.';
                    }
                    // field(CustomerFilter; CustomerFilter)
                    // {
                    //     ApplicationArea = All;
                    //     Caption = 'Customer No.';
                    //     ToolTip = 'Filter the report by customer number.';
                    //     TableRelation = Customer."No.";
                    // }
                }
            }
        }
    }

    var
        ReportCaptionLbl: Label 'Service Report';
        ShowService: Boolean;
    // CustomerFilter: Code[20];
    // VINFilter: Code[20];
    // PassedVIN: Code[20];
}
