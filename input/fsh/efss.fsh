Alias:   LNC = http://loinc.org

Resource: RelatedIndividual
Id: RelatedIndividual
Parent: Resource
Title: "RelatedIndividual"
Description: "RelatedIndividual"
* ^baseDefinition = "http://hl7.org/fhir/StructureDefinition/Element"
* ^kind = #complex-type
* obeys relatedindividual-1
* relatedIndividual 1..1 SU RelatedIndividual "relatedIndividual" "Related Individual"
* relationship 1..1 SU CodeableConcept "relationship" "Relationship"
* effectiveTime 1..1 SU Period "effectiveTime" "Effective Time"

Invariant: relatedindividual-1
Description: "Effective Time has start date"
Expression: "effectiveTime.start.exists()"
Severity: #error
XPath: "f:effectiveTime.start"


Resource: Membership
Id: membership
Parent: Resource
Title: "Membership"
Description: "Membership"
* ^baseDefinition = "http://hl7.org/fhir/StructureDefinition/Element"
* ^kind = #complex-type
* obeys membership-1
* individual 1..1 SU Individual "Individual who requires service(s)" "Individual"
* membership 0..1 SU CodeableConcept "Type of membership, HUD household for instance" "Membership"
* effectiveTime 1..1 SU Period "When the membership was active" "Effective Time"
* status 0..* SU CodeableConcept "status" "Status"
* role 0..* SU CodeableConcept "Possible role person is as part as it pertains to the type of membershihp, Head of Household for HUD Household" "Status"
* verification 0..* SU CodeableConcept "Verification status of the membership/eligbility of this individual in set" "Verification"

Resource: Qualification
Id: Qualification
Parent: Resource
Title: "Qualification"
Description: "Qualification"
* ^baseDefinition = "http://hl7.org/fhir/StructureDefinition/Element"
* ^kind = #complex-type
* type 1..1 SU CodeableConcept "Type of qualification"
* value 1..1 SU Quantity "Verification status of association" "Verification"


Resource: Association
Id: Association
Parent: Resource
Title: "Association"
Description: "Association"
* ^baseDefinition = "http://hl7.org/fhir/StructureDefinition/Element"
* ^kind = #complex-type
* association 1..1 SU Reference(Individual or Organization or LegalAuthority) "individual" "Individual"
* type 1..1 SU CodeableConcept "Type of relationship, for instance biological daugher or co-habitant" "Relationship"
* effectiveTime 0..1 SU Period "When the association is/was active" "Effective Time"
* effectiveTiming 0..1 SU Timing "When the association is in effect during the effect time; For instance co-habition 6 weeks out of the year due to divorece settlement" "Effective Time"
* status 0..* SU CodeableConcept "status" "Status"
* verification 0..* SU CodeableConcept "Verification status of association" "Verification"
* qualification 0..* Qualification "Qualification" "Qualification"



Invariant: membership-1
Description: "Effective Time has start date"
Expression: "effectiveTime.start.exists()"
Severity: #error
XPath: "f:effectiveTime.start"


// Resource: RelatedIndividual
// Id: RelatedIndividual
// Parent: BackboneElement
// Title: "BackboneElement"
// Description: "BackboneElement"
// * ^baseDefinition = "http://hl7.org/fhir/StructureDefinition/BackboneElement"
// * ^kind = #elementddd

Resource: Individual
Id: Individual
Parent: DomainResource
Title: "Individual"
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
* relatedIndividual  0..* SU RelatedIndividual "relatedIndividual" "Related Individual"
* veteranStatus 0..1 SU CodeableConcept "veteranStatus" "Veteran Status"
* healthStatus 0..* SU CodeableConcept "healthStatus" "Health Status"


Resource: LifeSet
Id: LifeSet
Parent: DomainResource
Title: "Life Set"
Description: "Life Set is an amalgamation of the persons/groups who constitute the interactions and relationships from the perspectice of an individual.  The associations from the individual to the person/group are explicit in nature as to avoid confusion and structured to properly elaborate all aspects of the particular association"
* ^baseDefinition = "http://hl7.org/fhir/StructureDefinition/DomainResource"
* ^kind = #resource
* subject 1..1 SU Individual "Individual whose associations these are" "Individual"
* identifier 0..* SU Identifier "identifier" "Identifier"
* association 0..* SU Association  "Association" "Association"
// * relatedIndividual  0..* SU Individual "relatedIndividual" "Related Individual"

Invariant:   individual-1
Description: "Individual.name.given or Individual.name.family or both SHALL be present"
Severity:    #error
Expression:  "family.exists() or given.exists()"
XPath:       "f:given or f:family"


Resource: ScreeningSet
Id: ScreeningSet
Parent: DomainResource
Title: "Screening Set"
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
Title: "LegalAuthority"
Description: "A legal authority refers to a source of law or a body that has the power to make and enforce laws within a particular jurisdiction."
* ^baseDefinition = "http://hl7.org/fhir/StructureDefinition/DomainResource"
* ^kind = #resource
* identifier 0..* SU Identifier "identifier" "Identifier"
* active 1..1 SU boolean "active" "active"
* name 0..* SU string "name" "name"
* alias 0..* SU string "name" "name"
* telecom 0..* SU ContactPoint "telecom" "Telecom"
* partOf 0..* SU Reference(LegalAuthority) "legalAuthority" "LegalAuthority"

// Profile:  HUDHouseholdGroup
// Parent:    ScreeningSet
// Id:       hud-household-group
// Title: "HUD Household Group"
// Description: "HUD Household Group is two or more persons who live in the same dwelling unit whether or not they are related to one another;"
// * code  = LNC#1234 "HUD Household Group"
// * membership 2..*