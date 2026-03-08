# Research Gate 3: Hook Truth

**Status:** COMPLETE
**Completed by:** Echo Pro (MacBook) — research agent
**Date:** 2026-03-08
**Priority:** HIGH — hooks can cause silent drift

## Question
Which local hooks/settings are machine-local and cannot be trusted to sync automatically?

## Findings

### settings.json Diff — MacBook vs Studio

**MacBook has these hooks that Studio DOES NOT:**
- None unique to MacBook only (all MacBook hooks exist on Studio)

**Studio has these hooks that MacBook DOES NOT:**
1. **Filing check PreToolUse** — warns on `mv`/`cp`/`rsync` to filing directories. Prevents accidental file moves into structured filing system.
2. **MASTER_TODO SessionStart** — shows P0/P1 tasks from `MASTER_TODO_LIST.md` at session start.
3. **filing-session-start.sh SessionStart** — runs `~/Phoenix_Local/_GATEWAY/scripts/filing-session-start.sh` to initialize filing context.

### LaunchAgents

**MacBook (4 LaunchAgents):**
1. `com.phoenix.echo-gateway` — Echo Gateway server
2. `com.phoenix.gauntlet` — Gauntlet orchestrator
3. `com.phoenix.ledgerwatch15` — LEDGER file watcher (15s interval)
4. `com.phoenix.whisperwatcher` — Audio transcription watcher

**Studio (1 LaunchAgent):**
1. `com.phoenix.studio-tunnel` — autossh reverse SSH tunnel to VPS

### OneDrive Path Divergence
- **MacBook:** `OneDrive-phoenixelectric.life/_GATEWAY/`
- **Studio:** `OneDrive-SharedLibraries-phoenixelectric.life/Phoenix Ops - Documents/_AI_MEMORY/_GATEWAY/`
- These are DIFFERENT OneDrive mount points. A hook referencing one path will break on the other machine.

### Missing Scripts on MacBook
- `filing-session-start.sh` — exists on Studio, not on MacBook
- `filing-stop-sync.sh` — exists on Studio, not on MacBook

## Verdict: PASS with conditions
- Hook parity drift is REAL — Studio has 3 extra hooks
- OneDrive paths are DIFFERENT between machines — hooks must use machine-relative paths or symlinks
- LaunchAgent sets are completely different (expected — different roles)
- **Recommendation:** Do NOT try to sync hooks between machines. Each machine has its own role. Document the differences and accept them. If a hook needs to run on both, use `$HOME` paths not hardcoded OneDrive paths.
