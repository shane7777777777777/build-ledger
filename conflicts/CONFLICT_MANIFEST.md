# Conflict Manifest

## Active Conflicts

### CONFLICT-001: _GATEWAY Split-Brain
- **Priority:** CRITICAL
- **Files:** `_AI_MEMORY/_GATEWAY` vs `_AI_MEMORY/_GATEWAY (1)` on OneDrive
- **What conflicts:** Two competing gateway roots on shared surface
- **Why it matters:** Every agent could be writing to a different root without knowing. Split-brain = lost data.
- **Blocks execution:** YES — this is the #1 blocker
- **Archive:** `Team_Communications/ARCHIVE/GATEWAY_SPLIT_BRAIN_REVIEW_2026-03-08.md`

### CONFLICT-002: Echo Studio Unilateral Edits (Draft Proposals)
- **Priority:** CRITICAL
- **Files:** MEMORY.md (6 edits), ECHO.md (1 major edit), 000_HANDOFF.md (4 edits)
- **What conflicts:** VPS→Studio host changes made without 4-agent consensus
- **Why it matters:** These files are auto-loaded by every agent. If wrong, every future session starts with contested architecture.
- **Blocks execution:** YES — host target not decided
- **Status:** Treated as draft proposals, not truth

## Classification Framework
- **CRITICAL:** Changes canonical root, host target, main ledger location, hooks/services
- **HIGH:** Changes sync behavior, write rules, buffer model, filing surfaces
- **MEDIUM:** Changes runbook steps, operator workflow, recovery instructions
- **LOW:** Wording drift, duplicate docs, formatting
