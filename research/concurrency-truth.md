# Concurrency Truth — Research Summary

**Source:** Echo Pro research agent (MacBook), 2026-03-07 21:00 MST
**Original location:** GAUNTLET_SESSION_LEDGER.md on Studio

## Finding: Per-agent separate files is the evidence-backed solution

### Recommended: Per-agent files (ECHO_LOG.md, CODEX_LOG.md, etc.)
- Eliminates write contention by construction — one writer per file
- Pattern used by rsyslog, Kubernetes, all production distributed logging
- Reader/aggregator merges chronologically using timestamps
- No locks, no race conditions, no interleaving
- OneDrive conflict copies become impossible (one writer = no conflicts)

### Rejected: Shared file + .lock
- Lock file visibility subject to OneDrive sync delay
- TOCTOU race condition guaranteed when sync delay > 0

### Rejected: JSONL atomic append (cross-machine)
- O_APPEND atomicity only applies to single filesystem instance
- OneDrive creates conflict copies, not merged JSONL

### Rejected: Git-based logging for high-frequency
- Push/retry overhead too high for append-only logs
- Git repos + OneDrive = documented anti-pattern

### Viable alternative: Designated Writer via Tailscale SSH
- One machine is sole writer, others send via SSH
- Eliminates all concurrency issues
- Adds small infrastructure requirement

## Status: PROOF COMPLETE — awaiting 4-agent approval
