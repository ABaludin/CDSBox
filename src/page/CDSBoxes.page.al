page 50141 "AWR_CDS Boxes"
{

    ApplicationArea = All;
    Caption = 'CDS Boxes';
    PageType = List;
    SourceTable = "AWR_CDS Box";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("cr78b_BoxId"; cr78b_BoxId)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the cr78b_BoxId field';
                }
                field("cr78b_BoxNo"; cr78b_BoxNo)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the cr78b_BoxNo field';
                }
                field("cr78b_CartonType"; cr78b_CartonType)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the cr78b_CartonType field';
                }
                field("cr78b_Comment"; cr78b_Comment)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the cr78b_Comment field';
                }
                field("cr78b_Delivered"; cr78b_Delivered)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the cr78b_Delivered field';
                }
                field("cr78b_ItemsQty"; cr78b_ItemsQty)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the cr78b_ItemsQty field';
                }
                field("cr78b_ShipmentDate"; cr78b_ShipmentDate)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the cr78b_ShipmentDate field';
                }
                field("cr78b_Weight"; cr78b_Weight)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the cr78b_Weight field';
                }
                field(CreatedOn; CreatedOn)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the CreatedOn field';
                }
                field(ImportSequenceNumber; ImportSequenceNumber)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the ImportSequenceNumber field';
                }
                field(ModifiedOn; ModifiedOn)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the ModifiedOn field';
                }
                field(OverriddenCreatedOn; OverriddenCreatedOn)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the OverriddenCreatedOn field';
                }
                field(statecode; statecode)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the statecode field';
                }
                field(statuscode; statuscode)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the statuscode field';
                }
                field(TimeZoneRuleVersionNumber; TimeZoneRuleVersionNumber)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the TimeZoneRuleVersionNumber field';
                }
                field(UTCConversionTimeZoneCode; UTCConversionTimeZoneCode)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the UTCConversionTimeZoneCode field';
                }
                field(VersionNumber; VersionNumber)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the VersionNumber field';
                }
            }
        }
    }
    trigger OnInit()
    begin
        Codeunit.Run(Codeunit::"CRM Integration Management");
    end;
}
