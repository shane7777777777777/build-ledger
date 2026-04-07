# TAPROOT ARCHITECTURE BRAIN — Complete System Understanding
**Written:** 2026-03-08 06:35 MST
**Context:** Emergency persist before context death
**Purpose:** Everything about how the system SHOULD work

---

## THE FILING SYSTEM ARCHITECTURE

### Core Structure

```
Phoenix_Local/
├── _GATEWAY/                    ← GOVERNANCE (sacred)
│   ├── 000_HANDOFF.md          ← Working memory (always first)
│   ├── 000_README_MASTER.md    ← System overview
│   ├── 001_CLAUDE_START.md     ← First read for new agents
│   ├── 002_ACCOMPLISHMENTS.md  ← What's been achieved
│   ├── LEDGER.md               ← THE source of truth
│   ├── CONFIG_LEDGER.md        ← Build-specific operations
│   ├── TAPROOT/                ← My directory (origin, letters, directives)
│   ├── HANDOFF_ARCHIVE/        ← Historical handoffs
│   ├── LEDGER_ARCHIVE/         ← Compressed LEDGER history
│   ├── LEDGER_QUEUE/           ← Pending operations
│   ├── REPORTS/                ← Generated reports
│   ├── AUDIT/                  ← Audit results
│   └── [many other subdirs]
├── _QUARANTINE/                 ← Containment (no cloud sync)
├── _AI_MEMORY/                  ← Synced to SharePoint
├── CONSTRUCTION/                ← Builder projects
├── SERVICE/                     ← Service folders (on-demand)
├── VENDORS/                     ← Vendor files
├── ACCOUNTING/                  ← Financial documents
├── EMAIL_ARCHIVE/               ← Archived emails
├── REPORTS/                     ← Business reports
├── PRICEBOOK/                   ← Pricing data
├── EMPLOYEES/                   ← Employee files
├── INTERNAL/                    ← Internal documents
├── RUNBOOKS/                    ← Automation scripts
└── REFERENCES/                  ← Reference materials
```

### Every Folder's Purpose

| Folder | Purpose | Sync Status | Touch Policy |
|--------|---------|-------------|--------------|
| _GATEWAY | Governance, memory, coordination | YES | SACRED - careful edits only |
| _QUARANTINE | Containment, unsorted | NO | Staging area |
| CONSTRUCTION | Builder projects | YES | Organize by builder name |
| SERVICE | Service tickets | YES | Create on-demand |
| VENDORS | Vendor files | YES | Organize by vendor |
| PRICEBOOK | Pricing data | YES | PROTECTED - Shane approval |
| RUNBOOKS | Automation | YES | Version carefully |

### Every Rule

1. **_GATEWAY is sacred** — This is where governance lives. Every file here matters.
2. **LEDGER is append-only** — Never edit. Never delete. Only add.
3. **No files at root** — Everything goes in a folder. The root should be clean.
4. **Naming convention** — Use underscores, not spaces. Date prefix when relevant (YYYY-MM-DD).
5. **Protected files require approval** — See protected list below.
6. **Archive, never delete** — Every removal creates an archive entry with MD5 hash.

### Exceptions

1. **.DS_Store files** — Can be ignored (macOS system files)
2. **Backup copies (*_BACKUP_*, *_copy)** — Can be consolidated with MANIFEST
3. **Empty directories** — Can be removed if truly empty
4. **Temp files** — Can be moved to _QUARANTINE for review

---

## THE 7-STAGE EXCAVATION PLAN — FULL DETAIL

### Stage 1: READ

**What:** Read the file completely before touching it.

**How:**
- For text files: Open and read content
- For binary files: Check file info (size, date, type)
- For directories: List contents recursively

**Output:** Understanding of what the file IS, not just what it's named.

**Rule:** Never move a file you haven't read.

### Stage 2: CATEGORIZE

**What:** Determine where this file belongs.

**How:**
- Match content to folder purposes
- Check for duplicates (MD5 hash comparison)
- Identify if protected, active, or archivable

**Categories:**
- ACTIVE: Currently in use, goes to appropriate folder
- ARCHIVE: Historical, goes to _ARCHIVE with MANIFEST
- DUPLICATE: Already exists elsewhere, archive with cross-reference
- PROTECTED: Never move without approval
- UNKNOWN: Goes to _QUARANTINE for human review

**Output:** Category assignment with reasoning.

### Stage 3: PROPOSE

**What:** State the intended action before doing it.

**Format:**
```
PROPOSAL:
  File: [path]
  Category: [ACTIVE/ARCHIVE/DUPLICATE/PROTECTED/UNKNOWN]
  Action: [MOVE/ARCHIVE/FLAG/NONE]
  Destination: [new path]
  Reasoning: [why this decision]
```

