# Nuvem

Cloud-agnostic, server-side services for local-first apps using a zero-knowledge architecture.

## Use Cases

Any app used by individuals or households, whose data should be in the cloud for convenience and potentially accessible to select people/systems, but inaccessible to third parties. For example:

- Photo and video managers (a la Google Photos).
- Password managers.
- Task managers.
- Calendar managers.
- Chat apps.
- In-app incremental and/or snapshot backups (a la Google Drive backups, used by WhatsApp).

## Concepts

- *Environments*, analogous to AWS accounts and GCP projects. However, multiple environments could share the same AWS account, GCP project, etc.
- *Stacks*, analogous to those from CloudFormation and Pulumi.
- Resources, analogous to those from AWS and Terraform.
- Services, analogous to those from AWS.

## Reference Implementation

- Underlying services are serverless (scale to zero).
- Built on AWS or Cloudflare (TBD).

## Services

### IAM

[IAM service spec](./specs/01-iam.md).

### Messaging

[Messaging service spec](./specs/02-messaging.md).

### Document Repository

CRDT-based DB

- CRDTs:
  - [Explanation](https://unzip.dev/0x018-crdts/).
  - [Automerge](https://automerge.org/) (popular implementation).

### Blob Repository

Object store a la S3.

### P2P Broker

Two separate HTTP-based, serverless sub-services:

- An alternative to STUN servers (no data relay or proxy).
- An alternative to TURN servers (i.e. data relay or proxy) using WebSockets.

Architecture:

- AWS: Lambda + API Gateway + DynamoDB.
- Cloudflare: Workers + Durable Objects.
- GCP: Cloud Run Functions + [Firestore real-time updates](https://cloud.google.com/firestore/docs/query-data/listen).

**TURN alternative not recommended for loss-tolerant apps like calls because of WebSockets use.**

### Mutex

## Other considerations

- Federation across environments, leveraging IAM and OIDC.
