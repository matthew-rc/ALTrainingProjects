table 50102 Sponsors
{
    Caption = 'Sponsors';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Sponsor No."; Code[20])
        {
            Caption = 'Sponsor No.';
        }
        field(2; Name; Text[50])
        {
            Caption = 'Name';
        }
        field(3; "Address 1"; Text[100])
        {
            Caption = 'Address 1';
        }
        field(4; "Address 2"; Text[100])
        {
            Caption = 'Address 2';
        }
        field(5; Active; Boolean)
        {
            Caption = 'Active';
        }
        field(6; "Join Date"; Date)
        {
            Caption = 'Join Date';
        }
        field(7; "Sponsorship Level"; Option)
        {
            Caption = 'Sponsorship Level';
            OptionMembers = Automatic,"4-Speed","5-Speed",Other;
        }
        field(8; "Sponsorship Team"; Code[20])
        {
            Caption = 'Sponsorship Team';
        }
        field(9; "Marital Status"; Option)
        {
            Caption = 'Marital Status';
            OptionMembers = Automatic,"4-Speed","5-Speed",Other;
        }
        field(10; Children; Integer)
        {
            Caption = 'Children';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "Sponsor No.")
        {
            Clustered = true;
        }
    }
}
