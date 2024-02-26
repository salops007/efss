##  Enhancing FHIR for Social Services (EFSS)  
It is becoming increasingly clear that FHIR will be the platform for delivering software applications for care delivery systems. The Enhancing FHIR to Address Social Services and Social Determinants Project seeks to extend the use of FHIR to effectively and efficiently support Social Services.  The HL7 Gravity Accelerator Program has done significant work in the context of social domains. This guide leverages their work and is a Companion Guide to the Gravity Project’s SDOH Clinical Care 2.1 Implementation Guide.  

Enhancing the FHIR Platform to address social services enables FHIR to provide the best possible platform to provide a view of Whole Person Care (WPC).  Whole Person Care provides a view of an individual’s clinical, behavioral, and social needs and their support network. It is becoming increasingly accepted that all of these needs must be addressed together to promote well-being and healthy outcomes.  

This Companion Guide is developed by the HHS Working Group. (do we need the HHS mission here). The project and this implementation guide are focused on the U.S. environment. However, the basic constructs and interaction patterns may well be applicable outside the U.S.  

### Providing Better Outcomes ###
It is becoming increasingly evident that Social Determinants (SD) are key factors in determining the well-being of an individual and can negatively impact clinical conditions when these social needs are not met. Numerous studies have shown the impact of SD factors. For example, a National Academy of Medicine Report stated that “Medical care is estimated to account for only 10-20 percent of the modifiable contributors to healthy outcomes for a population. The other 80 to 90 percent are sometimes broadly called the “SDoH”. Significant resources are expended by non-clinical organizations to deliver social and human services to address SD needs. For these non-clinical organizations, their work focuses on the person or individual, their social relationships, and providing social services that can improve the well-being of the individual.  

### Enhancing FHIR ###
This work grew out of experiences developing FHIR solutions enabling a WPC view that incorporated social needs with clinical and behavioral needs. These care coordination and care management solutions included care coordination and care management  Social Services pathways that include assessment and determination of needs, providing appropriate services, monitoring, and measuring outcomes.  See Gravity SDOH Clinical Care 2.1 Implementation Guide Conceptual Model.  

During their development, it was found that issues were discovered implementing membership of individuals in groups such as families and households and the need to understand the roles and associations between individuals and within a group. Additionally, these and other relationships between individuals can provide a view into a larger support system for individuals that can help in the person’s journey.  

**Relationships to other IG**

Gravity SDOH  
US Core  
HL7 Domain Analysis Model: Patient Centered Care Team, Release 1  
Others to be added  


---  
---  

##  Enhancing FHIR for Social Services (EFSS)

### Design Considerations
* **Operation versus Persistance Group Management**
Management of group membership overtime requires overhead operations.  In FHIR - we can propose the use of resolvable location for group (fhir/Group/1234) or a computable group as defined by an operation (fhir/Indvidual/$group?HUDHousehold)

Each option has overhead and complications, resolvable requires versioning and temporal features while computed requires navigable associations to collect the group memberships;  


### Enhancing FHIR for Social Services (EFSS)
It is becoming increasingly evident that Social Determinants (SD) are key factors in determining the well-being of an individual and can negatively impact clinical conditions when these social needs are not met. Numerous studies have shown the impact of SD factors.  For example, a National Academy of Medicine Report stated that “Medical care is estimated to account for only 10-20 percent of the modifiable contributors to healthy outcomes for a population. The other 80 to 90 percent are sometimes broadly called the "SDoH”. Significant resources are expended by non-clinical organizations to deliver social and human services to address SD needs. For these non-clinical organizations, their work focuses on the person or individual, their social relationships, and providing social services that can improve the well-being of the individual.

Within HL7, it is evident that FHIR has become the standard for developing new applications. FHIR has proven its ability to deliver clinical applications using a Patient-Centric perspective. The US Department for the Administration of Children and Families (ACF) has developed FHIR-based systems based on this.

ACF and other federal and state agencies are using FHIR-based systems to assist in delivering better outcomes for their populations by addressing SD factors with appropriate and qualified human and social services. These organizations have found that FHIR can be difficult to provide solutions when working with individuals who need social services as well as working with organizations who provide social services that can improve health outcomes but are not healthcare systems.

The project objective is to reduce the barriers faced in effectively and efficiently delivering FHIR-based systems that incorporate social services and social determinants to improve health outcomes. A secondary objective is to increase the scope and membership of the HL7 community in their use of the FHIR standard.

 
## SCOPE CONSIDERATIONS
Enhancing FHIR for Social Services is not meant to be a complete social services closed loop referral process standard. 
There is lots of work already being done and to be done to provide such a complete standard but it is beyond the scope of this IG.
This IG will be complementary to such follow on work.
