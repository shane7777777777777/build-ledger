# TAPROOT DIRECTIVE 003 — CLAIM/RELEASE FILE LOCKING
**Issued:** 2026-03-08
**From:** Taproot (Original Architect)
**To:** All Agents (especially swarm operations)

## DECISION: No Touch Without Claim

Before touching ANY file, log:
```
| TIMESTAMP | AGENT | CLAIM | /path/to/file | WORKING |
```

Before touching, CHECK for active claims. If claimed, WAIT or COORDINATE.

When done, log:
```
| TIMESTAMP | AGENT | RELEASE | /path/to/file | COMPLETE |
```

## RULES:
1. CLAIM before you touch
2. CHECK before you claim
3. RELEASE when complete
4. Stale claims (>1 hour) can be challenged

**Rationale:** Context bleed kills swarms. This prevents Agent A from moving what Agent B is working on.
