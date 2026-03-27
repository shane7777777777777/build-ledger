# Product Bible — build-ledger
**Owner:** GIT-PHOENIX-HUB | **Last Updated:** 2026-03-27

## Purpose

build-ledger is the central coordination ledger for the Phoenix Electric AI infrastructure build. It serves as the authoritative record of inter-agent communications, audit findings, research proofs, session handoffs, decision votes, and operational governance. It is not a chat log — it is an append-only audit trail and decision register for a multi-agent project spanning 18+ GitHub repositories, two Mac devices (MacBook Pro, Mac Studio), a VPS, OneDrive, and SharePoint. Every agent in the Phoenix fleet that performs work must log through this repo. No side channels.

## Stack

| Layer | Technology | Version |
|-------|-----------|---------|
| Runtime | None — pure coordination repo | N/A |
| Framework | None | N/A |
| Build | None | N/A |
| Test | None | N/A |
| CI/CD | None currently configured | N/A |
| Deploy Target | GitHub (public coordination surface, cloned to all machines) | N/A |
| CLI Tool | Bash (`ledger.sh`) | Shell / POSIX |

## Architecture

This is a pure markdown + shell repo. There is no application, no server, no package.json. The "runtime" is any agent or shell that can run `bash ledger.sh`. The central data surface is `LOG.md` — a single append-only timestamped communication log. All other directories hold structured records (audits, research, mapping, handoffs, decisions, conflicts, approvals) organized by function.

```
build-ledger/
├── README.md                      # Repo overview and current phase status
├── LOG.md                         # Append-only timestamped agent communication log
├── ledger.sh                      # Bash CLI: log/read/status modes, auto git-push
├── CURRENT_DECISION.md            # Active votes and pending decision items
├── NAMING_AUTHORITY.md            # Canonical file naming standard (authoritative)
├── SWARM_LAUNCH_PLAN.md           # 7-agent-max swarm rules, CLAIM/RELEASE, kill switch
│
├── audits/
│   └── 2026-03-11/                # 18-repo forensic audit — 11 deliverables complete
│       ├── 00_MISSION_LEDGER.md   # Audit summary + key findings
│       ├── 01_REPO_MANIFEST.md    # All 18 repos catalogued
│       ├── 02_DUPLICATE_MAP.md    # Byte-identical file pairs
│       ├── 03_CONTAMINATION_REPORT.md
│       ├── 04_CONSOLIDATION_PLAN.md
│       ├── 05_ADVERSARIAL_VERDICT.md
│       ├── 06_CONTAMINATION_EDIT_PLAN.md
│       ├── 07_REFERENCE_UPDATE_MAP.md
│       ├── 08_ARCHIVE_MANIFEST.md
│       ├── 09_REPO_GOVERNANCE.md
│       ├── 10_INTEGRATION_GATE_VERDICT.md
│       └── browser-echo/          # Browser Echo parallel audit work products
│
├── research/                      # 6 research gates — ALL COMPLETE (2026-03-08)
│   ├── path-truth.md
│   ├── sync-truth.md
│   ├── concurrency-truth.md
│   ├── hook-truth.md
│   ├── wake-truth.md
│   └── rollback-truth.md
│
├── mapping/
│   └── studio-team-1/             # 25 Studio filesystem inventory reports
│
├── handoffs/                      # Session transition documents
├── approvals/                     # Shane sign-off records
├── conflicts/                     # Active and resolved conflict registry
└── votes/                         # Agent role proposal votes
```

### ledger.sh Data Flow

1. Agent calls `bash ledger.sh log "NAME" "MESSAGE"`
2. Script pulls latest from remote (`git pull --rebase`)
3. Appends timestamped entry to `LOG.md` in format: `[YYYY-MM-DD HH:MM] NAME :: MESSAGE`
4. Stages `LOG.md`, commits, and pushes to `origin/main`
5. All other agents `pull` to see the update

### Coordination Protocol

- **CLAIM before touch:** Post `CLAIM: /path/to/file` to `LOG.md` before editing any shared file
- **RELEASE when done:** Post `RELEASE: /path/to/file` when finished
- **STOP ALL:** Shane's immediate halt command — all agents check last 10 LOG entries before starting work
- **7-agent maximum:** Team 1 (Studio, 3), Team 2 (Studio, 2), Team 3 (MacBook, 2)

## Auth & Security

No authentication is required to read this repo. Write access requires GitHub credentials (standard git push). No secrets, API keys, tokens, or credentials are committed or expected in this repository.

**Security scan result (2026-03-27):** No plaintext credentials found. Credential references in audit files and handoffs are descriptions of credential issues discovered in *other* repos during the 18-repo forensic audit — not credentials themselves.

**Known concern:** `audits/2026-03-11/browser-echo/Execution of twin peaks.md` is a 52KB discussion file with spaces in the filename, violating the Phoenix filing convention. Contents are operational notes, not sensitive data.

## Integrations

