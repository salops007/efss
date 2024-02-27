Alias: LNC = http://loinc.org
Alias: GROUPTYPE = http://hl7.org/fhir/group-type	
Alias: MEMBERSHIP = http://hl7.org/fhir/ValueSet/group-membership-basis


Resource: IndividualRole
Id: IndividualRole
Parent: DomainResource
Title: "FHIR Realization Model for EFSS : IndividualRole"
Description: "IndividualRole."
* ^baseDefinition = "http://hl7.org/fhir/StructureDefinition/DomainResource"
* ^kind = #resource
* individual 1..1 SU Reference(Person) "individual" "Individual"

Extension: FHIRSubject
Description: "FHIRsubject"
Id: fhirsubject
* value[x] only Reference(IndividualRole or Patient)

Extension: FHIRQualificationValue
Description: "FHIRQualificationValue"
Id: fhirqualificationvalue
* value[x] 1..1

Profile: FHIRQualification
Description: "FHIR Realization Model for EFSS : FHIRQualification"
Id: fhirqualification
Parent: CodeableConcept
* coding 1..*
* extension contains
    FHIRQualificationValue named value 1..1 MS
 

Extension: FHIRAssociation
Description: "FHIRAssociation"
Id: fhirassssociation
* extension contains
    association 1..1 MS and 
    type 1..1 MS and 
    effectiveTime 0..1 and
    effectiveTiming 0..* and
    status 0..* and
    verification 0..* and
    qualification 0..*
* extension[association] ^short = "associtions"
* extension[association].value[x] only Reference(Patient or IndividualRole or Organization or LegalAuthority)
* extension[type].value[x] only CodeableConcept 
* extension[type] ^short = "Type of relationship, for instance biological daugher or co-habitant"  
* extension[effectiveTime].value[x]  only Period 
* extension[effectiveTime] ^short = "When the association is/was active" 
* extension[effectiveTiming].value[x] only Timing 
* extension[effectiveTiming] ^short = "When the association is in effect during the effect time; For instance co-habition 6 weeks out of the year due to divorece settlement" 
* extension[status].value[x] only CodeableConcept 
* extension[status] ^short = "status"  
* extension[verification].value[x] only CodeableConcept 
* extension[verification] ^short = "Verification status of association"  
* extension[qualification].value[x] only FHIRQualification 
* extension[qualification] ^short = "Qualification"  

Profile: FHIRLifeSet
Id: FHIRLifeSet
Parent: Group
Title: "FHIR Realization Model for EFSS : Life Set"
Description: "Life Set is an amalgamation of the persons/groups who constitute the interactions and relationships from the perspectice of an individual.  The associations from the individual to the person/group are explicit in nature as to avoid confusion and structured to properly elaborate all aspects of the particular association"
// * extension[fhirsubject]    
* extension contains
    FHIRSubject named subject 1..1 MS and
    FHIRAssociation named assssociation 0..* MS
* characteristic 0..0
* member 0..0

Extension: FHIRMembership
Id: FHIRmembership
Description: "Membership"
* extension contains 
  individual 1..1 MS and 
  membership 0..1 MS and
  effectiveTime 0..1 MS and
  status 0..1 MS and
  role 0..1 MS and
  verification 0..1 MS
* extension[individual].value[x] only  Reference(IndividualRole or Patient) 
* extension[individual] ^short = "Individual who requires service(s)"  
* extension[membership].value[x]  only CodeableConcept 
* extension[membership] ^short = "Type of membership, HUD household for instance"  
* extension[effectiveTime].value[x] only  Period 
* extension[effectiveTime] ^short = "When the membership was active"  
* extension[status].value[x]  only CodeableConcept 
* extension[status] ^short = "status"  
* extension[role].value[x]  only CodeableConcept 
* extension[role] ^short = "Possible role person is as part as it pertains to the type of membershihp, Head of Household for HUD Household"  
* extension[verification].value[x] only  CodeableConcept 
* extension[verification] ^short = "Verification status of the membership/eligbility of this individual in set"  



Profile: FHIRScreeningSet
Id: FHIRScreeningSet
Parent: Group
Title: "FHIR Realization Model for EFSS : Screening Set"
Description: "Screening Set is a composition of individuals in need of service(s). The focus of the Screening Set is provide an effecient construct for identifying and illustraing the individuals in the composition.  The Screen Set itself is meant to be transaction and temporal in nature.  The Screen Set would be active while the steps taken to acquire the services have been completed. Screenig Set should be viewed as the trigger for acquisition process for the required services but not utilized for the acquisition workflow operations "
* characteristic 0..0
* member 0..0
* extension contains
    FHIRMembership named membership 1..* MS 

