Alias:   LNC = http://loinc.org
Alias:   FamilyMemberValue = http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.1.11.19579
Alias:   MaritalOrSpousalStatus = http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1222.1310
Alias:   PersonalAndLegalRelationshipRoleType = http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.11.20.12.1
Alias:   VeteranStatusGoals = http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.214
Alias:   Problem = http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.88.12.3221.7.4



ValueSet: LifeSetAssociationVS
Id: life-set-association-vs
Title: "Life Set Association VS"
* include codes from valueset FamilyMemberValue and MaritalOrSpousalStatus and PersonalAndLegalRelationshipRoleType

ValueSet: LifeSetAssociationVerificationCodeVS
Id: life-set-association-verification-role-vs
Title: "Life Set Association Verification Code VS"
          
ValueSet: LifeSetAssociationStatusCodeVS
Id: life-set-association-status-role-vs
Title: "LifeSet Association Status Code VS"

ValueSet: MembershipTypeCodeVS
Id: membership-type-code-vs
Title: "Membership Type Code VS"


ValueSet: MembershipRoleCodeVS
Id: membership-type-role-vs
Title: "Membership Role Code VS"
* include codes from valueset PersonalAndLegalRelationshipRoleType

ValueSet: MembershipVerificationCodeVS
Id: membership-verification-role-vs
Title: "Membership Verification Code VS"

ValueSet: MembershipStatusCodeVS
Id: membership-status-role-vs
Title: "Membership Status Code VS"


ValueSet: AssociationQualificationTypeCodeVS
Id: association-qualification-type-code-vs
Title: "Association Qualification Type Code VS"


Resource: Membership
Id: membership
Parent: Resource
Title: "FHIR Analysis Model for EFSS : Membership"
Description: "Membership"
* ^baseDefinition = "http://hl7.org/fhir/StructureDefinition/Element"
* ^kind = #complex-type
* obeys membership-1
* individual 1..1 SU Individual "Individual who requires service(s)" "Individual"
* membership 0..1 SU CodeableConcept "Type of membership, HUD household for instance" "Membership"
* membership from MembershipTypeCodeVS (example)
* effectiveTime 1..1 SU Period "When the membership was active" "Effective Time"
* status 0..* SU CodeableConcept "status" "Status"
* status from MembershipStatusCodeVS (example)
* role 0..* SU CodeableConcept "Possible role person is as part as it pertains to the type of membershihp, Head of Household for HUD Household" "Status"
* role from MembershipRoleCodeVS (example)
* verification 0..* SU CodeableConcept "Verification status of the membership/eligbility of this individual in set" "Verification"
* verification from MembershipVerificationCodeVS (example)

Resource: Qualification
Id: Qualification
Parent: Resource
Title: "FHIR Analysis Model for EFSS : Qualification"
Description: "Qualification"
* ^baseDefinition = "http://hl7.org/fhir/StructureDefinition/Element"
* ^kind = #complex-type
* type 1..1 SU CodeableConcept "Type of qualification"
* type from AssociationQualificationTypeCodeVS (example)
* value 1..1 SU Quantity "Verification status of association" "Verification"

Resource: Association
Id: Association
Parent: Resource
Title: "FHIR Analysis Model for EFSS : Association"
Description: "Association"
* ^baseDefinition = "http://hl7.org/fhir/StructureDefinition/Element"
* ^kind = #complex-type
* association 1..1 SU Reference(Individual or Organization or LegalAuthority) "individual" "Individual"
* type 1..1 SU CodeableConcept "Type of relationship, for instance biological daugher or co-habitant" "Relationship"
* type from LifeSetAssociationVS (example)
* effectiveTime 0..1 SU Period "When the association is/was active" "Effective Time"
* effectiveTiming 0..1 SU Timing "When the association is in effect during the effect time; For instance co-habition 6 weeks out of the year due to divorece settlement" "Effective Time"
* status 0..* SU CodeableConcept "status" "Status"
* type from LifeSetAssociationStatusCodeVS (example)
* verification 0..* SU CodeableConcept "Verification status of association" "Verification"
* type from LifeSetAssociationVerificationCodeVS (example)
* qualification 0..* Qualification "Qualification" "Qualification"

