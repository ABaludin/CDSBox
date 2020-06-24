page 50140 "AWR_Box List"
{

    ApplicationArea = All;
    Caption = 'Box List';
    PageType = List;
    SourceTable = AWR_Box;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Box No."; "Box No.")
                {
                    Tooltip = 'Specifies the Box No.';
                    ApplicationArea = All;
                }
                field("Items Qty."; "Items Qty.")
                {
                    Tooltip = 'Specifies the Items Qty.';
                    ApplicationArea = All;
                }
                field("Shipment Date"; "Shipment Date")
                {
                    Tooltip = 'Specifies the Shipment Date';
                    ApplicationArea = All;
                }
                field(Comment; Comment)
                {
                    Tooltip = 'Specifies the Comment';
                    ApplicationArea = All;
                }
                field(Delivered; Delivered)
                {
                    Tooltip = 'Specifies the Delivered';
                    ApplicationArea = All;
                }
                field(Weight; Weight)
                {
                    Tooltip = 'Specifies the Weight';
                    ApplicationArea = All;
                }
                field("Carton Type"; "Carton Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Carton Type field';
                }
            }
        }
    }

}
