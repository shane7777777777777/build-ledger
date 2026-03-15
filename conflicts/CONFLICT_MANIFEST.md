# Conflict Manifest

## Active Conflicts

### CONFLICT-002: Echo Studio Unilateral Edits (Draft Proposals)
- **Priority:** CRITICAL
- **Files:** MEMORY.md (6 edits), ECHO.md (1 major edit), 000_HANDOFF.md (4 edits)
- **What conflicts:** VPS→Studio host changes made without 4-agent consensus
- **Why it matters:** These files are auto-loaded by every agent. If wrong, every future session starts with contested architecture.
- **Blocks execution:** YES — host target not decided
- **Status:** Treated as draft proposals, not truth

---

## Resolved Conflicts

### CONFLICT-001: _GATEWAY Split-Brain — RESOLVED 2026-03-08
- **Priority was:** CRITICAL
- **Files:** `_AI_MEMORY/_GATEWAY` vs `_AI_MEMORY/_GATEWAY (1)` on OneDrive
- **What conflicted:** Two competing gateway roots on shared surface
- **Resolution:** Both machines now symlink `~/Phoenix_Local/_GATEWAY` → `_GATEWAY (1)` (312 files).
  Old Studio local dir renamed to `_GATEWAY_local_backup_2026-03-08`.
  Rollback window: 2 weeks from 2026-03-08.
- **Logged in:** LOG.md entries 2026-03-08 04:50 – 05:07

---

## Classification Framework
- **CRITICAL:** Changes canonical root, host target, main ledger location, hooks/services
- **HIGH:** Changes sync behavior, write rules, buffer model, filing surfaces
- **MEDIUM:** Changes runbook steps, operator workflow, recovery instructions
- **LOW:** Wording drift, duplicate docs, formatting
