
using {riskmanagement as rm} from '../db/schema';

@path: 'service/risk'
service RiskService {
    entity Risks       as projection on rm.Risks;
    annotate Risks with @odata.draft.enabled;

    entity Mitigations as projection on rm.Mitigations { *,
        risks: redirected to Risks};
    annotate Mitigations with @odata.draft.enabled;

    @readonly entity ListOfRisks as projection on rm.Risks
    excluding {prio, descr, miti, imapct, criticality, PrioCriticality};

    // BusinessPartner will be used later
    //@readonly entity BusinessPartners as projection on rm.BusinessPartners;
}