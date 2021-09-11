table 50100 "LBCBonus Setup"
{
    DataClassification = CustomerContent;
    Caption = 'Bonus Setup';

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Primary Key';
        }
        field(2; "Bonus Nos."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Bonus No.';
            TableRelation = "No. Series";
        }
    }
    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }
}