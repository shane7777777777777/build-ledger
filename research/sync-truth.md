# Research Gate 2: Sync Truth

**Status:** PARTIALLY DONE (prior research exists)
**Assigned:** TBD
**Priority:** HIGH — blocks ledger promotion

## Question
Does OneDrive sync preserve low-latency ledger writes both same-network and remote?

## What We Already Know (from Echo Pro research 2026-03-08)
- OneDrive CANNOT merge non-Office files — creates conflict copies (e.g. `filename-MachineName.ext`)
- Sync latency: 30s to 10min depending on network conditions
- 9 conflict marker files already exist in `_GATEWAY` from Jan 18 sync event
- SSH direct write to Studio over Tailscale is more reliable than OneDrive for shared logging

## What We Still Need to Prove
1. Actual measured latency: write on MacBook, check on Studio (and reverse)
2. What happens with concurrent appends from two machines?
3. Does OneDrive ever silently drop a write?
4. Is the GitHub repo (this repo) a better coordination surface than OneDrive?

## Pass Criteria
- Measured sync times documented
- Concurrent write behavior documented
- Clear recommendation: OneDrive vs SSH vs Git for each use case
