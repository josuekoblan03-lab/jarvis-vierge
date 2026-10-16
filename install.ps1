# install.ps1 - OPTIONNEL
# Installe les plugins au niveau GLOBAL de ton Claude Code (ajoute 4 marketplaces + les plugins).
# Les agents/skills/commandes de base sont deja dans .claude/ : ce script ajoute la panoplie complete.
# Lance-le depuis ce dossier :  ./install.ps1

Write-Host "== Jarvis : installation des plugins ==" -ForegroundColor Cyan

# 1) Marketplaces
$marketplaces = @(
  "anthropics/claude-code",
  "obra/superpowers-marketplace",
  "wshobson/agents",
  "anthropics/claude-plugins-official"
)
foreach ($m in $marketplaces) {
  Write-Host "Ajout marketplace : $m"
  claude plugin marketplace add $m
}

# 2) Plugins (nom@marketplace)
$plugins = @(
  # claude-code-plugins
  "frontend-design@claude-code-plugins","code-review@claude-code-plugins","commit-commands@claude-code-plugins",
  "feature-dev@claude-code-plugins","hookify@claude-code-plugins","pr-review-toolkit@claude-code-plugins",
  "security-guidance@claude-code-plugins","plugin-dev@claude-code-plugins","agent-sdk-dev@claude-code-plugins",
  # superpowers-marketplace
  "superpowers@superpowers-marketplace","superpowers-chrome@superpowers-marketplace",
  # claude-code-workflows
  "frontend-mobile-development@claude-code-workflows","ui-design@claude-code-workflows","meigen-ai-design@claude-code-workflows",
  "brand-landingpage@claude-code-workflows","javascript-typescript@claude-code-workflows","accessibility-compliance@claude-code-workflows",
  "full-stack-orchestration@claude-code-workflows","application-performance@claude-code-workflows","comprehensive-review@claude-code-workflows",
  "debugging-toolkit@claude-code-workflows","code-refactoring@claude-code-workflows","seo-technical-optimization@claude-code-workflows",
  "tdd-workflows@claude-code-workflows","git-pr-workflows@claude-code-workflows",
  # claude-plugins-official
  "claude-code-setup@claude-plugins-official","claude-md-management@claude-plugins-official","code-simplifier@claude-plugins-official",
  "code-modernization@claude-plugins-official","skill-creator@claude-plugins-official","ralph-loop@claude-plugins-official",
  "typescript-lsp@claude-plugins-official","mcp-server-dev@claude-plugins-official","context7@claude-plugins-official",
  "playwright@claude-plugins-official","github@claude-plugins-official","firebase@claude-plugins-official",
  "figma@claude-plugins-official","vercel@claude-plugins-official","cloudflare@claude-plugins-official",
  "netlify-skills@claude-plugins-official","stripe@claude-plugins-official","supabase@claude-plugins-official",
  "prisma@claude-plugins-official","sentry@claude-plugins-official","chrome-devtools-mcp@claude-plugins-official",
  "sanity@claude-plugins-official","notion@claude-plugins-official","mongodb@claude-plugins-official",
  "expo@claude-plugins-official","ai-plugins@claude-plugins-official","adobe-for-creativity@claude-plugins-official",
  "linear@claude-plugins-official"
)
foreach ($p in $plugins) {
  Write-Host "Installation : $p"
  claude plugin install $p
}

Write-Host ""
Write-Host "== Termine. Relance Claude Code pour charger les plugins. ==" -ForegroundColor Green
Write-Host "Certains plugins MCP (Supabase, GitHub, Vercel, Notion...) demandent une auth via /mcp." -ForegroundColor Yellow
