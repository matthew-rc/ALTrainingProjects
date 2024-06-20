report 50100 "Vehicle Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'src/report/VehicleReport.rdl';
    ApplicationArea = Basic, Suite;
    Caption = 'Vehicle Report';
    PreviewMode = PrintLayout;
    UsageCategory = ReportsAndAnalysis;

    dataset
    {
        dataitem(Vehicle; Vehicle)
        {
            DataItemTableView = sorting("VIN");

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
        }

    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    var
        ReportCaptionLbl: Label 'Vehicle Report';
}
