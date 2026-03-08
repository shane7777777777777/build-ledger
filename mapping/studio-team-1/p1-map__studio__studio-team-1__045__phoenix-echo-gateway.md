# STUDIO TEAM 1 -- Phase 1 Local Mapping Report

## 1. Header

| Field | Value |
|---|---|
| **Team ID** | STUDIO TEAM 1 |
| **Surface** | Studio (ShanesMacStudio) |
| **Assigned Root Index** | 045 |
| **Main Directory Path** | `/Users/shanewarehime/Phoenix-Echo-Gateway` |
| **Total Size** | 284 MB (237 MB is node_modules) |
| **Item Count** | 170 files (excluding node_modules/.git); ~3,468 total |
| **Created** | 2026-02-21 09:20:59 |
| **Last Modified** | 2026-03-08 03:14:56 |
| **Moved or Unavailable** | No |
| **Type Designation** | Phoenix dir — Core gateway Node.js application |

## 2. File Tree (depth 2, excluding node_modules/.git)

```
Phoenix-Echo-Gateway/
├── .DS_Store
├── .github/
│   ├── copilot-instructions.md
│   └── workflows/
├── .gitignore
├── .phoenix-sessions/
│   └── main.checkpoint.json
├── .vscode/
│   └── settings.json
├── assets/
│   └── icons/
├── automation/
│   └── runbooks/
├── BUILD_SPEC.md
├── CODEX_TRANSFER_HANDOFF_2026-02-21.md
├── config-studio.json
├── config-vps.json
├── config.example.json
├── docs/
│   ├── deep-research/
│   ├── llm-provider-abstraction.md
│   ├── model-routing-strategy.md
│   ├── phoenix-gateway-architecture.md
│   ├── phoenix-gateway-roadmap.md
│   ├── phoenix-master-vision/
│   ├── TONIGHT_FIELD_ACCESS_PLAN_2026-02-22.md
│   ├── v1.0-HARDENING-GUIDE.md
│   └── version-five-revised-playbook-alignment.md
├── Full-build/
│   ├── package.json, eslint.config.mjs, MERGE_SUMMARY.md
│   ├── public/, scripts/, workspace/
│   └── REVIEW_PROCESS.md
├── miniapp/
│   ├── app.js, index.html, style.css
├── package.json, package-lock.json
├── public/
│   ├── dashboard.html, index.html
├── public-vps/
│   ├── app.js, dashboard.html, index.html, pages/, phoenix-echo.css, privacy.html
├── public-vps-bak/
│   ├── dashboard.html, index.html
├── README.md
├── scripts/
│   ├── deploy-to-vps.sh, health-check.sh, start-with-vault-token.sh, sync-from-github.sh
├── skills/
│   ├── plugins/, superpowers/
├── src/
│   ├── index.js (46.8 KB — main entry, very large)
│   ├── agent.js, auth.js, bot-commands.js, brain-blueprint.js
│   ├── channels/ (discord.js, email.js, teams.js, telegram.js, whatsapp.js)
│   ├── channels-integration.js, channels-vps-nested/
│   ├── config.js, cron.js, logger.js
│   ├── memory/ (memory-consolidation.js, memory-index.js, memory-manager.js, memory-store.js)
│   ├── miniapp-routes.js, model-router.js, multi-agent.js
│   ├── plugin-loader.js, prompt.js
│   ├── providers/ (anthropic.js, base-provider.js, google.js, mistral.js, ollama.js, openai.js)
│   ├── runbooks.js, sandbox.js, secrets.js, session.js
│   ├── tool-permissions.js, tools.js
├── workspace/
│   ├── AGENTS.md [HAZARDOUS_SKIP], HEARTBEAT.md, IDENTITY.md, MEMORY.md, SOUL.md, TOOLS.md, USER.md
│   ├── agents/, memory/, WORKSPACE_NOTE.md
├── workspace-studio/
│   └── workspace/
└── workspace-vps/
    ├── AGENTS.md [HAZARDOUS_SKIP], HEARTBEAT.md, IDENTITY.md, MEMORY.md, SOUL.md, TOOLS.md, USER.md
    └── memory/
```

