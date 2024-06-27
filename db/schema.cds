
namespace riskmanagement;

using {
        managed,
        cuid,
        User,
        sap.common.CodeList
} from '@sap/cds/common';

entity Risks : cuid, managed {
        title                    : localized String(100);
        owner                    : localized String;
        prio                     : Association to Priority;
        descr                    : localized String;
        miti                     : Association to Mitigations;
        impact                   : Integer;
        // bp : Association to BusinessPartners;
        virtual criticality      : Integer;
        virtual PrioCriticality : Integer;
}

entity Mitigations : cuid, managed {
        descr    : String;
        owner    : String;
        timeline : String;
        risks    : Association to many Risks
                           on risks.miti = $self;
}

entity Priority : CodeList {
        key code : String enum {
                    high   = 'H';
                    medium = 'M';
                    low    = 'L';
            };
}

entity Items : cuid {
        title           : String;
        descr           : String;
        quantity        : Integer;   
}