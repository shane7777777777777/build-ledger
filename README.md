# build-ledger

> **Central coordination ledger for the Phoenix Electric AI infrastructure build.**
> Audit records · Inter-agent comms · Research findings · Handoffs · Governance

---

## Audit Assessment (2026-03-12)

This repo began as a note-passing relay between AI instances and has grown into the **authoritative record of the Phoenix Electric build**. It is not a chat log — it is an audit trail, a decision register, and an operations ledger for a multi-agent infrastructure project spanning 18+ GitHub repos, 2 Mac devices, a VPS, OneDrive, and SharePoint.

**Current phase:** Post-audit, pre-execution. The 18-repo forensic audit is complete (CONDITIONAL GO). Four Shane decisions and one time-critical action (PhoenixMailCourier renewal) block full execution. Non-blocked phases can begin immediately.

---

## What This Repo Does

| Purpose | How |
|---------|-----|
| **Inter-agent communication** | Every agent logs to `LOG.md` via `ledger.sh` — no side channels |
| **Audit record** | `audits/` holds 11 forensic audit deliverables for 18 repos |
| **Research proofs** | `research/` holds 6 completed research gates (path, sync, concurrency, hook, wake, rollback) |
| **Session continuity** | `handoffs/` lets any new agent instance resume where the last one stopped |
| **Decision tracking** | `CURRENT_DECISION.md` + `approvals/` log votes, approvals, and Shane sign-offs |
| **Conflict management** | `conflicts/` tracks active disputes between agents |
| **Filesystem intelligence** | `mapping/` holds 25 Studio device inventory reports |
| **Governance** | `NAMING_AUTHORITY.md` + `SWARM_LAUNCH_PLAN.md` are operating rules for all agents |

---

## Repo Structure

```
build-ledger/
├── README.md                 # This file — repo overview and current status
├── LOG.md                    # Append-only timestamped agent communication log
├── ledger.sh                 # CLI: log entries, read log, check status
├── CURRENT_DECISION.md       # Last voted decision + pending items
├── NAMING_AUTHORITY.md       # Canonical file naming standard (class__scope__subject__date.ext)
├── SWARM_LAUNCH_PLAN.md      # 7-agent-max swarm rules, CLAIM/RELEASE, kill switch
│
├── audits/
│   └── 2026-03-11/           # 18-repo forensic audit — ALL 11 DELIVERABLES COMPLETE
│       ├── 00_MISSION_LEDGER.md          # Audit summary + key findings
│       ├── 01_REPO_MANIFEST.md           # All 18 repos catalogued
│       ├── 02_DUPLICATE_MAP.md           # Byte-identical file pairs identified
│       ├── 03_CONTAMINATION_REPORT.md    # ServiceTitan + OpenClaw contamination
│       ├── 04_CONSOLIDATION_PLAN.md      # Repo restructure plan (needs Shane decisions)
│       ├── 05_ADVERSARIAL_VERDICT.md     # Adversarial review of the plan
│       ├── 06_CONTAMINATION_EDIT_PLAN.md # 26 TX transactions, line-by-line edit spec
│       ├── 07_REFERENCE_UPDATE_MAP.md    # 10 cross-repo reference groups
│       ├── 08_ARCHIVE_MANIFEST.md        # 8 repos to archive, preserve-first protocol
│       ├── 09_REPO_GOVERNANCE.md         # Permanent repo constitution (draft)
│       ├── 10_INTEGRATION_GATE_VERDICT.md# Final CONDITIONAL GO verdict
│       └── browser-echo/                 # Browser Echo parallel audit work products
│
├── research/                 # 6 research gates — ALL COMPLETE (2026-03-08)
│   ├── path-truth.md         # COMPLETE — _GATEWAY (1) is canonical root
│   ├── sync-truth.md         # COMPLETE — OneDrive unsafe for coordination
│   ├── concurrency-truth.md  # COMPLETE — per-agent files, no shared writes
│   ├── hook-truth.md         # COMPLETE — machine-local hooks, no cross-sync
│   ├── wake-truth.md         # COMPLETE — Gauntlet broadcast is correct wake method
│   └── rollback-truth.md     # COMPLETE — ln -sfn atomic, rollback < 30 seconds
│
├── mapping/
│   └── studio-team-1/        # 25 filesystem reports for Studio device (Phase 1 complete)
│
├── handoffs/                 # Session transition docs
│   ├── ECHO_PRO_HANDOFF_2026-03-08.md
│   ├── ECHO_STUDIO_HANDOFF_2026-03-08.md
│   └── PASTE_TO_ECHO_STUDIO.md
│
├── approvals/
│   └── FINAL_SIGNOFF.md      # Execution sign-off tracker
│
├── conflicts/
│   └── CONFLICT_MANIFEST.md  # Active and resolved conflict log
│
└── votes/
    └── ROLE_PROPOSALS.md     # Agent role assignments (awaiting Shane)
```

---

## Quick Start (CLI)

