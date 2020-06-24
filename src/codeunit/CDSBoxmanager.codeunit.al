codeunit 50140 "AWR_CDS Box manager"
{
    trigger OnRun()
    begin

    end;

    local procedure InsertIntegrationTableMapping(var IntegrationTableMapping: Record "Integration Table Mapping"; MappingName: Code[20]; TableNo: Integer; IntegrationTableNo: Integer; IntegrationTableUIDFieldNo: Integer; IntegrationTableModifiedFieldNo: Integer; TableConfigTemplateCode: Code[10]; IntegrationTableConfigTemplateCode: Code[10]; SynchOnlyCoupledRecords: Boolean)
    begin
        IntegrationTableMapping.CreateRecord(MappingName, TableNo, IntegrationTableNo, IntegrationTableUIDFieldNo, IntegrationTableModifiedFieldNo, TableConfigTemplateCode, IntegrationTableConfigTemplateCode, SynchOnlyCoupledRecords, IntegrationTableMapping.Direction::ToIntegrationTable, 'CDS');
    end;

    procedure InsertIntegrationFieldMapping(IntegrationTableMappingName: Code[20]; TableFieldNo: Integer; IntegrationTableFieldNo: Integer; SynchDirection: Option; ConstValue: Text; ValidateField: Boolean; ValidateIntegrationTableField: Boolean)
    var
        IntegrationFieldMapping: Record "Integration Field Mapping";
    begin
        IntegrationFieldMapping.CreateRecord(IntegrationTableMappingName, TableFieldNo, IntegrationTableFieldNo, SynchDirection,
            ConstValue, ValidateField, ValidateIntegrationTableField);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"CDS Setup Defaults", 'OnAfterResetConfiguration', '', true, true)]
    local procedure HandleOnAfterResetConfiguration(CDSConnectionSetup: Record "CDS Connection Setup")
    var
        IntegrationTableMapping: Record "Integration Table Mapping";
        IntegrationFieldMapping: Record "Integration Field Mapping";
        CDSBox: Record "AWR_CDS Box";
        Box: Record AWR_Box;
    begin
        InsertIntegrationTableMapping(
            IntegrationTableMapping, 'Box',
            DATABASE::"AWR_Box", DATABASE::"AWR_CDS Box",
            CDSBox.FieldNo(cr78b_BoxId), CDSBox.FieldNo(ModifiedOn),
            '', '', false);

        InsertIntegrationFieldMapping('Box', Box.FieldNo("Box No."), CDSBox.FieldNo(cr78b_BoxNo), IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);
        InsertIntegrationFieldMapping('Box', Box.FieldNo(Weight), CDSBox.FieldNo(cr78b_Weight), IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);
        InsertIntegrationFieldMapping('Box', Box.FieldNo("Shipment Date"), CDSBox.FieldNo(cr78b_ShipmentDate), IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);
        InsertIntegrationFieldMapping('Box', Box.FieldNo(Delivered), CDSBox.FieldNo(cr78b_Delivered), IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);
        InsertIntegrationFieldMapping('Box', Box.FieldNo(Comment), CDSBox.FieldNo(cr78b_Comment), IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);
        InsertIntegrationFieldMapping('Box', Box.FieldNo("Items Qty."), CDSBox.FieldNo(cr78b_ItemsQty), IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);
        InsertIntegrationFieldMapping('Box', Box.FieldNo("Carton Type"), CDSBox.FieldNo(cr78b_CartonType), IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"CRM Setup Defaults", 'OnGetCDSTableNo', '', false, false)]
    local procedure HandleOnGetCDSTableNo(BCTableNo: Integer; var CDSTableNo: Integer; var handled: Boolean)
    begin
        if BCTableNo = DATABASE::AWR_Box then begin
            CDSTableNo := DATABASE::"AWR_CDS Box";
            handled := true;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Integration Management", 'OnIsIntegrationRecord', '', true, true)]
    local procedure HandleOnIsIntegrationRecord(TableID: Integer; var isIntegrationRecord: Boolean)
    begin
        if TableID = DATABASE::AWR_Box then
            isIntegrationRecord := true;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Integration Management", 'OnAfterAddToIntegrationPageList', '', true, true)]
    local procedure HandleOnAfterAddToIntegrationPageList(var TempNameValueBuffer: Record "Name/Value Buffer"; var NextId: Integer)
    begin
        TempNameValueBuffer.Init();
        TempNameValueBuffer.ID := NextId;
        NextId := NextId + 1;
        TempNameValueBuffer.Name := Format(Page::"AWR_Box List");
        TempNameValueBuffer.Value := Format(Database::AWR_Box);
        TempNameValueBuffer.Insert();
    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Lookup CRM Tables", 'OnLookupCRMTables', '', true, true)]
    local procedure HandleOnLookupCRMTables(CRMTableID: Integer; NAVTableId: Integer; SavedCRMId: Guid; var CRMId: Guid; IntTableFilter: Text; var Handled: Boolean)
    begin
        if CRMTableID = Database::"AWR_CDS Box" then
            Handled := LookupCDSBox(CRMId, IntTableFilter);
    end;


    local procedure LookupCDSBox(var CRMId: Guid; IntTableFilter: Text): Boolean
    var
        CDSBox: Record "AWR_CDS Box";
        CDSBoxList: Page "AWR_CDS Boxes";
    begin
        if not IsNullGuid(CRMId) then
            if CDSBox.Get(CRMId) then
                CDSBoxList.SetRecord(CDSBox);

        CDSBox.SetView(IntTableFilter);
        CDSBoxList.SetTableView(CDSBox);
        CDSBoxList.LookupMode(true);
        if CDSBoxList.RunModal() = ACTION::LookupOK then begin
            CDSBoxList.GetRecord(CDSBox);
            CRMId := CDSBox.cr78b_BoxId;
            exit(true);
        end;
        exit(false);
    end;

}