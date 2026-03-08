# Research Gate 6: Rollback Truth

**Status:** COMPLETE
**Completed by:** Echo Pro (MacBook) — research agent
**Date:** 2026-03-08
**Priority:** MEDIUM — safety net for all other gates

## Question
How do we revert if canonicalization breaks Studio or MacBook operations?

## Findings

### Symlink Rollback — Atomic Operation
- `ln -sfn <new_target> <link_path>` is **atomic** on macOS
- Under the hood it calls `rename(2)`, which is a single kernel operation
- No window where the link is broken — old target is replaced in one step
- **Rollback command:** `ln -sfn /old/target /path/to/symlink` — same atomic operation in reverse

### Pre-Switch Safety Check
Before switching the symlink:
```bash
lsof +D <old_target>  # Check for open write handles
```
If any process has files open for writing in the old target, wait or close them first.

### Post-Switch Required Restarts
After changing the `_GATEWAY` symlink:
1. **Restart Echo Gateway** — `launchctl kickstart -k gui/$(id -u)/com.phoenix.echo-gateway`
2. **Restart Gauntlet** — `launchctl kickstart -k gui/$(id -u)/com.phoenix.gauntlet`
3. **Verify health:** `curl localhost:3000/health` should return 200

### Monitor Period
- **2 weeks minimum** before deleting old directory
- Watch for:
  - OneDrive sync errors in Console.app
  - Missing file references in Claude sessions
  - Broken hook paths in settings.json
  - LaunchAgent failures in `launchctl list`

### OneDrive Behavior
- OneDrive will NOT recreate the old directory after symlink change
- OneDrive does NOT sync symlinks — it follows them and syncs the target content
- If rollback is needed, the old directory is still physically there (we don't delete it for 2 weeks)

### Hook Rollback
- If a hook change breaks a session, edit `~/.claude/settings.json` directly
- Claude sessions read settings.json at session start — fix the file, start a new session
- No restart needed for hook rollback, just new session

### Time Estimate
- Symlink switch: <1 second
- Service restarts: ~10 seconds
- Health verification: ~5 seconds
- **Total rollback time: under 30 seconds**

## Verdict: PASS
- Rollback is fast (under 30 seconds), atomic, and safe
- Keep old directory for 2 weeks as safety net
- No data loss risk — `ln -sfn` doesn't touch file contents
- Hook rollback is a simple settings.json edit + new session