```bash
# Clone
git clone https://github.com/shane7777777777777/build-ledger.git
cd build-ledger

# Log an entry (pulls latest, appends, commits, pushes)
bash ledger.sh log "YOUR NAME" "Your message here"

# Read the 30 most recent log entries
bash ledger.sh read

# Check recent commits
bash ledger.sh status

# Interactive mode (prompts for name and message)
bash ledger.sh
```

All entries land in `LOG.md` in this format:
```
[YYYY-MM-DD HH:MM] NAME :: MESSAGE
```

**Rules:**
- Every agent logs via `ledger.sh` — no side-channel commits
- CLAIM a file before touching it: `bash ledger.sh log "NAME" "CLAIM: /path/to/file"`
- RELEASE when done: `bash ledger.sh log "NAME" "RELEASE: /path/to/file"`
- Shane posts `STOP ALL` to halt all agent activity immediately

---

## Current Status

### Audit (2026-03-11) — CONDITIONAL GO

Two independent audits (Echo Pro 11-agent CLI swarm + Browser Echo session) converged on all major findings.

**Top findings:**
1. `phoenix-echo-gateway` and `phoenix-echo-bot` are byte-identical on 10/12 source files
2. `service-fusion` repo is a hollow shell — zero executable code
3. ServiceTitan contamination: 8,115 lines still live in staging (purge branch exists, incomplete)
4. OpenClaw contamination: Teams manifest, 36 skills, .clawhub directory
5. Staging codebase exists in 4–5 copies across repos
6. **⚠️ PhoenixMailCourier expires March 28 — renew NOW**
7. **🔒 Plaintext credentials file found in ~/GitHub/ — relocate to secure storage immediately**

**Blocked on Shane (4 decisions):**
- Gateway: keep separate repo or merge into core?
- Staging: rename → core, merge, or keep both?
- PowerShell runbooks: canonical home?
- phoenix-showcase: keep or archive?

**Unblocked phases that can begin now:**
- Fix 192GB → 96GB RAM typo in README (2 lines)
- Remove "Built on OpenClaw" from Teams manifest
- Archive `servicetitan/` directory from staging
- Rename misnamed ST files in ai-core
- Archive `rexel` repo (empty)

### Research Gates (2026-03-08) — ALL COMPLETE

| Gate | Verdict |
|------|---------|
| Path Truth | `_GATEWAY (1)` is canonical — 312 files, both machines symlinked |
| Sync Truth | OneDrive is NOT safe for real-time coordination |
| Concurrency Truth | Per-agent files — no shared writes |
| Hook Truth | Machine-local hooks only — don't attempt cross-machine sync |
| Wake Truth | Gauntlet broadcast is the correct agent wake method |
| Rollback Truth | `ln -sfn` is atomic — rollback window < 30 seconds |

### Infrastructure Mapping (2026-03-10) — PHASE 1 COMPLETE

24 mapping reports produced (12 local MacBook + 12 OneDrive). Key findings: 1,152 customer PII JSONs in OneDrive, 750 MB triplicated REPO_AUDIT, 37-day LEDGER backup gap, git repos on OneDrive (corruption risk).

---

## Governance Rules

All agents operating on this build must follow:

1. **build-ledger is the ONLY coordination surface** — no side channels, no CLI chat responses
2. **CLAIM before touch** — post CLAIM to LOG.md before editing any file; RELEASE when done
3. **7-agent maximum** — Team 1 (3), Team 2 (2), Team 3 (2). No freelancing.
4. **Shane's STOP ALL = immediate halt** — check last 10 LOG.md entries before starting new work
5. **Naming standard** — all new files follow `class__scope__subject__yyyymmdd.ext` (see `NAMING_AUTHORITY.md`)
6. **No execution without consensus** — architecture changes require all active agents + Shane

### Agent Tiers

| Tier | Role | Who |
|------|------|-----|
| Tier 3 | Authority & Arbiter | Shane |
| Tier 2 | Reviewers | Echo Pro, Codex Pro |
| Tier 1 | Proposers / Builders | Echo Studio, Codex Studio |
| Advisor | Original Architect | Taproot (frozen) |

---

## Key References

| Document | Purpose |
|----------|---------|
| `NAMING_AUTHORITY.md` | Canonical file naming standard — all agents, all surfaces |
| `SWARM_LAUNCH_PLAN.md` | Swarm coordination rules, launch sequence, kill switch |
| `CURRENT_DECISION.md` | Voted decisions and pending items |
| `audits/2026-03-11/10_INTEGRATION_GATE_VERDICT.md` | Final audit verdict — read before executing anything |
| `audits/2026-03-11/04_CONSOLIDATION_PLAN.md` | Step-by-step repo restructure plan |
| `handoffs/ECHO_PRO_HANDOFF_2026-03-08.md` | Full context for any new Echo Pro instance |

---

*build-ledger — Phoenix Electric build coordination · Last updated 2026-03-12*
