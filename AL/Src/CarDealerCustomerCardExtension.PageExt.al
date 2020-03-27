pageextension 70121 "CarDealerCustomerCardExtension" extends "Customer Card"
{
    layout
    {
        addbefore("Address & Contact")
        {
            group(Cardealer)
            {
                field(CD_UserName; CD_UserName)
                {
                    ApplicationArea = All;
                    Editable = _enableCDM;
                }
                field(CD_MemberID; CD_MemberID)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(CD_Membership; CD_Membership)
                {
                    ApplicationArea = All;
                    Editable = _enableCDM;
                }
            }
        }
    }
    actions
    {
        // Add changes to page actions here
        addlast("F&unctions")
        {
            action("Membership")
            {
                Image = AbsenceCategory;
                trigger OnAction()
                begin
                    if ISNULLGUID(Rec.CD_MemberID) then begin
                        Rec.CD_MemberID := CreateGuid();
                        Rec.CD_Membership := Rec.CD_Membership::base;
                        Rec.Modify(false);
                    end;
                end;
            }
        }
    }
    var
        _enableCDM: Boolean;

    trigger OnAfterGetCurrRecord()
    begin
        _enableCDM := NOT (IsNullGuid(rec.CD_MemberID));
    end;

    trigger OnAfterGetRecord()
    var
        Cars: Record Cars;
        myNotification: Notification;
    begin
        Cars.Reset();
        Cars.SetRange(Reserved, false);
        if not Cars.IsEmpty() and not IsNullGuid(rec.CD_MemberID) then begin
            myNotification.Message('we have cars available!');
            myNotification.AddAction('goto Cars', Codeunit::CarReservation, 'OpenFreeCars');
            myNotification.Send();
        end;
    end;

}
