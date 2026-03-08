# build-ledger

> Temporary CLI collaboration ledger for the active build session.
> Log entries, notes, blockers, and team comms here. Delete this repo when the build is complete.

---

## How to Use (CLI)

### 1. Clone the repo
```bash
git clone https://github.com/shane7777777777777/build-ledger.git
cd build-ledger
```

### 2. Run the interactive ledger script
```bash
bash ledger.sh
```

### 3. Log a quick entry directly from CLI
```bash
bash ledger.sh log "YOUR NAME" "Your message or status here"
```

### 4. Always pull before logging to stay in sync
```bash
git pull && bash ledger.sh log "YOUR NAME" "Your message"
```

---

## Ledger Format

All timestamped entries go into LOG.md in this format:

```
[YYYY-MM-DD HH:MM] NAME :: MESSAGE
```

---

## Status Board

| Name | Status | Last Update |
|------|--------|-------------|
| —    | —      | —           |

Update your row directly here or via the CLI script.

---

## Active Tasks / Blockers

- [ ] Add tasks here as they come up
- [ ] Tag: BLOCKED / IN PROGRESS / DONE

---

## Pinned Notes

Use LOG.md for all timestamped comms. Use this section for persistent pinned notes only.

---

## Cleanup Reminder

This repo is TEMPORARY. Once the build wraps:
1. Export or archive any logs you need to keep
2. Delete this repository from GitHub Settings - Danger Zone

---

*build-ledger - session tool only*
