# Product Bible — V3 Gateway Build
**Owner:** Shane Warehime, Phoenix Electric LLC | **Last Updated:** 2026-03-30
**Governing Repo:** build-ledger (GIT-PHOENIX-HUB) | **Source Repo:** twin-peaks (05_RUNBOOKS/)

---

## Purpose

The V3 Gateway Build is the complete rebuild of the Twin Peaks Gateway — Phoenix Electric's AI command center. It transforms the existing Gateway from a sidebar-driven single-panel dashboard into a production-grade, multi-panel command center with local AI fleet, business integrations, security hardening, voice interaction, and fine-tuned model deployment.

**Shane's directive (D-002):** "GATEWAY WILL BE THE PREMIER OF THE PROD REPO. IT WILL BE THE FIRST TO GO LIVE AND THE ONE TO GATE EVERYTHING ADDED. GATEWAY IS JUST THAT — A GATEWAY."

**Shane's directive (D-005):** "GATEWAY MUST BE FIRST THEN EVERYTHING FALLS IN PLACE."

The Gateway is the keystone. Every other workstream — filesystem, Twin Peaks fleet, pipeline wiring, monorepo consolidation — follows after Gateway is running.

---

## What This IS

- A **Node.js web application** serving as Shane's AI command center
- **8-phase build** spanning UI, local AI fleet, SF integration, M365 dashboard, RAG pipeline, security, voice, and fine-tuning
- **Local-first architecture** — 90% of AI operations run on Mac Studio M3 Ultra 96GB via Ollama fleet
- **Claude stays strategic** — Opus for reasoning and oversight, local models for production workload at zero per-query cost
- **13,077 lines of runbooks** already written and gate-reviewed across 8 phases
- **PHOENIX ELECTRIC IS ELECTRICAL** — this is built for an electrical contractor, not an HVAC company

## What This IS NOT

- Not a SaaS product (yet) — this is Shane's operational tool
- Not replacing Service Fusion directly — that's Conduit/Current (PCS)
- Not the monorepo — Gateway goes INTO PHOENIX_UNIFIED_PROD after it's live and tested
- Not Twin Peaks the content repo — Twin Peaks holds the runbooks, Gateway is the product

---

## Stack

| Layer | Technology | Version/Notes |
|-------|-----------|---------------|
| Runtime | Node.js | 22+ |
| Server | Express.js | HTTP + WebSocket |
| Frontend | Vanilla JS | No React, no framework — Shane's spec |
| CSS | phoenix-echo.css | Single file, RED/BLACK/GOLD palette |
| WebSocket | ws-manager.js | Standalone, heartbeat, reconnect |
| AI — Strategic | Claude Opus 4.6 | Reasoning, oversight, classification |
| AI — Local Fleet A | Ollama (port 11434) | qwen3:8b, qwen2.5-coder:7b, mistral:7b, nomic-embed-text |
| AI — Local Fleet B | Ollama (port 11435) | Nemotron-3 Nano 30B-A3B (3 personas), 70B swap-in |
| Vector Store | ChromaDB | Local-first RAG |
| Auth | OAuth PKCE + JWT | Azure Key Vault for all secrets |
| Voice | Whisper (local STT) + Twilio | Dashboard + phone + local processing |
| Deploy Target | VPS (93.188.161.80) | echo.phoenixelectric.life |
| Dev Machine | Mac Studio M3 Ultra 96GB | Primary build + fleet host |
| Satellite | MacBook Pro | Interactive dev (Echo + CG-01 + CS-01) |

---

## The 8 Phases — Runbook Index

