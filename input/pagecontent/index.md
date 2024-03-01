The Enhancing FHIR to Address Social Services and Social Determinants Project seeks to extend the use of FHIR to effectively and efficiently support Social Services.  The HL7 Gravity Accelerator Program has done significant work in the context of social domains. This guide leverages their work and is a Companion Guide to the Gravity Project’s SDOH Clinical Care 2.1 Implementation Guide.  <Test Sal!>

 FHIR has proven its ability to deliver clinical applications using a Patient-Centric perspective. The US Department for the Administration of Children and Families (ACF) has developed FHIR-based systems based on this.  ...

 Whole Person Care (NEED LINK) provides a view of an individual’s clinical, behavioral, and social needs and their support network. It is becoming increasingly accepted that all of these needs must be addressed together to promote well-being and healthy outcomes. (HL7 LINK for hl7 mission statement) Enhancing the FHIR Platform to address social services enables FHIR to provide the best possible platform to provide a view of Whole Person Care (WPC). 

ACF and other federal and state agencies are using FHIR-based systems to assist in delivering better outcomes for their populations by addressing SD factors with appropriate and qualified human and social services. These organizations have found that FHIR can be inadequate to provide complete solutions when working with individual(s) who need social services as well as working with organizations who provide those social services that can improve health outcomes but are not atypical healthcare systems.

This project objective is to reduce the barriers faced to effectively and efficiently delivering FHIR-based systems that incorporate Whole Person Care social services and social determinants to improve health outcomes.

 
This Companion Guide is developed by the HHS Working Group. (do we need the HHS mission here). The project and this implementation guide are focused on the U.S. environment. However, the basic constructs and interaction patterns may well be applicable outside the U.S.  
### Closed Loop Referral Considerations ###
Enhancing FHIR for Social Services is not meant to be a complete social services closed loop referral process standard. 
There is lots of work already being done and to be done to provide such a complete standard but it is beyond the scope of this IG.
This IG will be complementary to such follow on work.
### Companion Guide Scope
Figure 1 shows how show the interaction between the two actors and its relationship to the SDOH CC IG.  
Note: This figure needs a graphics person. The figure comes from the Gravity / Cervitas SOCIAL CARE CO-DESIGN FINAL REPORT.

<img src="Enhancement_to_SDOH_CC_IG.jpg" alt="Enhancement_to_SDOH_CC_IG" width="100%" />  

The system depicted on the left is a FHIR System that provides Whole Person Care for all participants in the system of care. It can be represented in the SDOH CC IG as the FHIR system that sends information about the referral to a Program System. The Program System depicted on the right may or may not be a FHIR-based system. The assumption has been made that it is not an FHIR-based system. To support this assumption, in the United States, over $400 billion of Social Services were delivered by just 3 separate Federal agencies in 2022 using non-FHIR systems to address housing insecurity, food insecurity, and temporary financial security.  

**Data  Payload Requirements:** The flow of the data (Payload) between these two systems has been driven by the Use Cases developed for the Project. Subject matter experts have reviewed what is useful to the FHIR System and Program System. 


### Methodology and Approach ###
 Whole Person Care activities span numerous HL7 Working Groups and projects and this project has actively collaborated and consulted with the following:

Gravity SDOH  
US Core  
HL7 Domain Analysis Model: Patient Centered Care Team, Release 1  
TBD...
  

