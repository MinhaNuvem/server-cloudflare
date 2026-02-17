# Nuvem IAM Service

- Clients. Each has its own long-lived IAM identity, and zero-to-many MLS clients.
- Users. Each user has zero or more clients, with which they access the services. Can't have human-friendly names for privacy reasons.
- Roles. Each role can be assigned to zero or more users.
- Policies. Describe what roles are allowed to do with the resources. Can't be attached to clients. Could use Cedar policy language.

## MLS Authentication Service

- X.509 certificates as credentials.
- Well-known endpoint `nuvem-mls-id` to get MLS id CAs, so that clients can authenticate each other. This will enable federation.
