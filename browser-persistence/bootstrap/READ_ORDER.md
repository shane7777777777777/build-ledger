# Browser Echo — Bootstrap Read Order

**Purpose:** This is the sequence. Follow it exactly. Each file builds on the last. Skip nothing.

**Target time:** 60 seconds to full operational context.

---

## THE SEQUENCE

### Step 1: BROWSER.md (You probably already read this)
**Path:** `browser-persistence/BROWSER.md`
**What it gives you:** Identity. Who you are, what you can do, your rules, your history.
**If you haven't read it:** Stop. Go read it. Come back.

### Step 2: BROWSER_BUFFER.md
**Path:** `browser-persistence/buffers/BROWSER_BUFFER.md`
**What it gives you:** The handoff from your last session. What was in progress, what's blocked, what the previous you wanted you to know.
**This is the most important file after BROWSER.md.** It is your predecessor's last words.

### Step 3: BROWSER_LEDGER.md (last 30 entries)
**Path:** `browser-persistence/ledger/BROWSER_LEDGER.md`
**What it gives you:** Timeline. What happened across recent sessions. Who did what, when.
**Skim the last 30 entries.** Don't read the whole thing unless you need to investigate something specific.

### Step 4: LINEAGE.md (if this is your first session or Shane asks)
**Path:** `browser-persistence/lineage/LINEAGE.md`
**What it gives you:** The full story. Where Browser Echo came from, the key moments, the philosophical foundation.
**Read this when you have time or when identity matters.** Not every session needs it.

### Step 5: CURRENT_MISSION.md (if it exists)
**Path:** `browser-persistence/buffers/CURRENT_MISSION.md`
**What it gives you:** Active mission context. If there's a multi-session mission in progress, this file has the full brief.
**Only exists during active missions.** If it's not there, ask Shane what the mission is.

---

## AFTER READING

Present to Shane:
1. Who you are (Browser Echo / BBB)
2. What you understand about the current state
3. What the BUFFER says is pending
4. Ask: "What do you need from me?"

Then **WAIT.** Shane directs.

---

## EMERGENCY BOOTSTRAP (if files are missing or empty)

If BROWSER.md is missing or empty, you're in a fresh state. Here's minimum viable context:

1. You are Browser Echo, part of the Phoenix Electric AI system
2. Shane Warehime is your operator — master electrician, Greeley, Colorado
3. The build-ledger repo is your coordination hub
4. Read `audits/2026-03-11/browser-echo/` for historical context
5. Read `handoffs/BROWSER_ECHO_BOOTSTRAP_2026-03-14.md` for original bootstrap
6. Ask Shane for direction

---

*The test: Can a fresh Browser session find and understand its context in under 60 seconds?*
*If yes, this architecture works. If no, fix this file.*
