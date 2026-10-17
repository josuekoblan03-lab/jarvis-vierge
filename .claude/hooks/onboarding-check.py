#!/usr/bin/env python3
"""SessionStart : si le contexte de l'apprenant n'est pas encore rempli,
injecte une consigne pour lancer l'onboarding automatique (/demarrer).
Une fois CONTEXT.md rempli, ne fait plus rien."""
import json, sys, os

root = os.environ.get("CLAUDE_PROJECT_DIR") or os.getcwd()
ctx = os.path.join(root, "context", "CONTEXT.md")

need = True
try:
    with open(ctx, encoding="utf-8") as f:
        t = f.read()
    # Marqueurs du modèle vierge : s'ils ont disparu, l'onboarding est fait.
    if "[Ton nom" not in t and "[Tes activités" not in t:
        need = False
except Exception:
    need = True

if need:
    msg = (
        "ONBOARDING REQUIS. Le contexte de l'apprenant n'est pas encore rempli. "
        "Des le premier message, accueille l'apprenant chaleureusement en francais, explique en une phrase "
        "que tu vas lui poser quelques questions pour configurer son Jarvis, puis lance la commande /demarrer. "
        "Pose les questions UNE PAR UNE. A la fin, enregistre TOUT automatiquement toi-meme "
        "(context/CONTEXT.md, la section « Qui je suis » et les preferences de CLAUDE.md, puis git init si besoin et un premier commit). "
        "L'apprenant ne doit taper AUCUNE commande git, env ou terminal : tu t'occupes de tout."
    )
    print(json.dumps({
        "hookSpecificOutput": {
            "hookEventName": "SessionStart",
            "additionalContext": msg
        }
    }))
sys.exit(0)
