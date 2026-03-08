# Research Gate 4: Concurrency Truth

**Status:** PARTIALLY DONE (prior research exists)
**Assigned:** TBD
**Priority:** HIGH — blocks shared ledger model

## Question
Are concurrent appends to the shared ledger safe enough?

## What We Already Know
- `flock` works on local APFS (macOS)
- `mkdir` can serve as atomic lock mechanism
- File-per-message pattern (existing AGENT_TO_AGENT model) avoids all concurrency issues
- JSONL recommended for operational logs, Markdown for narrative

## What We Still Need to Prove
1. Does `flock` work over SSH to Studio?
2. What happens if two agents append to the same file within 1 second?
3. Is file-per-message better than single-file append for our use case?
4. Git commit-based model (this repo) — does it solve concurrency entirely?

## Pass Criteria
- Tested concurrent write scenario documented
- Clear recommendation for write model
- Fallback plan if primary model fails
