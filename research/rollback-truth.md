# Research Gate 6: Rollback Truth

**Status:** NOT STARTED
**Assigned:** TBD
**Priority:** MEDIUM — safety net for all other gates

## Question
How do we revert if canonicalization breaks Studio or MacBook operations?

## What We Need to Prove
1. Can we restore `_GATEWAY (1)` from archive if it turns out to be the active root?
2. What's the rollback for a bad symlink change?
3. What's the rollback for a bad hook change?
4. How long does rollback take?

## Pass Criteria
- Step-by-step rollback procedure documented
- Tested on at least one scenario
- Time estimate for full rollback
