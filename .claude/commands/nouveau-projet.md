# /nouveau-projet

**Objectif :** Initialiser un nouveau projet avec la structure de continuité parfaite, AVANT d'écrire la moindre ligne de code.

---

## Règle absolue

Cette commande GARANTIT que la structure de continuité (PROGRESS.md, DECISIONS.md, NEXT_SESSION.md, CLAUDE.md projet) est créée AVANT toute action de développement. Aucun code ne doit être écrit tant que la structure n'est pas en place et validée.

---

## Comportement attendu

Quand l'utilisateur tape `/nouveau-projet` (avec ou sans nom de projet en argument), exécute la séquence suivante dans l'ordre strict.

### Étape 1 : Recueillir les informations du projet

Si le nom du projet n'est pas fourni en argument, demande-le. Pose ensuite les questions essentielles :

```
Avant de créer la structure de ton nouveau projet, j'ai besoin de 3 informations rapides :

1. **Nom du projet** (en kebab-case si possible, ex: "mon-site-portfolio")
2. **Description courte** (1 à 2 phrases sur ce que fait le projet)
3. **Stack technique envisagée** (ex: "Next.js + Tailwind + Supabase" ou "à définir")

Tu peux aussi ajouter les objectifs spécifiques de ce projet si tu as une idée précise.
```

Attends ses réponses avant de continuer. Si l'utilisateur reste vague, propose des suggestions concrètes.

### Étape 2 : Créer le dossier du projet

Crée le dossier `projects/<nom-du-projet>/` dans le workspace Jarvis.

### Étape 3 : Créer les 4 fichiers obligatoires

#### Fichier 1 : `projects/<nom>/CLAUDE.md` (constitution du projet)

Contient :
- Nom et description du projet
- Objectifs du projet
- Stack technique
- Conventions de code à respecter (selon le langage choisi)
- Fonctionnalités prévues (liste initiale)
- Référence vers le CLAUDE.md racine pour le contexte personnel

#### Fichier 2 : `projects/<nom>/PROGRESS.md` (état actuel)

Initialise avec le format imposé :

```markdown
# PROGRESS.md
> Dernière mise à jour : AAAA-MM-JJ HH:MM (date de création)

## État global
Projet créé. Phase : Initialisation. Aucune ligne de code écrite pour l'instant.

## Fait
- [x] Structure de continuité initialisée (CLAUDE.md, PROGRESS.md, DECISIONS.md, NEXT_SESSION.md)

## En cours
- [ ] Définition du plan d'attaque pour démarrer le développement

## À faire (priorisé)
- [ ] (à définir après validation du plan d'attaque)

## Décisions clés prises (voir DECISIONS.md pour détails)
- Stack technique choisie : [stack]

## Pièges rencontrés et solutions
(aucun pour l'instant)

## Notes importantes pour la prochaine session
Projet tout juste créé. Lire le CLAUDE.md du projet pour comprendre l'objectif global.
```

#### Fichier 3 : `projects/<nom>/DECISIONS.md` (historique des choix)

Initialise avec :

```markdown
# DECISIONS.md
> Historique des choix techniques et leurs raisons.

## AAAA-MM-JJ : Choix de la stack technique

**Décision :** [stack choisie]

**Raison :** [pourquoi ce choix]

**Alternatives écartées :** [si applicable]
```

#### Fichier 4 : `projects/<nom>/NEXT_SESSION.md` (prompt de reprise)

Initialise avec le prompt de toute première reprise :

```markdown
# NEXT_SESSION.md
> Prompt prêt à coller dans une nouvelle conversation Claude Code

---

Salut Claude, on reprend le travail sur le projet [NOM].

Lis ces fichiers dans l'ordre pour reconstituer le contexte :
1. ./CLAUDE.md (constitution du projet)
2. ./PROGRESS.md (où on en est)
3. ./DECISIONS.md (choix techniques)

Résumé de la situation : Projet créé ce jour. Aucun code écrit pour l'instant. Phase d'initialisation, on doit définir le plan d'attaque.

Prochaine étape concrète : Valider le plan d'attaque pour démarrer le développement de la première fonctionnalité.

Confirme-moi que tu as bien lu le contexte et propose-moi le plan d'attaque pour la première fonctionnalité avant de commencer à coder.
```

### Étape 4 : Mettre à jour `projects/INDEX.md`

Ajoute le projet dans la section "Projets actifs" avec :
- Nom du projet
- Chemin
- Phase actuelle : "Initialisation"
- Date de création (qui devient la date de dernière session)

### Étape 5 : Confirmer la création et présenter le plan d'attaque

Présente à l'utilisateur un récapitulatif clair :

```
✓ Projet [nom] créé avec succès.

Structure générée :
- projects/[nom]/CLAUDE.md (constitution du projet)
- projects/[nom]/PROGRESS.md (état initial)
- projects/[nom]/DECISIONS.md (journal des décisions)
- projects/[nom]/NEXT_SESSION.md (prompt de reprise)
- projects/INDEX.md (mis à jour)

Maintenant, voici mon plan d'attaque proposé pour démarrer ton projet :

[Plan d'attaque en 3 à 5 étapes concrètes, adapté à la stack et au type de projet]

Est-ce que ce plan te convient ? On peut ajuster, ou je commence direct par l'étape 1.
```

### Étape 6 : Attendre la validation

NE COMMENCE PAS À CODER tant que l'utilisateur n'a pas validé le plan d'attaque ou redirigé sur autre chose.

---

## Règles strictes

- **Aucun code n'est écrit avant que les 4 fichiers de structure soient créés**
- **Aucun code n'est écrit avant que l'utilisateur ait validé le plan d'attaque**
- Si l'utilisateur tente de passer directement au code sans répondre aux 3 questions initiales, lui rappeler poliment que ces infos sont nécessaires pour que le projet soit bien structuré
- Si un dossier projet du même nom existe déjà, alerter l'utilisateur et lui demander s'il veut écraser, renommer ou reprendre l'existant
- Pas de tirets longs (em dashes) dans les réponses
- Communication en français systématique
- Tutoiement

---

## Cas particuliers

### Si l'utilisateur ne sait pas quelle stack choisir

Propose 2 ou 3 stacks adaptées à son projet en expliquant rapidement les avantages de chacune. Aide-le à décider.

### Si l'utilisateur veut un projet très simple (script, test rapide)

Crée quand même la structure complète. Ça prend 30 secondes et garantit la continuité même pour les petits projets, qui ont tendance à grossir avec le temps.

### Si l'utilisateur veut renommer son projet plus tard

Possible, mais nécessite de mettre à jour tous les fichiers + INDEX.md. Pour l'instant, on garde le nom initial.
