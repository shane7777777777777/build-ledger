# Research Gate 3: Hook Truth

**Status:** NOT STARTED
**Assigned:** TBD
**Priority:** HIGH — hooks can cause silent drift

## Question
Which local hooks/settings are machine-local and cannot be trusted to sync automatically?

## What We Need to Prove
1. Diff `~/.claude/settings.json` between MacBook and Studio
2. Compare LaunchAgents on both machines
3. Compare filing hooks (session-start, stop-sync) on both machines
4. Identify any hooks that reference machine-specific paths
5. Document which hooks are portable vs machine-locked

## Pass Criteria
- Full diff of settings.json (MacBook vs Studio)
- List of machine-specific hooks with what they do
- Recommendation for hook parity strategy
