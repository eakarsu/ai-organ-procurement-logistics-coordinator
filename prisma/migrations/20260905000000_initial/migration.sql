-- CreateEnum
CREATE TYPE "Role" AS ENUM ('ADMIN', 'MANAGER', 'ANALYST');

-- CreateTable
CREATE TABLE "User" (
    "active" BOOLEAN NOT NULL DEFAULT true,
    "id" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "passwordHash" TEXT NOT NULL,
    "role" "Role" NOT NULL DEFAULT 'ANALYST',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AuditLog" (
    "id" TEXT NOT NULL,
    "actorId" TEXT,
    "actorName" TEXT,
    "action" TEXT NOT NULL,
    "entity" TEXT NOT NULL,
    "entityId" TEXT,
    "detail" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "AuditLog_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "WorkflowAnalysis" (
    "id" TEXT NOT NULL,
    "actorId" TEXT NOT NULL,
    "workflow" TEXT NOT NULL,
    "subjectEntity" TEXT NOT NULL,
    "subjectId" TEXT NOT NULL,
    "input" JSONB NOT NULL,
    "evidence" JSONB NOT NULL,
    "evidenceHash" TEXT NOT NULL,
    "result" JSONB NOT NULL,
    "model" TEXT NOT NULL,
    "receipt" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "WorkflowAnalysis_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RecordReview" (
    "id" TEXT NOT NULL,
    "actorId" TEXT NOT NULL,
    "entity" TEXT NOT NULL,
    "entityId" TEXT NOT NULL,
    "version" TEXT NOT NULL,
    "reason" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "RecordReview_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "UsageBucket" (
    "id" TEXT NOT NULL,
    "calls" INTEGER NOT NULL,

    CONSTRAINT "UsageBucket_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "IssuedCredential" (
    "token" TEXT NOT NULL,
    "entity" TEXT NOT NULL,
    "entityId" TEXT NOT NULL,
    "version" TEXT NOT NULL,
    "assertion" JSONB NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "revokedAt" TIMESTAMP(3),

    CONSTRAINT "IssuedCredential_pkey" PRIMARY KEY ("token")
);

-- CreateTable
CREATE TABLE "DomainArtifact" (
    "id" TEXT NOT NULL,
    "subjectEntity" TEXT NOT NULL,
    "subjectId" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "content" TEXT NOT NULL,
    "contentHash" TEXT NOT NULL,
    "actorId" TEXT NOT NULL,
    "approvedBy" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "DomainArtifact_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RecordApproval" (
    "id" TEXT NOT NULL,
    "version" TEXT NOT NULL,

    CONSTRAINT "RecordApproval_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DomainExecution" (
    "id" TEXT NOT NULL,
    "actorId" TEXT NOT NULL,
    "connectorId" TEXT NOT NULL,
    "action" TEXT NOT NULL,
    "subjectEntity" TEXT NOT NULL,
    "subjectId" TEXT NOT NULL,
    "version" TEXT NOT NULL,
    "status" TEXT NOT NULL,
    "result" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "DomainExecution_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "WorkSession" (
    "id" TEXT NOT NULL,
    "actorId" TEXT NOT NULL,
    "respondentId" TEXT NOT NULL,
    "subjectEntity" TEXT NOT NULL,
    "subjectId" TEXT NOT NULL,
    "questions" JSONB NOT NULL,
    "answers" JSONB NOT NULL,
    "currentQuestion" TEXT,
    "status" TEXT NOT NULL,
    "deadline" TIMESTAMP(3) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "WorkSession_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SessionMedia" (
    "id" TEXT NOT NULL,
    "sessionId" TEXT NOT NULL,
    "questionId" TEXT NOT NULL,
    "actorId" TEXT NOT NULL,
    "contentType" TEXT NOT NULL,
    "bytes" BYTEA NOT NULL,
    "contentHash" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "SessionMedia_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AppSetting" (
    "id" TEXT NOT NULL,
    "value" JSONB NOT NULL,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "AppSetting_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ProcurementCase" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "caseNumber" TEXT NOT NULL,
    "coordinator" TEXT NOT NULL,
    "allocationAuthority" TEXT NOT NULL,
    "authorizationReference" TEXT NOT NULL,
    "openedAt" TIMESTAMP(3) NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ProcurementCase_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RecoveryTeam" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "organization" TEXT NOT NULL,
    "lead" TEXT NOT NULL,
    "contact" TEXT NOT NULL,
    "availabilityAt" TIMESTAMP(3) NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "procurementCaseId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "RecoveryTeam_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AuthorizedShipment" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "shipmentNumber" TEXT NOT NULL,
    "authorizationReference" TEXT NOT NULL,
    "recoveryAt" TIMESTAMP(3) NOT NULL,
    "destination" TEXT NOT NULL,
    "deadlineAt" TIMESTAMP(3) NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "procurementCaseId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "AuthorizedShipment_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Container" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "containerNumber" TEXT NOT NULL,
    "deviceNumber" TEXT NOT NULL,
    "sealedAt" TIMESTAMP(3) NOT NULL,
    "sealReference" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "procurementCaseId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Container_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ShipmentContainer" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "authorizedShipmentId" TEXT NOT NULL,
    "containerId" TEXT NOT NULL,
    "packedAt" TIMESTAMP(3) NOT NULL,
    "packer" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "procurementCaseId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ShipmentContainer_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TransportLeg" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "authorizedShipmentId" TEXT NOT NULL,
    "carrier" TEXT NOT NULL,
    "origin" TEXT NOT NULL,
    "destination" TEXT NOT NULL,
    "departureAt" TIMESTAMP(3) NOT NULL,
    "arrivalAt" TIMESTAMP(3) NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "procurementCaseId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "TransportLeg_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TelemetryObservation" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "containerId" TEXT NOT NULL,
    "observedAt" TIMESTAMP(3) NOT NULL,
    "temperatureC" DOUBLE PRECISION NOT NULL,
    "location" TEXT NOT NULL,
    "source" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "procurementCaseId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "TelemetryObservation_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ProcurementHandoff" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "authorizedShipmentId" TEXT NOT NULL,
    "handedAt" TIMESTAMP(3) NOT NULL,
    "sender" TEXT NOT NULL,
    "receiver" TEXT NOT NULL,
    "receipt" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "procurementCaseId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ProcurementHandoff_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "LogisticsIncident" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "authorizedShipmentId" TEXT NOT NULL,
    "occurredAt" TIMESTAMP(3) NOT NULL,
    "issue" TEXT NOT NULL,
    "response" TEXT NOT NULL,
    "owner" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "procurementCaseId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "LogisticsIncident_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "OperationalTask" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "owner" TEXT NOT NULL,
    "priority" TEXT NOT NULL,
    "startAt" TIMESTAMP(3) NOT NULL,
    "dueAt" TIMESTAMP(3) NOT NULL,
    "done" BOOLEAN NOT NULL,
    "notes" TEXT,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "procurementCaseId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "OperationalTask_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RuleVersion" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "jurisdiction" TEXT NOT NULL,
    "version" TEXT NOT NULL,
    "effectiveAt" TIMESTAMP(3) NOT NULL,
    "expiresAt" TIMESTAMP(3),
    "sourceUrl" TEXT NOT NULL,
    "requirementText" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "procurementCaseId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "RuleVersion_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DocumentRequirement" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "requiredBy" TIMESTAMP(3) NOT NULL,
    "sourceReference" TEXT NOT NULL,
    "evidenceReference" TEXT,
    "reviewNotes" TEXT,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "procurementCaseId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "DocumentRequirement_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE INDEX "WorkflowAnalysis_workflow_createdAt_idx" ON "WorkflowAnalysis"("workflow", "createdAt");

-- CreateIndex
CREATE UNIQUE INDEX "RecordReview_entity_entityId_version_actorId_key" ON "RecordReview"("entity", "entityId", "version", "actorId");

-- CreateIndex
CREATE INDEX "IssuedCredential_entity_entityId_createdAt_idx" ON "IssuedCredential"("entity", "entityId", "createdAt");

-- CreateIndex
CREATE INDEX "DomainArtifact_subjectEntity_subjectId_idx" ON "DomainArtifact"("subjectEntity", "subjectId");

-- CreateIndex
CREATE INDEX "WorkSession_respondentId_createdAt_idx" ON "WorkSession"("respondentId", "createdAt");

-- CreateIndex
CREATE INDEX "SessionMedia_sessionId_idx" ON "SessionMedia"("sessionId");

-- CreateIndex
CREATE INDEX "ProcurementCase_createdAt_idx" ON "ProcurementCase"("createdAt");

-- CreateIndex
CREATE INDEX "RecoveryTeam_createdAt_idx" ON "RecoveryTeam"("createdAt");

-- CreateIndex
CREATE INDEX "RecoveryTeam_procurementCaseId_idx" ON "RecoveryTeam"("procurementCaseId");

-- CreateIndex
CREATE INDEX "AuthorizedShipment_createdAt_idx" ON "AuthorizedShipment"("createdAt");

-- CreateIndex
CREATE INDEX "AuthorizedShipment_procurementCaseId_idx" ON "AuthorizedShipment"("procurementCaseId");

-- CreateIndex
CREATE INDEX "Container_createdAt_idx" ON "Container"("createdAt");

-- CreateIndex
CREATE INDEX "Container_procurementCaseId_idx" ON "Container"("procurementCaseId");

-- CreateIndex
CREATE INDEX "ShipmentContainer_createdAt_idx" ON "ShipmentContainer"("createdAt");

-- CreateIndex
CREATE INDEX "ShipmentContainer_procurementCaseId_idx" ON "ShipmentContainer"("procurementCaseId");

-- CreateIndex
CREATE INDEX "TransportLeg_createdAt_idx" ON "TransportLeg"("createdAt");

-- CreateIndex
CREATE INDEX "TransportLeg_procurementCaseId_idx" ON "TransportLeg"("procurementCaseId");

-- CreateIndex
CREATE INDEX "TelemetryObservation_createdAt_idx" ON "TelemetryObservation"("createdAt");

-- CreateIndex
CREATE INDEX "TelemetryObservation_procurementCaseId_idx" ON "TelemetryObservation"("procurementCaseId");

-- CreateIndex
CREATE INDEX "ProcurementHandoff_createdAt_idx" ON "ProcurementHandoff"("createdAt");

-- CreateIndex
CREATE INDEX "ProcurementHandoff_procurementCaseId_idx" ON "ProcurementHandoff"("procurementCaseId");

-- CreateIndex
CREATE INDEX "LogisticsIncident_createdAt_idx" ON "LogisticsIncident"("createdAt");

-- CreateIndex
CREATE INDEX "LogisticsIncident_procurementCaseId_idx" ON "LogisticsIncident"("procurementCaseId");

-- CreateIndex
CREATE INDEX "OperationalTask_createdAt_idx" ON "OperationalTask"("createdAt");

-- CreateIndex
CREATE INDEX "OperationalTask_procurementCaseId_idx" ON "OperationalTask"("procurementCaseId");

-- CreateIndex
CREATE INDEX "RuleVersion_createdAt_idx" ON "RuleVersion"("createdAt");

-- CreateIndex
CREATE INDEX "RuleVersion_procurementCaseId_idx" ON "RuleVersion"("procurementCaseId");

-- CreateIndex
CREATE INDEX "DocumentRequirement_createdAt_idx" ON "DocumentRequirement"("createdAt");

-- CreateIndex
CREATE INDEX "DocumentRequirement_procurementCaseId_idx" ON "DocumentRequirement"("procurementCaseId");

-- AddForeignKey
ALTER TABLE "RecoveryTeam" ADD CONSTRAINT "RecoveryTeam_procurementCaseId_fkey" FOREIGN KEY ("procurementCaseId") REFERENCES "ProcurementCase"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AuthorizedShipment" ADD CONSTRAINT "AuthorizedShipment_procurementCaseId_fkey" FOREIGN KEY ("procurementCaseId") REFERENCES "ProcurementCase"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Container" ADD CONSTRAINT "Container_procurementCaseId_fkey" FOREIGN KEY ("procurementCaseId") REFERENCES "ProcurementCase"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ShipmentContainer" ADD CONSTRAINT "ShipmentContainer_authorizedShipmentId_fkey" FOREIGN KEY ("authorizedShipmentId") REFERENCES "AuthorizedShipment"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ShipmentContainer" ADD CONSTRAINT "ShipmentContainer_containerId_fkey" FOREIGN KEY ("containerId") REFERENCES "Container"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ShipmentContainer" ADD CONSTRAINT "ShipmentContainer_procurementCaseId_fkey" FOREIGN KEY ("procurementCaseId") REFERENCES "ProcurementCase"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TransportLeg" ADD CONSTRAINT "TransportLeg_authorizedShipmentId_fkey" FOREIGN KEY ("authorizedShipmentId") REFERENCES "AuthorizedShipment"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TransportLeg" ADD CONSTRAINT "TransportLeg_procurementCaseId_fkey" FOREIGN KEY ("procurementCaseId") REFERENCES "ProcurementCase"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TelemetryObservation" ADD CONSTRAINT "TelemetryObservation_containerId_fkey" FOREIGN KEY ("containerId") REFERENCES "Container"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TelemetryObservation" ADD CONSTRAINT "TelemetryObservation_procurementCaseId_fkey" FOREIGN KEY ("procurementCaseId") REFERENCES "ProcurementCase"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProcurementHandoff" ADD CONSTRAINT "ProcurementHandoff_authorizedShipmentId_fkey" FOREIGN KEY ("authorizedShipmentId") REFERENCES "AuthorizedShipment"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProcurementHandoff" ADD CONSTRAINT "ProcurementHandoff_procurementCaseId_fkey" FOREIGN KEY ("procurementCaseId") REFERENCES "ProcurementCase"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LogisticsIncident" ADD CONSTRAINT "LogisticsIncident_authorizedShipmentId_fkey" FOREIGN KEY ("authorizedShipmentId") REFERENCES "AuthorizedShipment"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LogisticsIncident" ADD CONSTRAINT "LogisticsIncident_procurementCaseId_fkey" FOREIGN KEY ("procurementCaseId") REFERENCES "ProcurementCase"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "OperationalTask" ADD CONSTRAINT "OperationalTask_procurementCaseId_fkey" FOREIGN KEY ("procurementCaseId") REFERENCES "ProcurementCase"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RuleVersion" ADD CONSTRAINT "RuleVersion_procurementCaseId_fkey" FOREIGN KEY ("procurementCaseId") REFERENCES "ProcurementCase"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DocumentRequirement" ADD CONSTRAINT "DocumentRequirement_procurementCaseId_fkey" FOREIGN KEY ("procurementCaseId") REFERENCES "ProcurementCase"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

