# /generer-env

**Objectif :** Générer un `.env` (et un `.env.example`) dans un projet à partir du coffre `secrets/api-keys.md`, sans jamais afficher les valeurs dans le chat.

---

## Règle absolue de sécurité

Quand Claude exécute cette commande :

- **NE JAMAIS** afficher les valeurs des clés dans le chat
- **NE JAMAIS** afficher le contenu complet du `.env` généré dans une réponse
- **TOUJOURS** masquer les valeurs en confirmation (afficher uniquement `...XXXX`)
- **TOUJOURS** s'assurer que `.env` est dans le `.gitignore` du projet

---

## Comportement attendu

Quand l'utilisateur tape `/generer-env` (avec ou sans nom de projet en argument), exécute la séquence suivante.

### Étape 1 : Identifier le projet cible

**Cas A — Argument fourni** : `/generer-env mon-portfolio`
- Cible le dossier `projects/mon-portfolio/`

**Cas B — Pas d'argument et dossier courant est un projet** :
- Le dossier courant contient un `PROGRESS.md` ou un `CLAUDE.md` projet
- Cibler ce dossier

**Cas C — Pas d'argument et dossier courant est la racine du Jarvis** :
- Lire `projects/INDEX.md`, lister les projets actifs
- Demander à l'utilisateur lequel il vise

**Cas D — Le dossier projet n'existe pas** :
- Alerter et proposer de créer le projet via `/nouveau-projet` d'abord

### Étape 2 : Charger le coffre

Lis `secrets/api-keys.md` et extrait toutes les variables disponibles (les noms des variables `NOM_VARIABLE = ...` dans chaque section).

Si le coffre est vide ou ne contient que des placeholders `(à remplir)`, alerter l'utilisateur : "Ton coffre est vide. Ajoute d'abord des clés via /ajouter-cle, puis relance /generer-env."

### Étape 3 : Demander quelles variables sont nécessaires

Présente la liste des variables disponibles, regroupées par service, et demande lesquelles sont nécessaires pour ce projet :

```
Voici les variables disponibles dans ton coffre :

**Anthropic**
- [ ] ANTHROPIC_API_KEY

**OpenAI**
- [ ] OPENAI_API_KEY

**Supabase**
- [ ] SUPABASE_URL
- [ ] SUPABASE_ANON_KEY
- [ ] SUPABASE_SERVICE_ROLE_KEY

(...)

Lesquelles veux-tu inclure dans le .env de [nom-du-projet] ?

Tu peux me répondre par les numéros, les noms de variables, ou simplement décrire ton projet (ex: "c'est un site Next.js avec Supabase et envoi d'emails Resend") et je sélectionnerai les bonnes variables.
```

Filtrer pour ne proposer que les variables qui ont une valeur réelle (pas les `(à remplir)`).

### Étape 4 : Générer les fichiers

Une fois la sélection validée, créer ou mettre à jour :

**Fichier 1 — `projects/<projet>/.env`** (gitignored) :

```
# Variables d'environnement — généré automatiquement depuis secrets/api-keys.md
# NE PAS COMMITER. Ce fichier est dans le .gitignore.
# Dernière génération : AAAA-MM-JJ HH:MM

ANTHROPIC_API_KEY=valeur_reelle
SUPABASE_URL=valeur_reelle
SUPABASE_ANON_KEY=valeur_reelle
```

**Fichier 2 — `projects/<projet>/.env.example`** (committable) :

```
# Variables d'environnement attendues par ce projet.
# Copie ce fichier en .env et remplis avec tes vraies valeurs.

ANTHROPIC_API_KEY=
SUPABASE_URL=
SUPABASE_ANON_KEY=
```

**Fichier 3 — `projects/<projet>/.gitignore`** :

- Si le fichier existe, vérifier qu'il contient `.env` et l'ajouter sinon
- Si le fichier n'existe pas, le créer avec au minimum :

```
.env
.env.local
node_modules/
.next/
dist/
build/
```

### Étape 5 : Confirmer SANS afficher les valeurs

```
✓ .env généré pour [projet].

**Fichiers créés/mis à jour :**
- projects/[projet]/.env (gitignored)
- projects/[projet]/.env.example (committable)
- projects/[projet]/.gitignore (vérifié, .env protégé)

**Variables injectées (valeurs masquées) :**
- ANTHROPIC_API_KEY = ...XXXX
- SUPABASE_URL = ...XXXX
- SUPABASE_ANON_KEY = ...XXXX

⚠️ Rappels :
- Ne commit JAMAIS le .env, seulement le .env.example
- Pour utiliser ces variables dans ton code : process.env.ANTHROPIC_API_KEY (Node) ou os.getenv('ANTHROPIC_API_KEY') (Python)
- Si tu régénères une clé chez le fournisseur, mets à jour secrets/api-keys.md puis relance /generer-env
```

### Étape 6 : Mettre à jour PROGRESS.md du projet (si présent)

Si le projet a un `PROGRESS.md`, ajouter une ligne dans "Décisions clés prises" ou "Notes" :

```
- .env généré le AAAA-MM-JJ avec les variables : [liste des noms]
```

---

## Règles strictes

- **JAMAIS** afficher les valeurs réelles dans le chat
- **JAMAIS** copier les valeurs dans des fichiers autres que le `.env` du projet ciblé
- **TOUJOURS** vérifier la présence de `.env` dans le `.gitignore` du projet
- **TOUJOURS** créer le `.env.example` en parallèle du `.env`
- **TOUJOURS** masquer les valeurs en confirmation
- Communication en français
- Pas de tirets longs (em dashes)

---

## Cas particuliers

### Le projet a déjà un .env

Demander : "Le projet a déjà un .env avec [N] variables. Tu veux :
1. Le compléter (ajouter mes nouvelles variables sans toucher aux existantes)
2. Le remplacer (écraser complètement avec uniquement les variables sélectionnées maintenant)
3. Annuler"

### Une variable demandée n'existe pas dans le coffre

Alerter : "La variable `[NOM]` n'est pas dans ton coffre. Tu veux :
1. L'ajouter maintenant via /ajouter-cle
2. Continuer sans elle
3. Annuler"

### Le projet utilise un autre format (.env.local, config.json, etc.)

Demander à l'utilisateur le format souhaité. Adapter la génération en conséquence, mais TOUJOURS s'assurer que le fichier final est gitignored.

### Le projet n'est pas dans `projects/`

Si l'utilisateur veut générer un .env pour un projet hors du Jarvis (ex: un projet ailleurs sur sa machine), demander confirmation du chemin absolu et procéder. La règle gitignore reste : créer/maj le `.gitignore` du dossier projet.
