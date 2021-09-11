#pragma implicitwith disable
/// <summary>
/// Page LBC Bonus List (ID 50101).
/// </summary>
page 50101 "LBC Bonus List"
{
    Caption = 'Bonuses';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "LBC Bonus Header";
    Editable = false;
    CardPageId = "LBC Bonus Card";
    layout
    {
        area(Content)
        {
            repeater(Control1)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the bonus nunber.';
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the customer number';
                }

                field("Starting Date"; Rec."Starting Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the starting date';
                }
                field("Ending Date"; Rec."Ending Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the ending date';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the bonus status';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(tmpTable)
            {
                ApplicationArea = All;
                Caption = 'test tmp table copy';
                Image = Action;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;
                ToolTip = 'test record copy';
                trigger OnAction()
                var
                    GLEntries: Record "G/L Entry";
                    tpmGLEntry: Record "G/L Entry" temporary;
                    stopwatch: DateTime;
                begin
                    GLEntries.FindSet();
                    stopwatch := system.CurrentDateTime;
                    repeat
                        tpmGLEntry.Copy(GLEntries);
                        tpmGLEntry.Insert();
                    until GLEntries.Next() = 0;
                    message('time took %1', System.CurrentDateTime - stopwatch);
                    message('record in tmp table are: %1', tpmGLEntry.Count)
                end;
            }
        }
        area(Navigation)
        {
            action(CustomerCard)
            {
                ApplicationArea = All;
                Caption = 'Custommer Card';
                Image = Customer;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;
                RunObject = page "Customer Card";
                RunPageLink = "No." = field("Customer No.");
                ToolTip = 'Open customer card.';
            }
        }
    }
}
#pragma implicitwith restore
