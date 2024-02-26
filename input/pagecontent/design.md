# Background
To formulate Implementation Guidance,  two different FHIR Models were compared. One was a model from the SDOH CC IG. For the other, a Social Services Domain Analysis Model (SS DAM) was developed. A FHIR Server was created for these two models, populated with the persona data in the Use Cases, and FHIR endpoints were implemented and made available on a public site (need link) and at Connectathons. Both approaches were tested and evaluated.  

In addition to the Use Cases driving the persona data, two different data payloads were developed for each Use Case. One payload documents what the FHIR System would send to a Program System to provide sufficient data to describe the Social Service Condition as well as data the would help the Program System determine eligibility for a service that would fulfill the need.  The second payload documents what the Program System would send to the FHIR system about the data about the service provided and to members that will be serviced. This information was used to comparing the two different FHIR Models. 
# SDOH CC IG Model
Two different designs for the FHIR model were considered as FHIR provides the ability to have instances of an individual populated in different FHIR resources. The two Resources considered were populating both the Patient Resource and the Related Person Resource. 
## Model using the Patient Resource and RelatedPerson Resource
The first design created used a singular FHIR Patient Resources and FHIR RelatedPerson Resources for all the other personas in the Use Cases. Additional SDOH Profiles of SDOH Goal, SDOH Condition, SDOH Group, SDOH Healthcare Service,  and SDOH Location were also populated based on the Use Cases.  

This approach was never fully implemented and tested. Reasons as to why this approach was abandoned are the following:
* Only Patients can be members of an SDOH Group. A member of the SDOH Group cannot be a RelatedPerson.
* The Related Person resource must and can only reference one Patient Resource. In some of the use cases, multiple personas could be Patient. In this situation,  duplicate RelatedPerson resources would have to be created for the same individual having relationships to multiple Patients. For example, if the mother is a patient and the grandmother, husband, and daughter are Related Persons, then if the father is a Patient, the grandmother and daughter will require duplicate instances of their instance of the  RelatedPerson Resource.

## Model using only the Patient Resource
The second FHIR Model evaluated was a design where all individuals of the Use Cases were populated in the Patient Resource. This model was implemented and evaluated.  

The issue encountered with this approach was there was no effective way to capture or discover interpersonal relationships. For example, relationships such as grandmother/granddaughter or guardian/ward either are difficult to capture, discover, and display. Developing processes to compute on these relationships is difficult at best.  

For this model, capturing interpersonal relationships the pattern deployed was, in the Patient Resource, to use the contact backbone property and within that to use the relationship attribute.  (NEED More DETAILED REASONS WHY THIS IS PROBLEMATIC)

## Model using the SS DAM
The second model implemented, tested, and evaluated was a FHIR implementation derived from a Social Services Domain Analysis Logical Model. This model can be thought of as a “greenfield” model as it was not constrained the SDOH CC IG or the FHIR 4.0.1 Release.  

The following were considerations in the SS DAM.
* An individual does not have to be patient to be a member of a group such as a family, household, or tribe.
* As the social service provided to meet a social need may have originated and even delivered first in a Program System, it should not be assumed that this system has the concept of a patient within their domain model.
* Determining the membership in a specific group is both contextual and temporal. Given a set of potential enrollees, the enrollees in a household for a specific housing insecurity program may be different from the enrollees for a different housing insecurity program. A temporal example is that the definition of a specific type of family may change over time based on births, deaths, marriage, divorce or other factors. 
* The eligibility and enrollment of a group receiving social services is determined by the actors using the Program System, As a program system functional capability is assumed not to be a healthcare system, it is assumed that the Program System is not HIPPA Compliant.
* Making personal relationships between individuals discoverable and executable is an important functional capability in Social Services Domains. Relationships include personal relationships (mother, children, live together), relationships between an individual and an organization (religious/spiritual, employment, community organization), and between an individual and a legal authority (US citizen, Tribal Nation, Prison).
* Personal relationships are also important in understanding the availability of care resources that can be available to help an individual or a group in which that individual is a member. This support team expands beyond the care team to assist in addressing social needs and risks factors.

The SS DAM Logic model is:  
INSERT LOGICAL MODEL FROM BALLOT BUILD IMPLEMENTOR CONSIDERATIONS  
PROVIDE AN INTEGRATED VIEW THE TWO FIGURES  
FOR READABILITY WE MAY WANT TO HAVE A CONCEPTUAL MODEL AND REFERENCE THE LOGICAL MODEL DETAILS FOR EACH CLASS  IN THE ARTIFACTS SECTION  

# What is a Family ?
# Family 

A family is a group of individuals who are related by blood, marriage, adoption, or a shared sense of bond. Families typically form the basic social unit in human societies and serve as a primary context for the upbringing and socialization of children. The structure and dynamics of families can vary widely across cultures and societies, but they often involve emotional connections, mutual support, and shared responsibilities among its members. Families can include parents, children, siblings, grandparents, aunts, uncles, and other relatives, and they play a crucial role in shaping the values, beliefs, and identity of individuals. Additionally, the concept of family can extend beyond biological or legal relationships to include chosen or adopted family members and close-knit social groups.

# Nuclear Family

A nuclear family, also known as an elementary or conjugal family, is a family unit consisting of two parents (a mother and a father) and their biological or adopted children living together in a single household. This family structure is often contrasted with extended families, which may include additional relatives such as grandparents, aunts, uncles, and cousins living together or in close proximity. The nuclear family is considered a relatively small and self-contained social unit, and it has been a prevalent family structure in many Western societies. However, family structures can vary across cultures and societies, and there is no universally dominant family model.

