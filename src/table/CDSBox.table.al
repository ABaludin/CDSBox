table 50141 "AWR_CDS Box"
{
    ExternalName = 'cr78b_box';
    TableType = CDS;
    Description = '';

    fields
    {
        field(1; "cr78b_BoxId"; GUID)
        {
            DataClassification = CustomerContent;
            ExternalName = 'cr78b_boxid';
            ExternalType = 'Uniqueidentifier';
            ExternalAccess = Insert;
            Description = 'Unique identifier for entity instances';
            Caption = 'Box';
        }
        field(2; CreatedOn; Datetime)
        {
            DataClassification = CustomerContent;
            ExternalName = 'createdon';
            ExternalType = 'DateTime';
            ExternalAccess = Read;
            Description = 'Date and time when the record was created.';
            Caption = 'Created On';
        }
        field(4; ModifiedOn; Datetime)
        {
            DataClassification = CustomerContent;
            ExternalName = 'modifiedon';
            ExternalType = 'DateTime';
            ExternalAccess = Read;
            Description = 'Date and time when the record was modified.';
            Caption = 'Modified On';
        }
        field(24; statecode; Option)
        {
            DataClassification = CustomerContent;
            ExternalName = 'statecode';
            ExternalType = 'State';
            ExternalAccess = Modify;
            Description = 'Status of the Box';
            Caption = 'Status';
            InitValue = " ";
            OptionMembers = " ",Active,Inactive;
            OptionOrdinalValues = -1, 0, 1;
        }
        field(26; statuscode; Option)
        {
            DataClassification = CustomerContent;
            ExternalName = 'statuscode';
            ExternalType = 'Status';
            Description = 'Reason for the status of the Box';
            Caption = 'Status Reason';
            InitValue = " ";
            OptionMembers = " ",Active,Inactive;
            OptionOrdinalValues = -1, 1, 2;
        }
        field(28; VersionNumber; BigInteger)
        {
            DataClassification = CustomerContent;
            ExternalName = 'versionnumber';
            ExternalType = 'BigInt';
            ExternalAccess = Read;
            Description = 'Version Number';
            Caption = 'Version Number';
        }
        field(29; ImportSequenceNumber; Integer)
        {
            DataClassification = CustomerContent;
            ExternalName = 'importsequencenumber';
            ExternalType = 'Integer';
            ExternalAccess = Insert;
            Description = 'Sequence number of the import that created this record.';
            Caption = 'Import Sequence Number';
        }
        field(30; OverriddenCreatedOn; Datetime)
        {
            DataClassification = CustomerContent;
            ExternalName = 'overriddencreatedon';
            ExternalType = 'DateTime';
            ExternalAccess = Insert;
            Description = 'Date and time that the record was migrated.';
            Caption = 'Record Created On';
        }
        field(31; TimeZoneRuleVersionNumber; Integer)
        {
            DataClassification = CustomerContent;
            ExternalName = 'timezoneruleversionnumber';
            ExternalType = 'Integer';
            Description = 'For internal use only.';
            Caption = 'Time Zone Rule Version Number';
        }
        field(32; UTCConversionTimeZoneCode; Integer)
        {
            DataClassification = CustomerContent;
            ExternalName = 'utcconversiontimezonecode';
            ExternalType = 'Integer';
            Description = 'Time zone code that was in use when the record was created.';
            Caption = 'UTC Conversion Time Zone Code';
        }
        field(33; "cr78b_BoxNo"; Text[100])
        {
            DataClassification = CustomerContent;
            ExternalName = 'cr78b_boxno';
            ExternalType = 'String';
            Description = 'Required name field';
            Caption = 'Box No.';
        }
        field(34; "cr78b_ItemsQty"; Integer)
        {
            DataClassification = CustomerContent;
            ExternalName = 'cr78b_itemsqty';
            ExternalType = 'Integer';
            Description = '';
            Caption = 'Items Qty.';
        }
        field(35; "cr78b_Weight"; Decimal)
        {
            DataClassification = CustomerContent;
            ExternalName = 'cr78b_weight';
            ExternalType = 'Double';
            Description = '';
            Caption = 'Weight';
        }
        field(36; "cr78b_Comment"; Text[250])
        {
            DataClassification = CustomerContent;
            ExternalName = 'cr78b_comment';
            ExternalType = 'String';
            Description = '';
            Caption = 'Comment';
        }
        field(37; "cr78b_ShipmentDate"; Date)
        {
            DataClassification = CustomerContent;
            ExternalName = 'cr78b_shipmentdate';
            ExternalType = 'DateTime';
            Description = '';
            Caption = 'Shipment Date';
        }
        field(38; "cr78b_Delivered"; Boolean)
        {
            DataClassification = CustomerContent;
            ExternalName = 'cr78b_delivered';
            ExternalType = 'Boolean';
            Description = '';
            Caption = 'Delivered';
        }
        field(40; "cr78b_CartonType"; Option)
        {
            DataClassification = CustomerContent;
            ExternalName = 'cr78b_cartontype';
            ExternalType = 'Picklist';
            Description = '';
            Caption = 'Carton Type';
            InitValue = Small;
            OptionMembers = Small,Medium,Large;
            OptionOrdinalValues = 748370000, 748370001, 748370002;
        }
    }
    keys
    {
        key(PK; cr78b_BoxId)
        {
            Clustered = true;
        }
        key(Name; cr78b_BoxNo)
        {
        }
    }
    fieldgroups
    {
        fieldgroup(Dropdown; cr78b_BoxNo)
        {
        }
    }
}