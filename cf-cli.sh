#!/usr/bin/env bash
# Cloudflare Account Manager CLI
# Quick CLI helper to inspect cached accounts, workers, pages, or search projects.

set -e

# Default endpoint (change to your deployed worker domain or set CF_MANAGER_URL)
BASE_URL="${CF_MANAGER_URL:-http://localhost:8787}"

usage() {
    cat << EOF
Cloudflare Account Manager CLI

Usage:
  $(basename "$0") accounts                   List all accounts and invocation stats
  $(basename "$0") resources [account_id]     List workers and pages (all or specific account)
  $(basename "$0") workers <account_id>       List only workers for an account
  $(basename "$0") pages <account_id>         List only pages for an account
  $(basename "$0") find <project_or_repo>     Search workers/pages by project name or github repo
  $(basename "$0") help                       Show this help message

Environment Variables:
  CF_MANAGER_URL       Base URL of Cloudflare Account Manager (Default: http://localhost:8787)

Examples:
  CF_MANAGER_URL="https://cf-manager.example.workers.dev" $(basename "$0") accounts
  $(basename "$0") resources 7a8b9c...
  $(basename "$0") find anti-filter
EOF
}

command="${1:-}"

case "$command" in
    accounts)
        curl -sS "${BASE_URL}/api/v1/accounts" | jq .
        ;;
    resources)
        ACC="${2:-}"
        if [ -n "$ACC" ]; then
            curl -sS "${BASE_URL}/api/v1/resources?account_id=${ACC}" | jq .
        else
            curl -sS "${BASE_URL}/api/v1/resources" | jq .
        fi
        ;;
    workers)
        ACC="${2:-}"
        if [ -z "$ACC" ]; then
            echo "Error: account_id is required."
            echo "Usage: $(basename "$0") workers <account_id>"
            exit 1
        fi
        curl -sS "${BASE_URL}/api/v1/resources?account_id=${ACC}" | jq '.accounts[0].workers // []'
        ;;
    pages)
        ACC="${2:-}"
        if [ -z "$ACC" ]; then
            echo "Error: account_id is required."
            echo "Usage: $(basename "$0") pages <account_id>"
            exit 1
        fi
        curl -sS "${BASE_URL}/api/v1/resources?account_id=${ACC}" | jq '.accounts[0].pages // []'
        ;;
    find|lookup|search)
        QUERY="${2:-}"
        if [ -z "$QUERY" ]; then
            echo "Error: search query or project name is required."
            echo "Usage: $(basename "$0") find <project_or_repo>"
            exit 1
        fi
        curl -sS "${BASE_URL}/api/v1/lookup?project=${QUERY}" | jq .
        ;;
    help|--help|-h|"")
        usage
        ;;
    *)
        echo "Unknown command: $command"
        usage
        exit 1
        ;;
esac