| Phase | Name | Lines | Size | Scope | Dependencies | Status |
|-------|------|------:|-----:|-------|-------------|--------|
| 01 | **Gateway UI Rebuild** | 2,164 | 68K | Three-panel command center (Chat/Workspace/Tools). 14 page modules survive. CSS in one file. WebSocket standalone. | None (foundation) | NOT STARTED |
| 02 | **Twin Peaks Local AI Fleet** | 1,671 | 58K | Dual-Ollama fleet on Studio. Nemotron-3 Nano 30B-A3B + small models. 90% local ops. 85GB memory ceiling. | Phase 01 | NOT STARTED |
| 03 | **Service Fusion Integration** | 866 | 31K | SF MCP rebuild, polling engine (no webhooks), pricebook 7-tier pricing, Rexel vendor sync, 74 MCP tools. | Node 22+, Azure CLI | NOT STARTED |
| 04 | **M365 Integration** | 1,703 | 58K | Local M365 dashboard mirror. Graph API. Email & Calendar first, Teams second, SharePoint third. | Azure Entra ID | NOT STARTED |
| 05 | **RAG Pipeline** | 1,835 | 62K | Production RAG: ChromaDB, chunking, embeddings, retrieval, re-ranking, semantic caching. Local-first. | Phase 02 (fleet), embedding model decision | NOT STARTED |
| 06 | **Security & Authentication** | 2,135 | 66K | OAuth PKCE, JWT sessions, RBAC, sandbox (vm2 removal), Key Vault, WSS auth, CSP, biometric gates. | Gateway surfaces exist | NOT STARTED |
| 07 | **Voice AI** | 1,521 | 50K | Dashboard voice (Week 1-2), Twilio phone (Week 3-4), local Whisper STT (Month 2). | Gateway + Twilio + OpenAI Realtime API | NOT STARTED |
| 08 | **Fine-Tuning Pipeline** | 1,182 | 48K | LoRA adapters on Nemotron-3, quarterly retraining, A/B shadow routing. RunPod H100. | Phase 02 + Phase 05 | NOT STARTED |

**Total:** 13,077 lines, 441K across 8 runbooks. All authored by Echo Pro (Opus 4.6). Every runbook includes a Gauntlet Checklist and Rollback Plan.

### Dependency Chain

```
Phase 01 (Gateway UI) ──► Phase 02 (Local Fleet) ──► Phase 05 (RAG) ──► Phase 08 (Fine-Tuning)
                    │
                    ├──► Phase 03 (Service Fusion) — independent after Gateway exists
                    ├──► Phase 04 (M365) — independent after Gateway exists
                    ├──► Phase 06 (Security) — independent after Gateway exists
                    └──► Phase 07 (Voice) — independent after Gateway exists
```

Phases 03, 04, 06, 07 can run in parallel once Phase 01 is complete.

---

## Key Files

| File | Location | Purpose |
|------|----------|---------|
| Phase 01-08 Runbooks | `twin-peaks/05_RUNBOOKS/PHASE_0X_*.md` | Execution specs — 8 files, 13K+ lines |
| V3 UI Code (existing) | `twin-peaks/03_BUILD/gateway/` | 20 files of production-quality UI code (ws-manager, store, design-system, 14 page modules) |
| Phase 1 Gateway Deep Research Runbook | `twin-peaks/05_RUNBOOKS/Phase_01_Gateway Deep-Research-report-Runbook.md` | 1,855 lines, Browser-reviewed |
| V3 Forensic Audit | `~/Documents/PROJECTS/TWIN_PEAKS/V3_FORENSIC_AUDIT/` | 8 phase reports by Codex |
| Twin Peaks Rebuild Plan R3 | `_GATEWAY/PROPOSALS/plan__twin-peaks__full-rebuild__20260318.md` | 3,188 lines, 183KB, 3 revisions + 2 gauntlet reviews |
| Vision Documents | `build-ledger/vision/` | 8 files — Shane's annotated decisions, phase plans, status |
| Browser Handoff Prompts | `build-ledger/prompts/` | BBB's execution prompts for parallel browser work |

---

## Shane's Binding Decisions

| Decision | Source | What It Means |
|----------|--------|---------------|
| Gateway = Premier of PROD | D-002 | First to go live, gates everything else |
| Gateway first, then everything | D-005 | No Twin Peaks Phase 2, no filesystem Phase 2 until Gateway runs |
| RED/BLACK/GOLD | Phase 01 | Mandatory color palette |
| Vanilla JS, no frameworks | Architecture | No React, no Vue — pure JS |
| Local-first AI (90%) | Phase 02 | Claude for strategy only, Nemotron for production |
| SF has NO webhooks | Phase 03 | Polling engine required, 15-60s data lag acceptable |
| M365 = dashboard mirror, not integration | Phase 04 | Read-only quick-reference, pre-scripted Graph API endpoints |
| Echo bot is IN AZURE already | Vision notes | Bot has been running for months, down 2 weeks for Gateway build |
| Phoenix must exceed OpenClaw capabilities | Vision notes | "IF PHOENIX SOMEHOW ENDS UP WITH LESS CAPABILITIES THAN OPENCLAW IM GOING TO BE PISSED" |
| Monorepo is LONG TERM | Vision notes | "NOT NOW. BECAUSE THEY NEED TO BE CLEAN AND HAVE NO ISSUES BEFORE WE DO THIS" |
| Archive-only policy | Golden Rule | No delete ever. Archive for delete / archive for save only |

