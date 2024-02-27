FHIR Realization Model is the core recommendations to enable enhancements for FHIR Core using current FHIR constructs and extensions.

FHIR Group
Represents a defined collection of entities that may be discussed or acted upon collectively but which are not expected to act collectively, and are not formally or legally recognized; i.e. a collection of entities that isn't an Organization.

The Group resource is used in one of two ways:

To define a group of specific people, animals, devices, etc. that is being tracked, examined or otherwise referenced as part of healthcare-related activities
To define a set of possible people, animals, devices, etc. that are of interest for some intended future healthcare-related activities

What is missing from Group - The requirements to provide rich associations and memberships

Life Set as a group
Life Set as a group consists of two extensions - subject and association

Screening Set as a group
Screening Set as a group consists of one extensions - membership

Individual as a Role
This is a new FHIR resource providing the ability to leverage fhir person an individual based context as a first class instance.
