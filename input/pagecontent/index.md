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