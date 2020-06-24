table 50140 "AWR_Box"
{
    DataClassification = CustomerContent;


    fields
    {
        field(1; "Box No."; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(2; Weight; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(3; "Shipment Date"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(4; Delivered; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(5; Comment; Text[250])
        {
            DataClassification = CustomerContent;
        }
        field(6; "Items Qty."; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(7; "Carton Type"; Option)
        {
            DataClassification = CustomerContent;
            OptionMembers = small,medium,large;
            OptionCaption = 'Small,Medium,Large';
        }
    }

    keys
    {
        key(PK; "Box No.")
        {
            Clustered = true;
        }
    }

}