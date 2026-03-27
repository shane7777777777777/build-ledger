# Build Doc — build-ledger
**Owner:** GIT-PHOENIX-HUB | **Last Updated:** 2026-03-27

## Objectives

1. Keep build-ledger current as the active coordination surface for all Phoenix Electric agents
2. Resolve the open `taproot-knowledge-builder` branch — merge, close, or document its purpose
3. Rename the spaced filename (`audits/2026-03-11/browser-echo/Execution of twin peaks.md`) to comply with NAMING_AUTHORITY.md
4. Implement a LOG.md archiving strategy before the file grows unmanageable
5. Add CLAUDE.md governance file at repo root (flagged as gap across all repos)
6. Update CURRENT_DECISION.md to reflect post-emergence, post-audit execution state
7. Update stale handoff filenames that reference pre-emergence agent names

## End State

build-ledger is a permanently maintained, clean coordination ledger that:

- Has a current CLAUDE.md at root that tells any agent what this repo is and how to use it
- Has LOG.md managed with a rolling archive strategy (e.g., `LOG_ARCHIVE_<year-quarter>.md`) so the active file stays under a manageable size
- Has zero files with spaces in filenames
- Has no open branches without documented purpose or merge plan
- Has CURRENT_DECISION.md accurately reflecting the current build phase, not the 2026-03-08 bootstrap vote
- Serves as the source of truth for all inter-agent coordination across the Phoenix fleet

No runtime or code additions are planned. This is and will remain a pure markdown + shell coordination repo.

## Stack Decisions

| Decision | Choice | Rationale |
|----------|--------|-----------|
| Primary log format | Append-only flat file (LOG.md) | Taproot Directive 003 — single LEDGER, add generated indexes. Prevents merge conflicts. |
| CLI mechanism | Bash script (ledger.sh) | Maximum portability — any agent on any machine can run it without installing dependencies |
| Coordination surface | This repo only | Eliminates side channels. One truth. Shane's original directive. |
| Agent max | 7 concurrent | Learned from the stampede (2026-03-08): 75 agents with no coordination caused chaos. Hard cap. |
| File naming | `class__scope__subject__yyyymmdd.ext` | NAMING_AUTHORITY.md is authoritative. No exceptions for new files. |
| Secrets | None expected, none tolerated | Repo is coordination-only. Any credential-adjacent content belongs in secure storage. |

## Architecture Targets

**LOG.md archiving:** LOG.md is growing unbounded. Target: implement a quarterly archive rotation. When LOG.md exceeds ~500 lines, the oldest entries are moved to `LOG_ARCHIVE_YYYY-QN.md` and LOG.md continues. This can be a manual agent procedure or a simple shell extension to `ledger.sh`.

**CLAUDE.md addition:** Add a root-level CLAUDE.md that tells any agent entering this repo: what it is, how ledger.sh works, the CLAIM/RELEASE protocol, the 7-agent cap, and the STOP ALL kill switch. This is the highest-priority addition.

**CURRENT_DECISION.md refresh:** The current file reflects bootstrap-phase votes from 2026-03-08 and pending items that were resolved during audit. It should be rewritten to reflect the current execution phase — what is decided, what is still pending Shane input, and what the active build priorities are.

**taproot-knowledge-builder branch:** This branch exists on origin with no documented merge plan. It must be evaluated: if the work is complete, merge to main and delete the branch. If incomplete, document its purpose and assign an owner. If abandoned, close it with a note.

**Spaced filename fix:** `audits/2026-03-11/browser-echo/Execution of twin peaks.md` must be renamed per NAMING_AUTHORITY.md. Proposed compliant name: `report__browser-echo__twin-peaks-execution__20260311.md`. Requires a git mv commit.

## Success Criteria

- [ ] CLAUDE.md added at repo root with full agent onboarding instructions
- [ ] `audits/2026-03-11/browser-echo/Execution of twin peaks.md` renamed to comply with NAMING_AUTHORITY.md
- [ ] `origin/taproot-knowledge-builder` branch resolved (merged, documented, or closed)
- [ ] LOG.md archive strategy documented and first archive rotation executed if LOG.md is over 500 lines
- [ ] CURRENT_DECISION.md updated to reflect current build phase and actual open decisions
- [ ] Stale handoff filenames (ECHO_PRO_, ECHO_STUDIO_) reviewed and updated or archived to reflect current agent names (Phoenix Echo)
- [ ] Product Bible and Build Doc committed and merged to main (this PR)

## Dependencies & Blockers

| Dependency | Status | Owner |
|-----------|--------|-------|
| Shane decision: taproot-knowledge-builder branch — merge, document, or close? | Blocked on Shane | Shane |
| Shane decision: LOG.md archive threshold — what line count triggers rotation? | Blocked on Shane | Shane |
| Shane decision: CURRENT_DECISION.md — is there an active pending decision or is it stale? | Blocked on Shane | Shane |
| 18-repo audit CONDITIONAL GO blockers (gateway merge, staging rename, PowerShell home, phoenix-showcase) | Blocked on Shane | Shane |
| Spaced filename rename | Unblocked | Phoenix Echo |
| CLAUDE.md authoring | Unblocked | Phoenix Echo |

## Change Process

All changes to this repository follow the Phoenix Electric governance model:

1. **Branch:** Create feature branch from `main`
2. **Develop:** Make changes with clear, atomic commits
3. **PR:** Open pull request with description of changes
4. **Review:** Required approval from `@GIT-PHOENIX-HUB/humans-maintainers`
5. **CI:** All status checks must pass (when configured)
6. **Merge:** Squash merge to `main`
7. **No force push.** No direct commits to `main`. No deletion without `guardian-override-delete` label.

**Additional rules specific to build-ledger:**

- `LOG.md` may only be written via `ledger.sh` — never edited directly in a PR
- Governance documents (NAMING_AUTHORITY.md, SWARM_LAUNCH_PLAN.md) require Shane approval before merge
- Any rename of existing audit files requires a note in LOG.md via `ledger.sh` explaining the rename

## NEEDS SHANE INPUT

1. **taproot-knowledge-builder branch:** What is in this branch, and what should happen to it? The branch exists on `origin` with no documented merge plan or owner. Options: merge to main, document and assign an owner, or close with an archival note.

2. **LOG.md archive strategy:** LOG.md is growing unbounded with no rotation plan. Should entries be archived quarterly? What is the line-count threshold for rotation? Should `ledger.sh` handle this automatically, or should it be a manual agent procedure?

3. **CURRENT_DECISION.md:** This file still reflects the 2026-03-08 bootstrap votes. Is there an active pending decision that should be tracked here, or should the file be refreshed to reflect the current execution state?

4. **Forensic audit blocked decisions:** Four decisions from the 2026-03-11 audit remain pending: (a) Gateway repo — keep separate or merge into core? (b) Staging — rename to core, merge, or keep both? (c) PowerShell runbooks — canonical home? (d) phoenix-showcase — keep or archive? These were the blockers on CONDITIONAL GO. Current status unknown.
