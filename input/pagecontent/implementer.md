This Guide is balloted as Informational. This was selected because the Project Team wanted to present guidelines that will lead to the capability to employ FHIR to address requirements in the Social Services Domain that can be quite different than clinical domains. As HL7 has a long history of both innovation and value to the healthcare community, extending the FHIR platform enables an entirely new dimension for addressing social needs and risks and delivering and measuring Social Services. Efforts of this and many other efforts in the FHIR community will expand the FHIR community and provide the avenue to deliver better outcomes for everyone.

Some organizations, for a myriad of important reasons, may not choose to provide FHIR solutions for the Social Services Domains. That is understood and respected. A facet of this Implementation Guidance is the use of the FHIR Capability Statement.  This enables FHIR solutions to declare if they support the functional capabilities provided in this and future work.  As part of this declaration, it is important to restate that this Guide is to enable FHIR to address Social Services and if that is not part of the scope of a FHIR solution, this guidance should have no impact on other FHIR solutions.

Implementation Guidance was developed using the criteria of 1) backward compatibility with the FHIR R4 model, 2) reducing the barriers faced in effectively and efficiently delivering FHIR-based systems that incorporate social services and social determinants to improve health outcomes, and 3) complement and enhance the SDOH CC IG. 

Specific functional capabilities  that influenced the Implementation Guidance were:

**The ability of a FHIR System to provide a view of Whole Person Care. This starts with the ability to identify social needs or risks and to track and measure the success of the Social Service provided.**    

**The need to operate on executable relationships between individuals and between individuals and organizations and legal authorities.**  

**The Program System's functional requirements for determining membership eligibility and enrollment in a specific Social Program.**  

**The ability of actors using the FHIR System and the actors using the Program System to communicate terms and concepts as clearly as semantically possible.**  

**The ability to exchange information between an FHIR System and a Program System that is not FHIR compliant.**  

## Guidance
Given the above, the following is this Guide’s guidance.  

_Insert Diagram of FHIR Model_  

In the above, there are new proposed FHIR Resources:  

**LifeSet Resource:** The LifeSet Resource provides the ability to define and operate on associations between individuals, between individuals and organizations and between individuals and governing authorities.  Making this ability a first-class citizen is critical in multiple ways, ranging from understanding relationships to  

**ScreeningSet Resource:** A collection of individuals or cohort in Social Services is not dynamic. It factors influencing this dynamic is both context and temporal. The context itself has several different factors. For example, delivering a Social Service for a household may have eligibility requirements for the individuals as well as the relationships between individuals may change (death, marriage).  

**Individual Record:** To receive social services benefits, a person is not required to be a Patient. In the LifeSet Resource, the subjects are the same as the subject of the Individual resource. This resource is provided because Patient Resource …..  
 
**Legal Authority:** the relationship to an individual to a Legal Authority is critical to understanding eligibility for Social Services, and potential social and community organizations that are or can be part of the individual or group support system. Examples are whether is the status of an individual as a US citizen or status as a member of an Indigenous Nation.  

**To be added:**  
Modifications to existing SDOC CC IG profiles: Group ( we should look at parameterized Profiles), all SDOH profiles that have an subject need to have a Reference to PersonRole / Individual), others tbd

### Logical Model for Social Services (EFSS)


<figure>
{%include efssls.svg%}
<figcaption><b>Figure 1: Logical Model for Enhancing FHIR for Life Set</b></figcaption>
</figure>
<br clear="all" />

<figure>
{%include efssss.svg%}
<figcaption><b>Figure 1: Logical Model for Enhancing FHIR for Screening Set</b></figcaption>
</figure>
<br clear="all" />
