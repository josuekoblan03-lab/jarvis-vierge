# Ton Jarvis de dev perso

Un workspace Claude Code prêt à l'emploi : agents spécialisés, skills de méthode et de design, commandes, garde-fous (hooks) et serveurs MCP déjà installés. Ouvre ce dossier dans Claude Code et tout se charge automatiquement, **sans rien installer au niveau global**.

---

## Prérequis

- **Claude Code** installé (desktop, VS Code, ou CLI) avec un abonnement Claude actif.
- **Node.js** (version LTS) : nécessaire pour les serveurs MCP (`npx`).
- **Git** installé.
- **Python** (pour les hooks de sécurité).

---

## Démarrage en 3 étapes

1. **Tes clés.** Copie `.env.example` en `.env` et remplis tes propres valeurs (voir les commentaires dans le fichier). Le `.env` n'est jamais commité.
   ```
   cp .env.example .env
   ```
   (Tu peux laisser vides les clés que tu n'utilises pas encore. Les serveurs MCP qui en ont besoin ne se connecteront simplement pas tant que la clé est absente.)

2. **Ton contexte.** Ouvre `CLAUDE.md`, remplis les sections « Qui je suis » et « Comment tu dois m'aider ». Puis remplis `context/CONTEXT.md`.

3. **Lance Claude Code** dans ce dossier et tape `/prime`. Claude charge ton contexte et confirme qu'il est prêt.

À partir de là, pour créer un projet : `/nouveau-projet`. Pour reprendre un projet existant : `/reprendre`.

---

## Qu'est-ce qu'il y a dedans

- **`.claude/agents/`** : des assistants spécialisés (frontend, Next.js, React, TypeScript, Python, backend, base de données, revue de code, debug, accessibilité, sécurité défensive…).
- **`.claude/skills/`** : des méthodes de travail que Claude applique (brainstorming, écriture de specs et de plans, TDD, debug systématique, design web, Tailwind…).
- **`.claude/commands/`** : des raccourcis (`/prime`, `/reprendre`, `/nouveau-projet`, `/commit`, `/code-review`, `/generate-tests`…).
- **`.claude/hooks/`** : des garde-fous automatiques (bloque les commandes dangereuses, empêche de committer une clé, protège tes `.env`).
- **`.mcp.json`** : les serveurs MCP (Supabase, GitHub, PostgreSQL, navigateur, mémoire, recherche web…).

---

## Pour aller plus loin : les plugins

Ce dossier contient les capacités de base en dur. Pour la panoplie complète de plugins (superpowers, intégrations Vercel/Supabase/etc.), voir **`PLUGINS.md`** et le script `install.ps1`.

---

## Astuce quotas (abonnement Pro)

L'abonnement Pro a des quotas serrés. Pour en tirer le maximum :
- Garde **Sonnet** par défaut (change de modèle seulement quand c'est vraiment nécessaire).
- Fais des **sessions courtes et ciblées**, tape `/clear` entre deux tâches sans rapport.
- Utilise la **continuité par fichiers** : à la fin d'une session dis « à demain », et reprends avec `/reprendre` dans une conversation neuve. C'est plus rapide et plus économe qu'une conversation qui s'allonge.
