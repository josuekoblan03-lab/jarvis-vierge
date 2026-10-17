#!/usr/bin/env python3
"""Bloque UNIQUEMENT l'écriture directe d'un fichier .env (secrets).
Toutes les autres écritures via l'outil Write sont autorisées.
Autorise .env.example (committable, sans valeur)."""
import json, sys, os

try:
    data = json.load(sys.stdin)
except Exception:
    sys.exit(0)

fp = (data.get("tool_input", {}) or {}).get("file_path", "") or ""
base = os.path.basename(fp).lower()

blocked = base == ".env" or (base.startswith(".env.") and base != ".env.example")

if blocked:
    print(json.dumps({
        "hookSpecificOutput": {
            "hookEventName": "PreToolUse",
            "permissionDecision": "deny",
            "permissionDecisionReason": "Ecriture directe d'un .env bloquee (securite). Passe par /generer-env ou le coffre secrets/."
        }
    }))
sys.exit(0)