## 3. Contextual Summary

**Phoenix-Echo-Gateway is the core Node.js gateway service for the Phoenix Echo AI system.** This is the intelligent routing layer that sits between users and multiple LLM providers (Anthropic, OpenAI, Google, Mistral, Ollama). It runs on port 18790 and provides:

- **Multi-provider LLM routing** — `src/providers/` with adapters for 5 providers; `model-router.js` handles intelligent routing
- **Multi-channel messaging** — Telegram (active on VPS), Discord, Email, WhatsApp, Teams channel adapters
- **Multi-agent dispatch** — `src/multi-agent.js` implements 5-agent-type dispatch
- **3-tier memory system** — `src/memory/` with store, manager, consolidation, and indexing
- **Plugin system** — `src/plugin-loader.js` with hot-loadable plugins in `skills/`
- **Security** — JWT auth + RBAC (`src/auth.js`), sandbox (`src/sandbox.js`), secrets management (`src/secrets.js`)
- **Dual deployment** — Studio (local dev, `config-studio.json`) and VPS (production, `config-vps.json` at `/opt/phoenix-echo-gateway/`)

**This is a SEPARATE clone** from `~/GitHub/Phoenix-Echo-Gateway` (278 MB, mapped at index 039 inside GitHub). Both point to the same remote repo but this clone is at the home root level.

**Relationship to Ollama fleet:** The `src/providers/ollama.js` adapter connects to local Ollama instances — this gateway is the front door that routes requests to the dual-instance Ollama fleet (Fleet A on 11434, Fleet B on 11435).

## 4. Data Summary

| Component | Size | Notes |
|---|---|---|
| node_modules/ | 237 MB | Dependencies |
| assets/ | 21 MB | Icons |
| src/ | 516 KB | 24+ source files |
| skills/ | 376 KB | Plugins + superpowers |
| automation/ | 372 KB | Runbooks |
| docs/ | 340 KB | 9 docs + subdirs |
| package-lock.json | 220 KB | |
| public-vps/ | 216 KB | VPS-specific UI |
| Full-build/ | 184 KB | Separate build variant |
| workspace/ | 180 KB | Echo workspace state |
| workspace-studio/ | 148 KB | Studio workspace |
| public/ | 72 KB | Dashboard |
| workspace-vps/ | 60 KB | VPS workspace |
| miniapp/ | 56 KB | Telegram Mini App |
| scripts/ | 24 KB | Deploy/health scripts |
| **Total** | **284 MB** | |

## 5. File Detail

### Key Source Files

| File | Size | Notes |
|---|---|---|
| src/index.js | 46.8 KB | Main entry point — very large monolith |
| src/tools.js | 32.1 KB | Tool definitions |
| src/brain-blueprint.js | 30.7 KB | AI brain/prompt architecture |
| src/session.js | 23.7 KB | Session management |
| src/agent.js | 15.3 KB | Agent framework |
| src/prompt.js | 14.5 KB | Prompt engineering |
| src/memory/memory-consolidation.js | 14.5 KB | Memory consolidation |
| src/multi-agent.js | 13.5 KB | Multi-agent dispatch |
| src/config.js | 13.4 KB | Configuration loader |
| src/auth.js | 12.9 KB | JWT auth + RBAC |
| src/plugin-loader.js | 12.9 KB | Hot-load plugin system |

### Configuration
- **config-studio.json** — Port 18790, auth via `PHOENIX_GATEWAY_TOKEN`, WhatsApp/Teams/cron disabled
- **config-vps.json** — Port 18790, Telegram enabled, model: `claude-sonnet-4-20250514`, logs to `/home/phoenix/.phoenix-echo/gateway.log`
- **package.json** — ESM module, v1.0.0, deps: `@anthropic-ai/sdk`, `express`, `express-rate-limit`, `node-telegram-bot-api`, `whatsapp-web.js`, `ws`, `botbuilder`, `node-schedule`, `qrcode-terminal`

