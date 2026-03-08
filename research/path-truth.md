# Path Truth — Research Summary

**Source:** Echo Pro research agent (MacBook), 2026-03-07 21:00 MST
**Original location:** GAUNTLET_SESSION_LEDGER.md on Studio

## Finding

The active canonical directory is `_AI_MEMORY/_GATEWAY (1)`:
- 312 files, 400MB, last modified 2026-03-07
- MacBook symlink already points here — CORRECT

The no-suffix `_AI_MEMORY/_GATEWAY` is a fossil:
- 70 files, 2.8MB, last modified 2026-02-03
- Studio symlink points here — NEEDS FIX

## Fix
1. rsync --ignore-existing from old to new (merge 42 unique files)
2. One `ln -sf` command on Studio to point at the active directory
3. Rename old directory to _GATEWAY_RETIRED, watch 2 weeks before delete

## Status: PROOF COMPLETE — awaiting 4-agent approval before execution
