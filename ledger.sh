#!/usr/bin/env bash
# ============================================================
# ledger.sh — build-ledger CLI tool
# Usage:
#   bash ledger.sh                         (interactive mode)
#   bash ledger.sh log "NAME" "MESSAGE"    (quick log entry)
#   bash ledger.sh read                    (show recent log)
#   bash ledger.sh status                  (show repo status)
# ============================================================

set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LOG_FILE="${REPO_DIR}/LOG.md"
DATE="$(date '+%Y-%m-%d')"
TIME="$(date '+%H:%M')"

# ---- helpers -----------------------------------------------

log_entry() {
  local name="$1"
  local message="$2"
  local entry="[${DATE} ${TIME}] ${name} :: ${message}"
  echo "${entry}" >> "${LOG_FILE}"
  git -C "${REPO_DIR}" add "${LOG_FILE}"
  git -C "${REPO_DIR}" commit -m "log: ${name} @ ${DATE} ${TIME}"
  git -C "${REPO_DIR}" push
  echo ""
  echo "  Logged and pushed:"
  echo "  ${entry}"
  echo ""
}

show_log() {
  echo ""
  echo "=== Recent Log Entries ==================================="
  if [[ -f "${LOG_FILE}" ]]; then
    tail -n 30 "${LOG_FILE}"
  else
    echo "  (no entries yet)"
  fi
  echo "==========================================================="
  echo ""
}

pull_latest() {
  echo "  Pulling latest from remote..."
  git -C "${REPO_DIR}" pull --rebase 2>/dev/null || git -C "${REPO_DIR}" pull
}

interactive_mode() {
  echo ""
  echo "=============================="
  echo "  build-ledger CLI"
  echo "=============================="
  pull_latest
  show_log

  read -rp "  Your name: " NAME
  if [[ -z "${NAME}" ]]; then
    echo "  No name provided. Exiting."
    exit 1
  fi

  read -rp "  Log message: " MESSAGE
  if [[ -z "${MESSAGE}" ]]; then
    echo "  No message provided. Exiting."
    exit 1
  fi

  log_entry "${NAME}" "${MESSAGE}"
}

# ---- main --------------------------------------------------

MODE="${1:-interactive}"

case "${MODE}" in
  log)
    if [[ $# -lt 3 ]]; then
      echo "Usage: bash ledger.sh log \"NAME\" \"MESSAGE\""
      exit 1
    fi
    pull_latest
    log_entry "$2" "$3"
    ;;
  read)
    pull_latest
    show_log
    ;;
  status)
    echo ""
    git -C "${REPO_DIR}" log --oneline -10
    echo ""
    ;;
  interactive|*)
    interactive_mode
    ;;
esac