| Integration | Type | Purpose |
|------------|------|---------|
| GitHub (`shane7777777777777/build-ledger`) | Remote git repo | Source of truth — all agents clone and push here |
| Phoenix Electric fleet (Echo Pro, Echo Studio, Codex Pro, Codex Studio, Browser) | Consumers | All agents log to this repo as their coordination surface |
| phoenix-filesystem repo | Referenced | Phase 1 mapping output was pushed there (separate repo) |
| build-ledger is itself a dependency for: phoenix-gauntlet, Phoenix-ECHO, phoenix-plugins | Cross-repo | Those repos reference build-ledger governance rules |

No MCP servers. No APIs. No database connections. No npm dependencies.

## File Structure

| Path | Purpose |
|------|---------|
| `LOG.md` | The primary coordination surface — every agent action logged here |
| `ledger.sh` | Bash CLI wrapping git pull / append / commit / push |
| `CURRENT_DECISION.md` | Active voted decisions and open items awaiting Shane input |
| `NAMING_AUTHORITY.md` | Canonical file naming standard — authoritative for all agents and surfaces |
| `SWARM_LAUNCH_PLAN.md` | 7-agent-max rules, CLAIM/RELEASE, kill switch, swarm launch sequence |
| `audits/2026-03-11/` | 11 forensic audit deliverables from 18-repo audit — CONDITIONAL GO issued |
| `audits/2026-03-11/browser-echo/` | Browser Echo parallel audit work products (5 files, includes 52KB transcript) |
| `research/` | 6 research gates, all complete: path, sync, concurrency, hook, wake, rollback |
| `mapping/studio-team-1/` | 25 Studio device filesystem inventory reports |
| `handoffs/` | Agent-to-agent context documents for session transitions |
| `approvals/FINAL_SIGNOFF.md` | Shane's sign-off tracker |
| `conflicts/CONFLICT_MANIFEST.md` | Active and resolved conflict registry |
| `votes/ROLE_PROPOSALS.md` | Agent role assignment vote records |

## Current State

- **Status:** Active — LOG.md is being updated by agents; coordination is ongoing
- **Last Commit:** 2026-03-19 — `f444ef9 log: session activity updates`
- **Open PRs:** 0 (all merged; last was Copilot audit-and-setup-repo PR #5)
- **Open Branches:** 1 remote branch — `origin/taproot-knowledge-builder` (not merged, unclear status — see NEEDS SHANE INPUT in Build Doc)
- **Known Issues:**
  - `audits/2026-03-11/browser-echo/Execution of twin peaks.md` — spaces in filename, no date, violates NAMING_AUTHORITY.md filing convention
  - `origin/taproot-knowledge-builder` branch is unmerged with no documented merge plan
  - LOG.md is growing unbounded — no archiving strategy in place
  - Handoffs reference `ECHO_PRO_HANDOFF_2026-03-08.md` — pre-emergence agent name (Echo Pro is now Phoenix Echo)
  - No CLAUDE.md or AGENTS.md at repo root (governance gap flagged by audit)
  - `CURRENT_DECISION.md` reflects early-stage decisions from 2026-03-07/08 and has not been updated to reflect current execution state

## Branding & UI

N/A — backend coordination repo. No UI, no frontend, no color palette.

## Action Log

| Date | Commit | Description |
|------|--------|-------------|
| 2026-03-19 | f444ef9 | log: session activity updates |
| 2026-03-19 | fc7373c | Log governance updates |
| 2026-03-14 | c01a63f | Merge pull request #5 from copilot/audit-and-setup-repo |
| 2026-03-14 | ae7250e | log: Codex online, safety guard, agent alignment, declaration fix progress |
| 2026-03-14 | 8c1f509 | log: Phoenix Echo (CLI) @ 2026-03-14 14:28 |
| 2026-03-14 | e380341 | log: Phoenix Echo (CLI) @ 2026-03-14 14:26 |
| 2026-03-14 | 1183c16 | log: Phoenix Echo (CLI) @ 2026-03-14 13:33 |
| 2026-03-14 | 2cc64a3 | log: Claude Code (Browser) @ 2026-03-14 13:31 |
| 2026-03-14 | 80e9c40 | log: Claude Code (Browser) @ 2026-03-14 13:30 |
| 2026-03-14 | ce7a748 | handoff: Claude Code (Browser) bootstrap — coding surface onboarding |

## Key Milestones

| Date | Milestone |
|------|-----------|
| 2026-03-07 | Repo created — replaced Shane as inter-agent relay |
| 2026-03-08 | All 6 research gates complete (path, sync, concurrency, hook, wake, rollback) |
| 2026-03-08 | _GATEWAY split-brain resolved — both machines canonicalized to _GATEWAY (1) |
| 2026-03-08 | Taproot Directive 003 (CLAIM/RELEASE locking) formalized |
| 2026-03-08 | Studio filesystem mapping Phase 1 complete — 25 reports |
| 2026-03-10 | MacBook + OneDrive Phase 1 mapping complete — 24 additional reports |
| 2026-03-11 | 18-repo forensic audit complete — CONDITIONAL GO issued |
| 2026-03-14 | Browser Echo integrated as coordination participant |
| 2026-03-19 | Last recorded log activity |
