
using {riskmanagement as rm} from '../db/schema';

@path: 'service/risk'
service RiskService @(requires: 'authenticated-user') {
    entity Risks @(restrict: [
        {
            grant: ['READ', 'WRITE'],
            where: 'createdBy = $user',
        },
        {
            grant: [
                'READ',
                'WRITE',
                'UPDATE',
                'UPSERT',
                'DELETE',
            ],
            to: 'RiskManager'
        }
    ]) as projection on rm.Risks
    annotate Risks with @odata.draft.enabled;

    entity Mitigations @(restrict: [
        {
            grant: ['READ', 'WRITE'],
            where: 'createdBy = $user',
        },
        {
            grant: '*',
            to: 'RiskManager'
        }
    ]) as projection on rm.Mitigations { *,
        risks: redirected to Risks};
    annotate Mitigations with @odata.draft.enabled;



    @readonly entity ListOfRisks as projection on rm.Risks
    {ID, title, owner};

    entity Items as projection on rm.Items;

    function getByQuantity(quantity: Integer) returns many Items; 
    action addItem(title: String, descr: String, quantity: Integer);
    function getSome() returns String; 
    function getNorthwind() returns array of String;

    
    //BusinessPartner will be used later
    @readonly entity BusinessPartners as projection on rm.BusinessPartners;
}