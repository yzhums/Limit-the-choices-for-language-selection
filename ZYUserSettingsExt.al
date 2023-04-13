pageextension 50114 MyExtension extends "User Settings"
{
    layout
    {
        modify(LanguageName)
        {
            Visible = false;
        }
        addafter(Region)
        {
            field(ZYLanguageID; ZYLanguageID)
            {
                Caption = 'ZY Language ID';
                ApplicationArea = All;
                TableRelation = "Windows Language"."Language ID" where("Language ID" = filter(2052 | 1033));

                trigger OnValidate()
                begin
                    Rec."Language ID" := ZYLanguageID;
                end;
            }
        }
    }

    var
        ZYLanguageID: Integer;

    trigger OnOpenPage()
    begin
        ZYLanguageID := GlobalLanguage;
    end;
}
