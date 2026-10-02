# Organ Procurement Logistics Coordinator

Coordinate recovery teams, transport milestones, container telemetry and handoff receipts around externally authorized allocations.

## Implemented records

- **Procurement Case**: name, case Number, coordinator, allocation Authority, authorization Reference, opened At, status.
- **Recovery Team**: name, organization, lead, contact, availability At, status.
- **Authorized Shipment**: name, shipment Number, authorization Reference, recovery At, destination, deadline At, status.
- **Container**: name, container Number, device Number, sealed At, seal Reference, status.
- **Shipment Container**: title, packed At, packer, status.
- **Transport Leg**: title, carrier, origin, destination, departure At, arrival At, status.
- **Telemetry Observation**: title, observed At, temperature C, location, source, status.
- **Procurement Handoff**: title, handed At, sender, receiver, receipt, status.
- **Logistics Incident**: title, occurred At, issue, response, owner, status.
- **Operational Task**: title, owner, priority, start At, due At, done, notes, status.
- **Rule Version**: title, jurisdiction, version, effective At, expires At, source Url, requirement Text, status.
- **Document Requirement**: title, category, required By, source Reference, evidence Reference, review Notes, status.

## AI workflows

- Authorized logistics brief: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.
- Transport conflict review: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.
- Container evidence summary: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.
- Handoff chronology: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.
- Delay escalation draft: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.
- Case closeout narrative: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.
- Evidence completeness review: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.
- Operations handoff draft: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.

## Calculations

- Procurement transport timeline: Validate chronological transport legs and compute buffer to the externally established deadline; no recipient allocation.
- Procurement Case evidence checklist: Check source presence against an explicitly supplied document list; reviewer assesses adequacy.
- Operational deadline queue: Compute overdue items from entered dates and completed flags; no external notifications.

## Workspace features

Role-based login and account management; validated create/edit/delete; required parent and sibling relationships; search and pagination; atomic JSON imports; CSV/JSON exports; optimistic concurrency; two independent human reviews; immutable source-text uploads with independent review; dated task calendar; aggregate reports; searchable audit trail; model catalog and administrator AI settings; configured HTTPS connectors with approval, idempotency and receipt checks.

## Integration boundaries

A finite working scope, not every conceivable feature. No production regulator, insurer, carrier, court, university or clinical integration is preconfigured. Source uploads support text/CSV/JSON/Markdown, not OCR/PDF parsing. AI produces drafts and cannot authorize clinical handling, adjudicate rights, select recipients or jurors, establish eligibility, certify regulatory compliance or send submissions. Live external execution requires a configured adapter and independent human approval of the current record. Calculations use supplied rules and units; example rules are fictional.
