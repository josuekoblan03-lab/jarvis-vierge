# Plugins

Les plugins ne sont pas inclus dans ce dossier : ils s'installent au niveau **global** de ton Claude Code (ils vivent via des « marketplaces »). Les agents, skills et commandes de base sont déjà copiés dans `.claude/`, donc tu peux travailler sans eux. Installe-les quand tu veux la panoplie complète.

## Installation rapide

Lance le script fourni (Windows PowerShell) :

```powershell
./install.ps1
```

Ou fais-le à la main : d'abord ajoute les 4 marketplaces, puis installe les plugins voulus.

## Les 4 marketplaces

```
claude plugin marketplace add anthropics/claude-code
claude plugin marketplace add obra/superpowers-marketplace
claude plugin marketplace add wshobson/agents
claude plugin marketplace add anthropics/claude-plugins-official
```

| Marketplace (nom) | Dépôt GitHub |
|---|---|
| `claude-code-plugins` | anthropics/claude-code |
| `superpowers-marketplace` | obra/superpowers-marketplace |
| `claude-code-workflows` | wshobson/agents |
| `claude-plugins-official` | anthropics/claude-plugins-official |

## Les plugins (groupés par marketplace)

**claude-code-plugins** — outillage Claude Code : `frontend-design`, `code-review`, `commit-commands`, `feature-dev`, `hookify`, `pr-review-toolkit`, `security-guidance`, `plugin-dev`, `agent-sdk-dev`.

**superpowers-marketplace** — la méthode « superpowers » (brainstorming, specs, plans, TDD, debug) : `superpowers`, `superpowers-chrome`.

**claude-code-workflows** — workflows et agents dev/design : `frontend-mobile-development`, `ui-design`, `meigen-ai-design`, `brand-landingpage`, `javascript-typescript`, `accessibility-compliance`, `full-stack-orchestration`, `application-performance`, `comprehensive-review`, `debugging-toolkit`, `code-refactoring`, `seo-technical-optimization`, `tdd-workflows`, `git-pr-workflows`.

**claude-plugins-official** — intégrations officielles : `claude-code-setup`, `claude-md-management`, `code-simplifier`, `code-modernization`, `skill-creator`, `ralph-loop`, `typescript-lsp`, `mcp-server-dev`, `context7`, `playwright`, `github`, `firebase`, `figma`, `vercel`, `cloudflare`, `netlify-skills`, `stripe`, `supabase`, `prisma`, `sentry`, `chrome-devtools-mcp`, `sanity`, `notion`, `mongodb`, `expo`, `ai-plugins`, `adobe-for-creativity`, `linear`.

## Syntaxe d'installation d'un plugin

```
claude plugin install <nom-du-plugin>@<marketplace>
```

Exemple : `claude plugin install superpowers@superpowers-marketplace`

> Certains plugins (Supabase, GitHub, Vercel, Figma, Notion…) exposent des serveurs MCP qui demandent une authentification. Tu l'autorises via `/mcp` dans une session Claude Code interactive.
