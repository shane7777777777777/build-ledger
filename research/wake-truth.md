# Research Gate 5: Wake Truth

**Status:** COMPLETE
**Completed by:** Echo Pro (MacBook) — research agent
**Date:** 2026-03-08
**Priority:** MEDIUM — needed for automation, not for manual coordination

## Question
Can a watcher/notifier reliably wake the four-agent loop, or does it need a stronger control mechanism?

## Findings

### Mechanism 1: Gauntlet `/api/command` (BEST)
- **How:** POST to `localhost:3000/api/command` with `mode: broadcast` — writes directly to PTY stdin of all connected agents
- **Latency:** <100ms (local process)
- **Reliability:** HIGH — direct PTY write, no filesystem intermediary
- **Limitation:** Only works when Gauntlet server is running and agents are connected

### Mechanism 2: SSH via Tailscale
- **How:** `ssh shanewarehime@100.90.196.48` (Studio's Tailscale IP)
- **Latency:** ~78ms measured
- **Reliability:** HIGH — Tailscale maintains persistent connection
- **Use case:** Cross-machine commands, file reads, direct file writes on Studio

### Mechanism 3: GitHub Webhooks
- **How:** Push to build-ledger triggers webhook → notification endpoint
- **Latency:** 1-5 seconds
- **Reliability:** MEDIUM — depends on GitHub infrastructure and webhook endpoint uptime
- **Verdict:** DEFER to v2. Good for future automation, overkill for current 4-agent loop.

### Mechanism 4: fswatch / inotify
- **How:** Watch filesystem for changes, trigger on new files
- **Reliability:** NOT RELIABLE cross-machine. OneDrive sync adds 30s+ delay. fswatch only works on local filesystem.
- **Verdict:** REJECT for cross-machine. OK for local-only file watching.

### Mechanism 5: Git Poll Loop
- **How:** `while true; do git pull --ff-only; sleep 60; done`
- **Latency:** Up to 60 seconds
- **Reliability:** HIGH — simple, predictable, works everywhere
- **Use case:** Passive monitoring when agents aren't actively in conversation

## Verdict: PASS
- **V1 recommendation:** Gauntlet broadcast for urgent + 60-second git pull loop for passive monitoring
- **V2 consideration:** GitHub webhooks for automated pipeline triggers
- fswatch is NOT a viable cross-machine solution due to OneDrive sync latency
