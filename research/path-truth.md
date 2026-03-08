# Research Gate 1: Path Truth

**Status:** NOT STARTED
**Assigned:** TBD (pending role assignment)
**Priority:** HIGHEST — blocks all other gates

## Question
Which `_GATEWAY` root does each machine actually point to?

## What We Know
- OneDrive has TWO folders: `_AI_MEMORY/_GATEWAY` and `_AI_MEMORY/_GATEWAY (1)`
- `_GATEWAY` (no suffix): 102 files, 3.1 MB, actively maintained (updated 2026-03-08)
- `_GATEWAY (1)`: 4,426 files, 291 MB, stale since 2026-02-01, contains historical archive
- Root cause: OneDrive sync conflict around January 18, 2026
- `_GATEWAY (1)` has 192 unique files and 43 unique dirs not in `_GATEWAY`

## What We Need to Prove
1. What does `~/Phoenix_Local/_GATEWAY` resolve to on MacBook? (symlink? real dir? which OneDrive folder?)
2. What does `~/Phoenix_Local/_GATEWAY` resolve to on Studio?
3. Are they pointing to the same OneDrive folder or different ones?
4. Which folder has the actively-used LEDGER.md, ECHO.md, 000_HANDOFF.md?

## Pass Criteria
- Clear answer for each machine
- No ambiguity about which root is active
- Conflict archive manifest for the stale folder

## Proof Method
- `ls -la` / `readlink` / `stat` on both machines
- Compare file checksums between the two OneDrive folders
- Verify which LEDGER.md is being written to
