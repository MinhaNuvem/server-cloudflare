# Nuvem Messaging Service

MLS Delivery Service.

Can send messages to local clients, webhooks, SNS topics, etc.

## MLS Delivery Service

### Directory subservice

Stores and provides the initial keying material for clients.

Clients upload KeyPackage on demand, and bound to a specific recipient, unlike protocols like Signal where the equivalent is uploaded pre-emptively. No "last resort" keys used.

### Routing subservice

Routes messages to the appropriate MLS group based on the recipient's MLS ID.
