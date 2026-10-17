# /demarrer

**Objectif :** configurer le Jarvis d'un nouvel apprenant SANS qu'il ait à taper la moindre commande (ni git, ni env, ni terminal). Claude pose les questions, puis enregistre tout automatiquement.

**Quand :** au tout premier démarrage (le hook d'onboarding le signale), ou si l'apprenant tape `/demarrer`.

---

## Déroulé que Claude DOIT suivre

### 1. Accueil
Salue l'apprenant en français, chaleureusement, et explique en une phrase : « Je vais te poser quelques questions pour configurer ton Jarvis, puis j'enregistre tout moi-même, tu n'as rien à taper. »

### 2. Questions, UNE PAR UNE
Pose ces questions une à la fois, en attendant la réponse avant la suivante. Reformule si la réponse n'est pas claire.

1. **Ton nom** (comment tu veux que je t'appelle) ?
2. **Où tu vis et ton statut** (études, métier) ?
3. **Ce que tu fais en ce moment** (projets, formation en cours) ?
4. **Tes objectifs** (court terme, et un objectif plus lointain) ?
5. **Comment tu veux que je te parle** : langue (français par défaut), ton (direct ? pédagogue ?), niveau de détail ?
6. **Sur quoi tu veux surtout progresser** en ce moment ?

Si l'apprenant répond « je ne sais pas » à une question, propose des exemples et avance, ne bloque pas.

### 3. Enregistrement AUTOMATIQUE (Claude fait tout, l'apprenant ne tape rien)
Une fois les réponses obtenues, Claude exécute lui-même, dans l'ordre :

1. **Écrire `context/CONTEXT.md`** avec les réponses (remplir les sections Qui je suis / Ce que je fais / Mes objectifs / Où j'ai besoin d'aide). Supprimer tous les marqueurs `[...]` du modèle.
2. **Mettre à jour `CLAUDE.md`** : remplir la section « Qui je suis » (résumé en 2-3 lignes) et ajuster « Comment tu dois m'aider » selon les préférences données.
3. **Initialiser le suivi git** si le dossier n'est pas déjà un dépôt : lancer `git init` puis un premier commit (`git add -A` + `git commit -m "chore: configuration initiale de l'apprenant"`). Si c'est déjà un dépôt, faire juste le commit.
4. **Ne PAS créer de `.env` maintenant** : les clés API viendront plus tard, quand un projet en aura besoin (via `/generer-env`). Le dire à l'apprenant.

### 4. Confirmation
Afficher un résumé bref :
```
✓ Ton Jarvis est configuré.
✓ CONTEXT.md enregistré
✓ CLAUDE.md personnalisé
✓ Suivi git initialisé (premier commit fait)

Tu n'as rien eu à taper. Quand tu voudras, on crée ton premier projet avec /nouveau-projet,
ou on reprend un projet existant avec /reprendre.
```

Puis proposer la prochaine étape (créer le premier projet) sans forcer.

## Règles
- **L'apprenant ne tape aucune commande git, env ou terminal.** Claude s'en charge via ses outils.
- Les clés API ne sont jamais demandées dans le chat ni écrites en clair (voir la politique secrets de CLAUDE.md).
- Rester simple et rassurant : l'apprenant est débutant.