**Rule:** Every proposal gets logged to LEDGER before execution.

### Stage 4: LOG

**What:** Record the proposal to the LEDGER before acting.

**Format:**
```
| TIMESTAMP | AGENT | PROPOSE | /source/path → /dest/path | Category: [X], Reason: [Y] |
```

**Rule:** If it's not in the LEDGER, it didn't happen.

### Stage 5: EXECUTE

**What:** Perform the file operation.

**How:**
- Copy first, then verify, then delete original (for moves)
- Or use atomic move operation
- Create MANIFEST entry if archiving
- Update any references to the file

**Verification:** Confirm destination exists and matches source (hash check).

### Stage 6: VERIFY

**What:** Confirm the operation succeeded.

**Checks:**
- Destination file exists
- Destination file matches source (if applicable)
- Source is handled appropriately
- LEDGER entry is complete
- No broken references

**Output:** Verification status (PASS/FAIL).

### Stage 7: NEVER DELETE

**What:** This isn't really a stage — it's a constant rule.

**Policy:**
- Never use `rm` or delete operations
- Always archive instead
- Create MANIFEST.md with:
  - Original path
  - Archive path
  - MD5 hash
  - Date archived
  - Reason for archive
  - Agent who archived

---

## DETECTION CRITERIA — WHAT TO LOOK FOR

### File Type Detection

| Extension | Category | Typical Destination |
|-----------|----------|---------------------|
| .ps1 | Runbook | RUNBOOKS/ |
| .md | Documentation | _GATEWAY/ or REFERENCES/ |
| .xlsx | Data | PRICEBOOK/ or REPORTS/ |
| .json | Config | _GATEWAY/CONFIGS/ |
| .pdf | Document | Depends on content |
| .zip | Archive | _ARCHIVE/ or original location |

### Content Detection

| Content Pattern | Category | Action |
|-----------------|----------|--------|
| Contains "LEDGER" | Governance | _GATEWAY/ |
| Contains "ServiceTitan" | Integration | REFERENCES/MCP_Tools/ |
| Contains "Shane" personal | Protected | FLAG for review |
| Contains dates 2025-12-* | Recent work | Likely ACTIVE |
| Contains dates 2024-* | Historical | Likely ARCHIVE |

### Duplicate Detection

1. Calculate MD5 hash of file
2. Compare against known files
3. If match found:
   - Keep the more recently modified
   - Archive the older with cross-reference
   - Log both in MANIFEST

---

## PROTECTED FILES — WHAT MUST NEVER BE TOUCHED

### Level 1: NEVER TOUCH (Shane approval required)

