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
* obeys relatedindividual-1
* individual 1..1 SU Individual "individual" "Individual"
* membership 1..1 SU CodeableConcept "relationship" "Relationship"
* effectiveTime 1..1 SU Period "effectiveTime" "Effective Time"

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
* address 0..* SU Address "address" "address"
* maritalStatus 0..1 SU CodeableConcept "maritalStatus" "Marital Status"
* relatedIndividual  0..* SU RelatedIndividual "relatedIndividual" "Related Individual"


Resource: LifeSet
Id: LifeSet
Parent: DomainResource
Title: "LifeSet"
Description: "The collection of individuals associated with subject"
* ^baseDefinition = "http://hl7.org/fhir/StructureDefinition/DomainResource"
* ^kind = #resource
* obeys individual-1
* identifier 0..* SU Identifier "identifier" "Identifier"


* relatedIndividual  0..* SU RelatedIndividual "relatedIndividual" "Related Individual"

Invariant:   individual-1
Description: "Individual.name.given or Individual.name.family or both SHALL be present"
Severity:    #error
Expression:  "family.exists() or given.exists()"
XPath:       "f:given or f:family"


Resource: SreeningGroup
Id: SreeningGroup
Parent: DomainResource
Title: "Social Group"
Description: "A social group is a collection of individuals who come together and interact with one another based on shared characteristics, interests, or purposes"
* ^baseDefinition = "http://hl7.org/fhir/StructureDefinition/DomainResource"
* ^kind = #resource
* identifier 0..* SU Identifier "identifier" "Identifier"
* category 0..* SU CodeableConcept "category" "category"
* code 0..* SU CodeableConcept "type" "type"
* status 1..1 SU code "status" "status"
* membership 0..* Membership  "Membership" "Membership"


Profile:  HUDHouseholdGroup
Parent:    SreeningGroup
Id:       hud-household-group
Title: "HUD Household Group"
Description: "HUD Household Group is two or more persons who live in the same dwelling unit whether or not they are related to one another;"
* code  = LNC#1234 "HUD Household Group"
* membership 2..*