---

## Architecture — V3 Gateway Layout

```
┌──────────────────────────────────────────────────────────────┐
│                    Phoenix Echo Gateway V3                     │
├────────────┬────────────────────────┬────────────────────────┤
│            │                        │                        │
│  LEFT      │       CENTER           │       RIGHT            │
│  Chat      │    Workspace/Tabs      │      Tools             │
│  Panel     │                        │      Panel             │
│            │  14 Page Modules:      │                        │
│  Echo      │  - Overview            │  - Service Fusion      │
│  heartbeat │  - Daily Log           │  - Pricebook           │
│  + AI chat │  - Contracts           │  - Rexel               │
│            │  - Scheduling          │  - M365 Dashboard      │
│            │  - Estimates           │  - RAG Search          │
│            │  - Invoicing           │  - Voice Controls      │
│            │  - Customers           │  - Fleet Status        │
│            │  - Reports             │                        │
│            │  - ... (+6 more)       │                        │
│            │                        │                        │
├────────────┴────────────────────────┴────────────────────────┤
│  WebSocket (ws-manager.js) │ Store (state) │ Design System   │
├────────────────────────────┴───────────────┴─────────────────┤
│  Node.js / Express │ Ollama Fleet (local) │ Claude (strategic)│
└──────────────────────────────────────────────────────────────┘
```

---

## Current State

- **V1 Gateway:** LIVE on VPS (echo.phoenixelectric.life). Deployed, all green.
- **V3 Runbooks:** Written, gate-reviewed. 8 phases, 13K+ lines.
- **V3 UI Code:** Found at `twin-peaks/03_BUILD/gateway/` — 20 files, production quality.
- **V3 Forensic Audit:** Complete — 8 phase reports by Codex. 5 findings fixed (commit 6d0c540).
- **V3 Build:** NOT STARTED. Runbooks + UI code exist. Ready for execution.
- **Repo Archival Pipeline:** IN PROGRESS (Browser leading). Gateway migrating to UNIFIED_STAGING for V3 rewrite.
- **UNIFIED_PROD:** Future monorepo home. Gateway will be the first tenant.
- **UNIFIED_STAGING:** V3 rewrite workbench.

---

## Execution Model

- **Browser Echo** executes the build (task prompts with inline content — no file access)
- **Echo (CLI)** provides runbook content, logs work, coordinates
- **Codex** reviews (twice per phase: plan once, output once) — NOT an endless gate loop
- **Shane** directs all moves. Follow, don't lead.
- **Trust status:** Echo and Codex ON NOTICE. Browser is trusted lead.

---

## Action Log

| Date | Action | By |
|------|--------|----|
| 2026-03-10 | V3 runbooks authored (8 phases, 13K+ lines) | Echo Pro |
| 2026-03-18 | Twin Peaks rebuild plan R3 complete (3 revisions, 2 gauntlet reviews) | Echo + Shane |
| 2026-03-18 | 13-agent adversarial review: CONDITIONAL GO (25 CRIT, 27 HIGH) | Gauntlet |
| 2026-03-26 | V3 forensic audit complete (8 phase reports) | Codex |
| 2026-03-26 | Codex adversarial audit: 5 findings fixed (commit 6d0c540) | Codex + Echo |
| 2026-03-29 | Repo archival pipeline started — 11 PROJECTS/ folders created | Shane + Browser |
| 2026-03-30 | Vision documents pushed to build-ledger/vision/ (8 files, 1,092 lines) | Echo |
| 2026-03-30 | Product Bible written for V3 Gateway Build | Echo |

---

## What Comes After Gateway

Per Shane's decisions:
1. **Gateway goes live** → enters PHOENIX_UNIFIED_PROD as first tenant
2. **Filesystem Phase 2** (D-006: "AFTER GATEWAY THEN PHASE 2")
3. **Twin Peaks Phase 2** proceeds
4. **Monorepo consolidation** — long term, after everything is clean
5. **Pipeline wiring:** Bot → Gateway → Command App → Service Fusion (the full loop: customer text to truck roll)

---

*Written by Phoenix Echo (Opus 4.6) — 2026-03-30*
*"Gateway must be first, then everything falls in place." — Shane Warehime*