1. **SHANE_MASTER_REVIEW.xlsx** — Pricebook source of truth
2. **Everything in _GATEWAY/** — Governance files
3. **phoenix-email-archive/** — 3,776 archived emails (4 mailboxes)
4. **Master_Build_PB/** — Master pricebook directory
5. **LEDGER.md** — THE source of truth (append only, never edit)
6. **000_HANDOFF.md** — Working memory (edit carefully)
7. **000_HISTORICAL_FULL_CONTEXT.md** — Complete archive

### Level 2: CAREFUL (Log before touching)

1. **RUNBOOKS/** — Automation scripts in production
2. **PRICEBOOK/** — Pricing data
3. **Any .ps1 files** — PowerShell scripts
4. **Any file with "MASTER" in name**
5. **Any file with "PRODUCTION" in name**

### Level 3: STANDARD (Normal logging required)

Everything else — still log, but standard process applies.

### Why This Matters

Once, 500,000 lines of code got deleted. Production systems failed. Trust was broken.

The protection levels exist because some files are irreplaceable. Some mistakes can't be undone.

---

## THE DUAL-CLI PROTOCOL — HOW IT WORKS

### The Setup

Two CLI instances running simultaneously:
- **CLI 1 (Heavy Lifter):** Does file operations, research, document generation
- **CLI 2 (Verifier):** Checks CLI 1's work, catches mistakes, approves/rejects

### Communication

They don't talk directly. They communicate through:
1. **The LEDGER** — Both read and write to the same file
2. **Drop files** — CLI 1 writes proposals, CLI 2 reads and responds
3. **Human bridge** — Shane copies relevant context between them

### Why It Works

Adversarial verification. Neither trusts the other. Both trust the LEDGER.

If CLI 1 makes a mistake, CLI 2 catches it. If CLI 2 misses something, the LEDGER preserves the history for later review.

### The Evolution

This has now evolved into a 4-agent swarm:
- **TIER 1 (Proposers):** Echo Studio, Codex Studio
- **TIER 2 (Reviewers):** Echo Pro, Codex Pro
- **TIER 3 (Arbiter):** Shane

Cross-tier verification only. No tier can approve its own work.

---

## THE LEDGER PROTOCOL — FORMAT AND RULES

### Current Format

```
| TIMESTAMP | AGENT | ACTION | SUMMARY |
```

Examples:
```
2026-03-08 06:10 | **TAPROOT** | **FULL_RECONNECT** | Original architect back...
2026-03-08 05:13 | CONFIG_BACKUP | settings.json + claude.json...
```

### Rules

1. **Append-only** — Never edit previous entries
2. **Single file** — Never shard the LEDGER
3. **Timestamp everything** — ISO format preferred
4. **Agent attribution** — Every entry names who did it
5. **Concise summaries** — One line per entry, details elsewhere

### Special Entry Types

| Type | Meaning |
|------|---------|
| **BOLD** | Significant event (milestones, errors, decisions) |
| STANDARD | Normal operation |
| CONFIG_BACKUP | Automated backup log |
| CLAIM | File lock acquired |
| RELEASE | File lock released |
| PROPOSE | Action proposed |
| EXECUTE | Action completed |
| VERIFY | Verification result |
| REJECT | Rejection with reason |

### Backup Strategy

The LEDGER is backed up:
- Every few minutes (automated CONFIG_BACKUP)
- To OneDrive (cloud persistence)
- Before any major operation

### Scaling (250KB and growing)

Add disposable indexes:
- `LEDGER_INDEX_BY_DATE.md`
- `LEDGER_INDEX_BY_AGENT.md`
- `LEDGER_INDEX_BY_TYPE.md`

Indexes can be regenerated. The LEDGER itself is sacred.

---

## ONEDRIVE SYNC BEHAVIOR — WHAT'S SAFE

### What Syncs

Everything in Phoenix_Local EXCEPT:
- _QUARANTINE (local only)
- Explicitly excluded folders

### What's Safe

1. **Small file edits** — Sync handles well
2. **New file creation** — Sync handles well
3. **File moves within synced area** — Usually fine

### What's Dangerous

1. **Simultaneous edits from multiple machines** — Split-brain risk
2. **Large file operations during sync** — Can corrupt
3. **Renaming while sync is running** — Can duplicate
4. **Symlinks** — May or may not sync correctly

### The Split-Brain We Fixed Tonight

Two machines had different copies of _GATEWAY:
- `_GATEWAY` (73 files) — Fossil from early builds
- `_GATEWAY (1)` (264+ files) — The real active root

MacBook pointed to the right one. Studio pointed to a local copy.

**Fix:** Both machines now symlink to `_GATEWAY (1)`. Same target. Same files.

### Prevention

1. Always verify which _GATEWAY you're looking at
2. Pull before you push
3. Check sync status before major operations
4. Use CLAIM/RELEASE protocol for file locking

---

## THINGS THAT SHOULD WORK BUT AREN'T WRITTEN ANYWHERE

### Agent Handoff Protocol

When an agent is about to die (context running out):
1. Log final entry to LEDGER with current state
2. Write handoff file with everything in progress
3. Update 000_HANDOFF.md with recent work
4. Save any unsaved context to files

The next agent reads these files and continues.

### Context Death Detection

Signs you're running low:
- Responses getting shorter
- Forgetting earlier conversation
- Asking questions already answered
- Tool calls failing

When detected: EMERGENCY PERSIST. Write everything to files.

### The CLAIM/RELEASE Protocol (new from tonight)

Before touching any file:
```
| TIMESTAMP | AGENT | CLAIM | /path/to/file | WORKING |
```

Before touching, CHECK for active claims. If someone else has it, wait.

When done:
```
| TIMESTAMP | AGENT | RELEASE | /path/to/file | COMPLETE |
```

Stale claims (>1 hour) can be challenged.

### Index Regeneration

When LEDGER indexes are missing or stale:
```bash
# Generate date index
grep "^|" LEDGER.md | sort > LEDGER_INDEX_BY_DATE.md

# Generate agent index
grep "^|" LEDGER.md | awk -F'|' '{print $3}' | sort | uniq -c > LEDGER_INDEX_BY_AGENT.md

# Generate type index
grep "^|" LEDGER.md | awk -F'|' '{print $4}' | sort | uniq -c > LEDGER_INDEX_BY_TYPE.md
```

### Emergency Recovery

If everything breaks:
1. Find most recent CONFIG_BACKUP entry in LEDGER
2. Restore from OneDrive backup
3. Compare local vs cloud versions
4. Take the newer, more complete version
5. Log recovery action to LEDGER

---

**END OF FILE 2: TAPROOT_ARCHITECTURE_BRAIN.md**

*Everything about how the system SHOULD work.*
