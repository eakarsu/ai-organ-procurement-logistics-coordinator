export interface PageConfig {
  label: string;
  href: string;
  description: string;
  entities: string[];
  workflows: string[];
}

export interface EntityConfig {
  name: string;
  label: string;
  fields: Array<{ name: string; kind: "string" | "number" | "boolean" | "date" }>;
}

export interface WorkflowConfig {
  slug: string;
  title: string;
  description: string;
  prompt: string;
  fields: string[];
}

export const appConfig = {
  "slug": "ai-organ-procurement-logistics-coordinator",
  "title": "Organ Procurement Logistics Coordinator",
  "tagline": "Coordinate recovery teams, transport milestones, container telemetry and handoff receipts around externally authorized allocations.",
  "accent": "rose"
};
export const pages: PageConfig[] = [
  {
    "label": "Intake & registers",
    "href": "/registers",
    "description": "Coordinate recovery teams, transport milestones, container telemetry and handoff receipts around externally authorized allocations.",
    "entities": [
      "ProcurementCase",
      "RecoveryTeam",
      "AuthorizedShipment"
    ],
    "workflows": [
      "authorized-logistics-brief",
      "transport-conflict-review"
    ]
  },
  {
    "label": "Operational records",
    "href": "/workflow",
    "description": "Coordinate recovery teams, transport milestones, container telemetry and handoff receipts around externally authorized allocations.",
    "entities": [
      "Container",
      "ShipmentContainer",
      "TransportLeg"
    ],
    "workflows": [
      "container-evidence-summary",
      "handoff-chronology"
    ]
  },
  {
    "label": "Review & delivery",
    "href": "/delivery",
    "description": "Coordinate recovery teams, transport milestones, container telemetry and handoff receipts around externally authorized allocations.",
    "entities": [
      "TelemetryObservation",
      "ProcurementHandoff",
      "LogisticsIncident"
    ],
    "workflows": [
      "delay-escalation-draft",
      "case-closeout-narrative"
    ]
  },
  {
    "label": "Tasks & requirements",
    "href": "/operations",
    "description": "Assignments, versioned rules and document requirements.",
    "entities": [
      "OperationalTask",
      "RuleVersion",
      "DocumentRequirement"
    ],
    "workflows": [
      "evidence-completeness-review",
      "operations-handoff-draft"
    ]
  }
];
export const entities: Record<string, EntityConfig> = {
  "ProcurementCase": {
    "name": "ProcurementCase",
    "label": "Procurement Case",
    "fields": [
      {
        "name": "name",
        "kind": "string"
      },
      {
        "name": "caseNumber",
        "kind": "string"
      },
      {
        "name": "coordinator",
        "kind": "string"
      },
      {
        "name": "allocationAuthority",
        "kind": "string"
      },
      {
        "name": "authorizationReference",
        "kind": "string"
      },
      {
        "name": "openedAt",
        "kind": "date"
      },
      {
        "name": "status",
        "kind": "string"
      }
    ]
  },
  "RecoveryTeam": {
    "name": "RecoveryTeam",
    "label": "Recovery Team",
    "fields": [
      {
        "name": "name",
        "kind": "string"
      },
      {
        "name": "organization",
        "kind": "string"
      },
      {
        "name": "lead",
        "kind": "string"
      },
      {
        "name": "contact",
        "kind": "string"
      },
      {
        "name": "availabilityAt",
        "kind": "date"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "procurementCaseId",
        "kind": "string"
      }
    ]
  },
  "AuthorizedShipment": {
    "name": "AuthorizedShipment",
    "label": "Authorized Shipment",
    "fields": [
      {
        "name": "name",
        "kind": "string"
      },
      {
        "name": "shipmentNumber",
        "kind": "string"
      },
      {
        "name": "authorizationReference",
        "kind": "string"
      },
      {
        "name": "recoveryAt",
        "kind": "date"
      },
      {
        "name": "destination",
        "kind": "string"
      },
      {
        "name": "deadlineAt",
        "kind": "date"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "procurementCaseId",
        "kind": "string"
      }
    ]
  },
  "Container": {
    "name": "Container",
    "label": "Container",
    "fields": [
      {
        "name": "name",
        "kind": "string"
      },
      {
        "name": "containerNumber",
        "kind": "string"
      },
      {
        "name": "deviceNumber",
        "kind": "string"
      },
      {
        "name": "sealedAt",
        "kind": "date"
      },
      {
        "name": "sealReference",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "procurementCaseId",
        "kind": "string"
      }
    ]
  },
  "ShipmentContainer": {
    "name": "ShipmentContainer",
    "label": "Shipment Container",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "authorizedShipmentId",
        "kind": "string"
      },
      {
        "name": "containerId",
        "kind": "string"
      },
      {
        "name": "packedAt",
        "kind": "date"
      },
      {
        "name": "packer",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "procurementCaseId",
        "kind": "string"
      }
    ]
  },
  "TransportLeg": {
    "name": "TransportLeg",
    "label": "Transport Leg",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "authorizedShipmentId",
        "kind": "string"
      },
      {
        "name": "carrier",
        "kind": "string"
      },
      {
        "name": "origin",
        "kind": "string"
      },
      {
        "name": "destination",
        "kind": "string"
      },
      {
        "name": "departureAt",
        "kind": "date"
      },
      {
        "name": "arrivalAt",
        "kind": "date"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "procurementCaseId",
        "kind": "string"
      }
    ]
  },
  "TelemetryObservation": {
    "name": "TelemetryObservation",
    "label": "Telemetry Observation",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "containerId",
        "kind": "string"
      },
      {
        "name": "observedAt",
        "kind": "date"
      },
      {
        "name": "temperatureC",
        "kind": "number"
      },
      {
        "name": "location",
        "kind": "string"
      },
      {
        "name": "source",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "procurementCaseId",
        "kind": "string"
      }
    ]
  },
  "ProcurementHandoff": {
    "name": "ProcurementHandoff",
    "label": "Procurement Handoff",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "authorizedShipmentId",
        "kind": "string"
      },
      {
        "name": "handedAt",
        "kind": "date"
      },
      {
        "name": "sender",
        "kind": "string"
      },
      {
        "name": "receiver",
        "kind": "string"
      },
      {
        "name": "receipt",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "procurementCaseId",
        "kind": "string"
      }
    ]
  },
  "LogisticsIncident": {
    "name": "LogisticsIncident",
    "label": "Logistics Incident",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "authorizedShipmentId",
        "kind": "string"
      },
      {
        "name": "occurredAt",
        "kind": "date"
      },
      {
        "name": "issue",
        "kind": "string"
      },
      {
        "name": "response",
        "kind": "string"
      },
      {
        "name": "owner",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "procurementCaseId",
        "kind": "string"
      }
    ]
  },
  "OperationalTask": {
    "name": "OperationalTask",
    "label": "Operational Task",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "owner",
        "kind": "string"
      },
      {
        "name": "priority",
        "kind": "string"
      },
      {
        "name": "startAt",
        "kind": "date"
      },
      {
        "name": "dueAt",
        "kind": "date"
      },
      {
        "name": "done",
        "kind": "boolean"
      },
      {
        "name": "notes",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "procurementCaseId",
        "kind": "string"
      }
    ]
  },
  "RuleVersion": {
    "name": "RuleVersion",
    "label": "Rule Version",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "jurisdiction",
        "kind": "string"
      },
      {
        "name": "version",
        "kind": "string"
      },
      {
        "name": "effectiveAt",
        "kind": "date"
      },
      {
        "name": "expiresAt",
        "kind": "date"
      },
      {
        "name": "sourceUrl",
        "kind": "string"
      },
      {
        "name": "requirementText",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "procurementCaseId",
        "kind": "string"
      }
    ]
  },
  "DocumentRequirement": {
    "name": "DocumentRequirement",
    "label": "Document Requirement",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "category",
        "kind": "string"
      },
      {
        "name": "requiredBy",
        "kind": "date"
      },
      {
        "name": "sourceReference",
        "kind": "string"
      },
      {
        "name": "evidenceReference",
        "kind": "string"
      },
      {
        "name": "reviewNotes",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "procurementCaseId",
        "kind": "string"
      }
    ]
  }
};
export const workflows: WorkflowConfig[] = [
  {
    "slug": "authorized-logistics-brief",
    "title": "Authorized logistics brief",
    "description": "Authorized logistics brief using selected procurement case records and supplied evidence.",
    "prompt": "Authorized logistics brief for Organ Procurement Logistics Coordinator. Operational scope: Coordinate recovery teams, transport milestones, container telemetry and handoff receipts around externally authorized allocations. Specific AI scope: Summarize handoffs and highlight logistics delays; never select recipients or authorize clinical allocation. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "transport-conflict-review",
    "title": "Transport conflict review",
    "description": "Transport conflict review using selected procurement case records and supplied evidence.",
    "prompt": "Transport conflict review for Organ Procurement Logistics Coordinator. Operational scope: Coordinate recovery teams, transport milestones, container telemetry and handoff receipts around externally authorized allocations. Specific AI scope: Summarize handoffs and highlight logistics delays; never select recipients or authorize clinical allocation. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "container-evidence-summary",
    "title": "Container evidence summary",
    "description": "Container evidence summary using selected procurement case records and supplied evidence.",
    "prompt": "Container evidence summary for Organ Procurement Logistics Coordinator. Operational scope: Coordinate recovery teams, transport milestones, container telemetry and handoff receipts around externally authorized allocations. Specific AI scope: Summarize handoffs and highlight logistics delays; never select recipients or authorize clinical allocation. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "handoff-chronology",
    "title": "Handoff chronology",
    "description": "Handoff chronology using selected procurement case records and supplied evidence.",
    "prompt": "Handoff chronology for Organ Procurement Logistics Coordinator. Operational scope: Coordinate recovery teams, transport milestones, container telemetry and handoff receipts around externally authorized allocations. Specific AI scope: Summarize handoffs and highlight logistics delays; never select recipients or authorize clinical allocation. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "delay-escalation-draft",
    "title": "Delay escalation draft",
    "description": "Delay escalation draft using selected procurement case records and supplied evidence.",
    "prompt": "Delay escalation draft for Organ Procurement Logistics Coordinator. Operational scope: Coordinate recovery teams, transport milestones, container telemetry and handoff receipts around externally authorized allocations. Specific AI scope: Summarize handoffs and highlight logistics delays; never select recipients or authorize clinical allocation. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "case-closeout-narrative",
    "title": "Case closeout narrative",
    "description": "Case closeout narrative using selected procurement case records and supplied evidence.",
    "prompt": "Case closeout narrative for Organ Procurement Logistics Coordinator. Operational scope: Coordinate recovery teams, transport milestones, container telemetry and handoff receipts around externally authorized allocations. Specific AI scope: Summarize handoffs and highlight logistics delays; never select recipients or authorize clinical allocation. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "evidence-completeness-review",
    "title": "Evidence completeness review",
    "description": "Evidence completeness review using selected procurement case records and supplied evidence.",
    "prompt": "Evidence completeness review for Organ Procurement Logistics Coordinator. Operational scope: Coordinate recovery teams, transport milestones, container telemetry and handoff receipts around externally authorized allocations. Specific AI scope: Summarize handoffs and highlight logistics delays; never select recipients or authorize clinical allocation. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "operations-handoff-draft",
    "title": "Operations handoff draft",
    "description": "Operations handoff draft using selected procurement case records and supplied evidence.",
    "prompt": "Operations handoff draft for Organ Procurement Logistics Coordinator. Operational scope: Coordinate recovery teams, transport milestones, container telemetry and handoff receipts around externally authorized allocations. Specific AI scope: Summarize handoffs and highlight logistics delays; never select recipients or authorize clinical allocation. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  }
];
export function findPage(href:string){return pages.find(p=>p.href===href);}
