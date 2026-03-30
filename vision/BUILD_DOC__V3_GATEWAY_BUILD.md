# Build Doc — V3 Gateway Build
**Owner:** Shane Warehime, Phoenix Electric LLC | **Last Updated:** 2026-03-30
**Paired with:** PRODUCT_BIBLE__V3_GATEWAY_BUILD.md

---

## Roadmap

### Execution Order (Dependency-Driven)

```
PHASE 01 ─── Gateway UI Rebuild (foundation — unlocks everything)
   │
   ├──► PHASE 02 ─── Twin Peaks Local AI Fleet (requires Gateway UI)
   │       │
   │       ├──► PHASE 05 ─── RAG Pipeline (requires fleet for local generation)
   │       │       │
   │       │       └──► PHASE 08 ─── Fine-Tuning Pipeline (requires fleet + RAG baseline)
   │       │
   │       └──► (parallel after fleet)
   │
   ├──► PHASE 03 ─── Service Fusion Integration (parallel after Gateway)
   ├──► PHASE 04 ─── M365 Integration (parallel after Gateway)
   ├──► PHASE 06 ─── Security & Authentication (parallel after Gateway)
   └──► PHASE 07 ─── Voice AI (parallel after Gateway)
```

### Parallelization Strategy

After Phase 01 completes:
- **Wave 1:** Phase 02 (fleet) — must be next, unlocks 05 and 08
- **Wave 2:** Phases 03, 04, 06, 07 can ALL run in parallel (independent of each other)
- **Wave 3:** Phase 05 (RAG) — requires fleet from Phase 02
- **Wave 4:** Phase 08 (Fine-Tuning) — requires fleet + RAG

Browser can potentially run multiple phases in parallel browser sessions during Wave 2.

---

## Runbook Locations

| Phase | File | Lines | Path |
|-------|------|------:|------|
| 01 | PHASE_01_GATEWAY_UI.md | 2,164 | twin-peaks/05_RUNBOOKS/ |
| 02 | PHASE_02_TWIN_PEAKS.md | 1,671 | twin-peaks/05_RUNBOOKS/ |
| 03 | PHASE_03_SERVICE_FUSION.md | 866 | twin-peaks/05_RUNBOOKS/ |
| 04 | PHASE_04_M365.md | 1,703 | twin-peaks/05_RUNBOOKS/ |
| 05 | PHASE_05_RAG_PIPELINE.md | 1,835 | twin-peaks/05_RUNBOOKS/ |
| 06 | PHASE_06_SECURITY.md | 2,135 | twin-peaks/05_RUNBOOKS/ |
| 07 | PHASE_07_VOICE_AI.md | 1,521 | twin-peaks/05_RUNBOOKS/ |
| 08 | PHASE_08_FINETUNING.md | 1,182 | twin-peaks/05_RUNBOOKS/ |

### Existing V3 UI Code (reuse)
- Location: `twin-peaks/03_BUILD/gateway/`
- 20 files: ws-manager.js, store, design-system.css, 14 page modules
- Production quality — Browser-reviewed
- Phase 01 should build ON this, not from scratch

---

## Change Process

1. **Shane directs** — no autonomous execution without direction
2. **Browser executes** — task prompts with all content inline (no file access)
3. **Echo packages** — converts runbooks to Browser-ready prompts
4. **Codex reviews** — twice per phase only (plan + output). Not a loop.
5. **Shane tests** — browser test before deploy
6. **Deploy:** `scp -r` to VPS or git push to UNIFIED_STAGING

### Per-Phase Gate

Each phase runbook includes a **Gauntlet Checklist** and a **Rollback Plan**. The gate for each phase:

- [ ] All checklist items pass
- [ ] No CRITICAL findings unresolved
- [ ] Shane browser-tested (where applicable)
- [ ] Committed to appropriate branch
- [ ] Logged to LEDGER

---

## Blockers and Open Decisions

| Item | Status | Blocks |
|------|--------|--------|
| Phase 01 execution start | WAITING — Shane directing Browser | Everything |
| Embedding model decision | PENDING | Phase 05 (RAG) |
| Twilio account setup | PENDING | Phase 07 (Voice) |
| RunPod H100 access | PENDING | Phase 08 (Fine-Tuning) |
| GBP API OAuth approval (~14 day wait) | PENDING | Marketing (not a Gateway phase) |
| Studio Ollama models | AVAILABLE | Phase 02 can use existing Studio fleet via Tailscale |

---

## Standards

- **Color:** RED / BLACK / GOLD — mandatory
- **CSS:** Single file: phoenix-echo.css
- **JS:** Vanilla — no React, no Vue, no frameworks
- **WebSocket:** Standalone ws-manager.js with heartbeat and reconnect
- **Modules:** Each page module must implement cleanup()
- **Secrets:** Azure Key Vault only — never in code, never in env files committed to git
- **Archive-only:** No delete ever. Archive for delete / archive for save.
- **Filing convention:** `<class>__<scope>__<subject>__<yyyymmdd>.<ext>`

---

## NEEDS SHANE INPUT

- [ ] Confirm Phase 01 start — Browser ready?
- [ ] Which browser session gets Gateway (you mentioned "one for gate")?
- [ ] Should Browser work from UNIFIED_STAGING or twin-peaks repo?
- [ ] Any phases to skip or reorder?

---

*Written by Phoenix Echo (Opus 4.6) — 2026-03-30*
