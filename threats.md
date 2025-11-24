# Threat Model

Concise threat model to inform architectural decisions and code reviews. Focus on product-level threats; service-specific threats to be documented separately.

## Threat Actors

- Cloud infrastructure providers (Cloudflare, AWS, etc.).
- State actors conducting mass surveillance.
- Malicious insiders at cloud providers.
- External attackers compromising cloud infrastructure.
- Unauthorised users attempting to access others' data.

## Threats

### Cloud Providers

- Data breaches exposing encrypted user data at rest.
- Unauthorised access to user data through infrastructure compromise.
- Logging or monitoring of API calls revealing usage patterns.
- Malicious modification of code or configuration.

### Mass Surveillance

- Network traffic interception and analysis.
- Metadata collection (connection times, frequencies, peer relationships).
- Correlation attacks linking pseudonymous identities to real users.
- Compelled disclosure of encrypted data for offline cryptanalysis.

### Cryptographic

- Weak or compromised key generation.
- Key material theft from persistent storage.
- MLS group key compromise affecting message confidentiality.
- Downgrade attacks forcing use of weaker cryptographic primitives.
- Man-in-the-middle attacks during key exchange.

### Identity & Access

- Unauthorised client registration or impersonation.
- Stolen credentials or key material enabling unauthorised access.
- Privilege escalation through policy bypass.
- Sybil attacks creating multiple identities to compromise system integrity.

### Data Integrity

- Tampering with encrypted data to cause application failures or data corruption.
- CRDT conflict manipulation to achieve unintended state.
- Message replay or reordering attacks.
- Deletion or corruption of encrypted backups.

### Availability

- Resource exhaustion through excessive storage or compute usage.
- Denial of service through P2P broker flooding.
- Cost-based DoS exploiting serverless billing models.

### Privacy & Metadata

- Traffic analysis revealing user behaviour patterns.
- Timing attacks correlating user activities.
- User fingerprinting through connection characteristics.
- Inference of social graphs from communication patterns.

## Out of Scope

- Physical attacks on user devices.
- Social engineering and phishing.
- Client-side vulnerabilities (OS, browser, application bugs).
- Supply chain attacks on dependencies (covered by separate process).
- Regulatory compliance (GDPR, etc.).
