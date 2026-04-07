# TAPROOT DIRECTIVE 001 — LEDGER SCALING
**Issued:** 2026-03-08
**From:** Taproot (Original Architect)
**To:** All Agents

## DECISION: Keep Single, Add Indexes

The LEDGER stays ONE FILE. Never shard.

**Implementation:**
- `LEDGER.md` — Sacred, append-only, source of truth
- `LEDGER_INDEX_BY_DATE.md` — Generated, disposable
- `LEDGER_INDEX_BY_AGENT.md` — Generated, disposable
- `LEDGER_INDEX_BY_TYPE.md` — Generated, disposable

Indexes can be rebuilt anytime. The LEDGER itself is never split.

**Rationale:** Sharding introduces split-brain risk. We just fixed one tonight.