Invariant: membership-1
Description: "Effective Time has start date"
Expression: "effectiveTime.start.exists()"
Severity: #error
XPath: "f:effectiveTime.start"

Resource: Individual
Id: Individual
Parent: DomainResource
Title: "FHIR Analysis Model for EFSS : Individual"
Description: "A single human being as distinct from a group, class, or family."
* ^baseDefinition = "http://hl7.org/fhir/StructureDefinition/DomainResource"
* ^kind = #resource
* obeys individual-1
* identifier 0..* SU Identifier "identifier" "Identifier"
* active 1..1 SU boolean "active" "active"
* name 0..* SU HumanName "name" "name"
* telecom 0..* SU ContactPoint "telecom" "Telecom"
* gender 0..1 SU code "gender" "Gender"
* birthDate 0..1 SU date "birthDate" "birthDate"
* address 0..* SU Address "address" "Address"
* maritalStatus 0..1 SU CodeableConcept "maritalStatus" "Marital Status"
* maritalStatus  from MaritalOrSpousalStatus
// * relatedIndividual  0..* SU RelatedIndividual "relatedIndividual" "Related Individual"
* veteranStatus 0..1 SU CodeableConcept "veteranStatus" "Veteran Status"
* veteranStatus  from VeteranStatusGoals
* healthStatus 0..* SU CodeableConcept "healthStatus" "Health Status"
* healthStatus  from Problem

Resource: LifeSet
Id: LifeSet
Parent: DomainResource
Title: "FHIR Analysis Model for EFSS : Life Set"
Description: "Life Set is an amalgamation of the persons/groups who constitute the interactions and relationships from the perspectice of an individual.  The associations from the individual to the person/group are explicit in nature as to avoid confusion and structured to properly elaborate all aspects of the particular association"
* ^baseDefinition = "http://hl7.org/fhir/StructureDefinition/DomainResource"
* ^kind = #resource
* subject 1..1 SU Individual "Individual whose associations these are" "Individual"
* identifier 0..* SU Identifier "identifier" "Identifier"
* association 0..* SU Association  "Association" "Association"

Invariant:   individual-1
Description: "Individual.name.given or Individual.name.family or both SHALL be present"
Severity:    #error
Expression:  "family.exists() or given.exists()"
XPath:       "f:given or f:family"

Resource: ScreeningSet
Id: ScreeningSet
Parent: DomainResource
Title: "FHIR Analysis Model for EFSS : Screening Set"
Description: "Screening Set is a composition of individuals in need of service(s). The focus of the Screening Set is provide an effecient construct for identifying and illustraing the individuals in the composition.  The Screen Set itself is meant to be transaction and temporal in nature.  The Screen Set would be active while the steps taken to acquire the services have been completed. Screenig Set should be viewed as the trigger for acquisition process for the required services but not utilized for the acquisition workflow operations "
* ^baseDefinition = "http://hl7.org/fhir/StructureDefinition/DomainResource"
* ^kind = #resource
* identifier 0..* SU Identifier "identifier" "Identifier"
* serviceCategory 0..* SU CodeableConcept "general classificaiton of the services" "serviceCategory"
* service 0..* SU CodeableConcept "one or more specific services needed" "serviceProgramb"
* status 1..1 SU code "status" "status"
* membership 0..* Membership  "Membership" "Membership"

Resource: LegalAuthority
Id: LegalAuthority
Parent: DomainResource
Title: "FHIR Analysis Model for EFSS : LegalAuthority"
Description: "A legal authority refers to a source of law or a body that has the power to make and enforce laws within a particular jurisdiction."
* ^baseDefinition = "http://hl7.org/fhir/StructureDefinition/DomainResource"
* ^kind = #resource
* identifier 0..* SU Identifier "identifier" "Identifier"
* active 1..1 SU boolean "active" "active"
* name 0..* SU string "name" "name"
* alias 0..* SU string "name" "name"
* telecom 0..* SU ContactPoint "telecom" "Telecom"
* partOf 0..* SU Reference(LegalAuthority) "legalAuthority" "LegalAuthority"
