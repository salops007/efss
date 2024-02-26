## Brief Description ##
Abby McIntyre is a 12-year-old female and Andy Smith, her 6-year-old half-brother, are living with her grandmother, their legal guardian. Unfortunately, her grandmother has recently been given a medical diagnosis that makes it important for alternative guardianship to be prepared for should the grandmother no longer be able to serve in this role. During a recent interview with Nancy Smith, a social worker with the child welfare agency who is currently working with Abby McIntyre to establish an alternative guardianship, it was discovered that her uncle, Ben Jameson, with whom she is close, has housing insecurity issues that would preclude him from being named her next guardian. Ben has previously been registered in the local HMIS system. Nancy has determined it should be a goal in Abby’s care plan to reduce Ben’s housing insecurity so that he can take on her care should her grandmother no longer be able to house and care for her. 

## Actors ##  
* **Abby McIntyre:** 12-year-old female receiving care management services through her school social worker using a FHIR-based system.   
* **Andy Smith:** 6-year-old male half-brother of Abby who is also residing with Abby's grandmother.
* **Sarah Kelly:** Abby's 73-year old grandmother who is presently Abby's guardian.
* **Sarah Kelly:** Abby's 73-year old grandmother who is presently Abby's guardian.
* **Ben Jameson:**  Abby’s 37-year-old uncle who is seeking to be Abby’s alternative guardian and has services using the local HMIS.   
* **Tim Harper:**  Tim is Ben's partner. They have no legal relationship but have become a committed couple during their time together in a local homeless encampment.  Tim is employed, but his work teaching art is low paid, and he has not been able to afford rent since his neighborhood was gentrified.   
* **Nancy Smith:**  Abby’s social worker is using a FHIR-based system as the care management system where Abby is one of her clients.   
* **Robert Aston:**  HUD case manager using the local HMIS to help Ben and Tim to secure housing to make Ben a fit guardian for his niece.   
* **FHIR System:**  This system is an electronic care coordination system that Nancy uses to help assist and track her client’s progress.  
* **Program System:** This system delivers housing services including determining an eligible household, enrolling the household in an appropriate service or set of services to address the needs, and providing the users of the FHIR system information so they can document the need is being addressed and to track the service.

## Payload – from FHIR System to Program system ##  

The following data elements from the FHIR System should be sent to the Program System to assist them in enrolling the household.  
* ServiceRequest
  * Status
  * Intent
  * Category
  * Priority
  * Code (potential issue in cardinality because this is required and FHIR system may not know)
  * OrderDetail (question)
  * Subject (need to add screening set)
  * Occurrence
  * Requestor
  * Performer (is this Program System)
  * Reason (SDOH Condition Code)
* Screening Set
  * Identifier
  * Category
  * Type
  * Status
  * Members
    * Individual id
    * Effective time
    * Status
    * Verification
* LifeSet (For all of those individuals identified in the screening set)
  * Subject (individual)
  *  Target (Individual)
  *  Association
    * Individual id
    * Effective time
    * Effective timing
    * Status
    * Verification

* Individual (for those individuals identified in screening set)
  * Name
  * Address
  * DateofBirth
  * Gender
  * Marital Status
  * Race
  * Ethnicity
  * Communication
* Filtered IndividualObservations (may require “data shaping” , e.g., from code to Boolean)
  * HIV
  * Drug Usage
  * Abuse
  * Veteran Status
* Filtered Individual Conditions / goals
* Associated Assessments

## Payload – From Program System to FHIR System ##
After completion of the enrollment of the Program that address the housing needs, the following data elements from the Program System should be sent to the FHIR System to assist the documenting for the care team the fact the need has been addressed and for the FHIR System to track progress appropriately.  
* Updated ServiceRequest
  * **Status**
  * **Intent**
  * Category (?)
  * Priority(?)
  * **Code** (potential issue in cardinality because this is required and FHIR system may not know)
  * OrderDetail (question)
  * **Subject** (need to add screening set)
  * **Occurrence**
  * Requestor
  * **Performer (is this Program System)**
  * Reason (SDOH Condition Code)
  
* Update ScreeningSet with defined membership updated
* Update Individual (can include new individuals from original blob sent from FHIR System) 
* ProgramService
  * Project Name (Section 8A) Housing
  * Benefit Received (list like temporary housing, purchasing credit, cash)
  * How much
    * Duration, $$ 
  * Occurrence
  * Contact Info 
  * Where / address

