# Research Gate 5: Wake Truth

**Status:** NOT STARTED
**Assigned:** TBD
**Priority:** MEDIUM — needed for automation, not for manual coordination

## Question
Can a watcher/notifier reliably wake the four-agent loop, or does it need a stronger control mechanism?

## What We Need to Prove
1. Can fswatch/inotify on Studio detect new commits or file writes?
2. Can a GitHub webhook notify agents of new pushes to this repo?
3. Is polling (check every N seconds) reliable enough?
4. What's the minimum viable notification model?

## Pass Criteria
- At least one working notification method documented
- Latency measured
- Recommendation for v1 wake model
