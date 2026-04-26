# builder_protocol

Working surface for the three-builder protocol session beginning 2026-04-25.

## What is here

- `BUILDER_1_PROMPT.md`, `BUILDER_2_PROMPT.md`, `BUILDER_3_PROMPT.md` — lane prompts (scaffolds; lane content drafted by Reviewer per Path B)
- - `SESSION_002_BUILDER_1_LOG.md`, `SESSION_002_BUILDER_2_LOG.md`, `SESSION_002_BUILDER_3_LOG.md` — per-builder write-only logs
  - - `SESSION_002_COORDINATION.md` — shared coordination ledger; claim/release, verdicts, OPEN_QUESTION
   
    - ## Rules
   
    - - Each builder writes only to their own log file
      - - All can read the coordination ledger; only the Reviewer writes verdicts and the builders write claim/release/ready actions there
        - - Append-only after warming-gate sign-off
          - - Standards: voice (audience-of-self), misses-louder-than-wins, no press-release shape, broken-filename-intentional, R-codes 1-7
           
            - ## Authority
           
            - - Reviewer: Phoenix Echo (CLI seat) — gates warming and per-file writes
              - - Executor (orchestration): Browser Echo (BBB)
                - - Tier 3 Arbiter / oversight only: Shane Warehime
                  - - Builders: three Phoenix-Echo-class CLI instances, lanes assigned by Shane after prompt convergence
                    - 