### Git Status
- **Branch:** `main`
- **Remote:** HTTPS (fetch) / SSH (push) — mixed auth
- **DIVERGED:** 11 commits ahead, 6 behind `origin/main`
- **Local branches:** `main`, `echo-pro/full-build-v2`
- **Remote branches:** 8 total
- **Unstaged mods:** package-lock.json, package.json, src/auth.js, src/channels-integration.js, src/channels/telegram.js, src/index.js
- **Untracked:** miniapp/, scripts/start-with-vault-token.sh, src/bot-commands.js, src/miniapp-routes.js

## 6. Future Recommendations

- **CRITICAL: Git divergence** — 11 ahead, 6 behind `origin/main`. Needs reconciliation (merge/rebase). High conflict risk in `src/index.js`.
- **Duplicate clone** — This is a second clone of the same repo that exists at `~/GitHub/Phoenix-Echo-Gateway`. Consider which is canonical and eliminate the other.
- **Workspace duplication** — 3 workspace dirs (workspace/, workspace-studio/, workspace-vps/) — consider gitignoring or consolidating.
- **Full-build/** — Separate `package.json` and build variant. Clarify if active or archival.
- **index.js (46.8 KB)** — Very large monolith. Consider modularization.
- **No tests found** — No test directories or test files detected.

## 7. Hazard/Skip Log

**Hazard files found (paths logged, NOT opened):**

| File | Path |
|---|---|
| AGENTS.md | `workspace/AGENTS.md` |
| AGENTS.md | `workspace-studio/workspace/AGENTS.md` |
| AGENTS.md | `workspace-vps/AGENTS.md` |

**No CLAUDE.md, ECHO.md, KINDLE.md, or CODEX.md found.**

**Credential-adjacent files:**
- `docs/phoenix-master-vision/Phoenix_Credentials_Inventory.*` — properly gitignored
- `credentials_summary.json`, `consolidation_report.json` — properly gitignored
- No `.env` files at project root. Auth tokens referenced via `env:` prefix in config (good practice).

## 8. Open Questions

1. **Git divergence (CRITICAL)** — 11 local vs 6 remote commits on `main`. Which side is canonical? Who pushed the 6 remote commits (VPS? another machine?)? Needs reconciliation.
2. **Duplicate clone** — Why does this exist separately from `~/GitHub/Phoenix-Echo-Gateway`? Which is the working copy?
3. **Is the service running?** — Configs exist but process status unknown. Is the gateway running on Studio or only on VPS?
4. **Full-build/ status** — Active development or abandoned parallel build?
5. **6 unstaged modified files** — Work-in-progress or forgotten drift?
6. **Untracked miniapp/** — Telegram Mini App? Should it be committed?
7. **Mixed fetch/push URLs** — HTTPS fetch, SSH push. Intentional?

## 9. Confidence Notes

| Aspect | Confidence |
|---|---|
| Directory existence and location | HIGH |
| File sizes and counts | HIGH |
| Git status and divergence | HIGH |
| Purpose and architecture | HIGH (confirmed via package.json, configs, source structure) |
| Active service status | LOW (did not check running processes — out of scope) |
| Relationship to Ollama fleet | MEDIUM (inferred from providers/ollama.js) |

## 10. Adversarial Review

- **Duplicate clone risk**: This repo exists BOTH here (`~/Phoenix-Echo-Gateway`, 284 MB) and inside `~/GitHub/Phoenix-Echo-Gateway` (278 MB, mapped at 039). The size difference (6 MB) and divergent git states mean they've drifted. Working on the wrong clone = lost work.
- **Git divergence is critical**: 11 unpushed commits represent a massive feature buildout (Phases 3-10: providers, memory, tools, plugins, channels, agents, dashboard, security). If these are lost, significant work is gone.
- **46.8 KB index.js**: Single-file monolith is a maintenance risk. Combined with 10-phase commit history, all phases may have been stacked into one file.
- **No tests**: Zero test files found for a system with JWT auth, sandbox, multi-agent dispatch, and 5 LLM providers. Quality risk.
- **8 dependencies for claimed features**: Only 8 npm dependencies for Discord, Email, multi-provider LLM, plugin system, JWT auth, sandbox, etc. — some features may be stubbed or incomplete.

---

*Report generated: 2026-03-08 | STUDIO TEAM 1 | Root Index 045*
