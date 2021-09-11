/// <summary>
/// Page LBC Bonus Setup (ID 50100).
/// </summary>
page 50100 "LBC Bonus Setup"
{
    Caption = 'Bonus Setup';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "LBCBonus Setup";
    DeleteAllowed = false;
    InsertAllowed = false;

    layout
    {
        area(Content)
        {
            group(Numbering)
            {
                Caption = 'Numbering';
                field("Bounus Nos."; Rec."Bonus Nos.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies number series';
                }

            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.Reset();
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;
    end;
}