# HUD Family Perspective

The U.S. Department of Housing and Urban Development (HUD) defines a family in the context of housing programs. According to HUD, a family is defined as:

"One or more individuals who are related by blood, marriage, adoption, or who are otherwise defined as a family in accordance with the regulations of the applicable HUD program for which assistance is provided. The term includes a single person who is not an elderly person, near-elderly person, or displaced person, or a person with disabilities, but who is determined to be a family under the program regulations by the recipient or subrecipient."

**It's important to note that the specific definition may vary depending on the particular housing program administered by HUD. This definition is from a broad perspective and is used for various HUD programs to determine eligibility for housing assistance.**

# HUD Programs

 The U.S. Department of Housing and Urban Development (HUD) administers a variety of programs aimed at providing housing assistance and promoting affordable housing. Some of the key HUD programs include:

**Public Housing:** Provides affordable rental housing for eligible low-income families, the elderly, and persons with disabilities. Public housing comes in the form of developments owned and operated by public housing agencies (PHAs).

Section 8 Housing Choice Voucher Program: Assists eligible low-income individuals and families in renting safe, decent, and affordable housing in the private market. Participants receive a voucher that subsidizes their rent, with the tenant typically paying 30% of their income toward rent.

Community Development Block Grant (CDBG): Provides communities with resources for a wide range of community development activities, including affordable housing, infrastructure development, and economic development.

HOME Investment Partnerships Program: Offers block grants to state and local governments to fund affordable housing projects, including rental housing, homebuyer assistance, and rehabilitation of existing housing.

Housing Opportunities for Persons with AIDS (HOPWA): Provides assistance to communities for the housing needs of low-income persons living with HIV/AIDS and their families.

Federal Housing Administration (FHA): Insures mortgages to help individuals, particularly first-time homebuyers, obtain financing for homeownership.

Veterans Affairs Supportive Housing (VASH): Combines HUD housing vouchers with VA supportive services to help homeless veterans and their families find and sustain permanent housing.

Healthy Homes and Lead Hazard Control Programs: Aimed at creating and maintaining safe and healthy housing, addressing issues such as lead-based paint hazards.

Emergency Solutions Grants (ESG): Provides funding to address the needs of individuals and families who are homeless or at risk of homelessness.

Choice Neighborhoods Initiative: Focuses on the transformation of distressed neighborhoods by investing in housing, schools, and other community assets.

These programs play a crucial role in addressing various housing needs and challenges, promoting fair housing practices, and improving the overall quality of housing in the United States. Keep in mind that the availability and details of these programs may change over time, and individuals interested in these programs should check with local HUD offices or authorized agencies for the most up-to-date information.


#  Section 8 Housing Choice Voucher Program 
The Section 8 Housing Choice Voucher Program is designed to assist low-income individuals and families in obtaining safe and decent housing in the private market. The program is administered by local public housing agencies (PHAs) and is funded by the U.S. Department of Housing and Urban Development (HUD). Here are some key points about families eligible for the Section 8 Housing Choice Voucher Program:

Low-Income Requirement: The program is targeted at households with incomes that are below a certain threshold, typically set at 50% of the median income for the area. However, preferences may be given to households with even lower incomes.

Family Composition: A family, as defined by the program, can include individuals, families with children, elderly households, and persons with disabilities. **The family composition is determined by the members who will be living together in the assisted unit.**

Citizenship or Eligible Immigration Status: Families must include at least one U.S. citizen or eligible non-citizen. Non-citizens must have eligible immigration status.

Application and Waiting List: Interested families must apply for the program through their local PHA. Due to high demand and limited funding, there is often a waiting list. The waiting time can vary, and families are selected from the waiting list based on factors such as preferences and priorities set by the PHA.

Voucher Use: Once a family receives a housing choice voucher, they can use it to rent a privately owned housing unit of their choice, provided it meets the program's requirements for safety and affordability. The voucher subsidizes a portion of the rent, and the family typically pays 30% of their adjusted income toward rent.

Annual Reexamination: The family's eligibility and the amount of assistance are reassessed annually by the PHA. Changes in income, family composition, or other circumstances may affect the level of assistance.

It's important to note that specific eligibility criteria and program details may vary by locality, as PHAs have some flexibility in administering the program within the federal guidelines. Families interested in the Section 8 Housing Choice Voucher Program should contact their local PHA for the most accurate and up-to-date information based on their specific area.


# Group
An organization is a group of individuals working together towards common goals and objectives. It can take various forms, such as a business, non-profit, government agency, or any structured entity where people collaborate to achieve specific purposes. Organizations typically have defined roles, responsibilities, and a hierarchical structure to facilitate coordination and efficiency in pursuing their missions or activities.


# Legal jurisdiction
Legal jurisdiction refers to the authority or power of a legal entity, such as a court or government, to make and enforce laws within a specific geographical area or over certain individuals or entities. It defines the scope of the legal system's control and influence. Jurisdiction can be based on factors such as territory, subject matter, or the individuals involved. Different levels of government, both within a country and internationally, may have distinct jurisdictions. Understanding jurisdiction is crucial in determining which laws apply to a particular situation and which legal authorities have the right to adjudicate or enforce those laws.
