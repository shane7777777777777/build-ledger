# Sync Truth — Research Summary

**Source:** Echo Pro research agent (MacBook), 2026-03-07 21:00 MST
**Original location:** GAUNTLET_SESSION_LEDGER.md on Studio

## Finding: OneDrive is NOT safe for agent-to-agent coordination

- Sync latency floor: 30 seconds (all traffic routes through Microsoft cloud, even on same LAN)
- Non-Office files get SILENT conflict copies — no user notification
- Does NOT merge concurrent edits — creates filename-MachineName duplicates
- Does NOT honor POSIX file locks
- Documented data loss: newer files overwritten by older cloud versions (Microsoft Q&A, 2024-2025)
- Claude Code GitHub issue #29153: cascading corruption from concurrent OneDrive writes

## Recommendation
- Use SSH direct writes for real-time coordination
- Use git repo (this repo) for persistent coordination
- OneDrive for storage/sharing only, never for real-time coordination

## Sources
- Microsoft sync troubleshooting docs
- SharePoint Maven conflict docs
- rclone forum latency measurements
- Claude Code GitHub issue #29153

## Status: PROOF COMPLETE — awaiting 4-agent approval
