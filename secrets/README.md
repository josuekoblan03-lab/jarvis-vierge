# Coffre-fort de clés API

> Dossier centralisé pour toutes mes clés API et secrets. Lu par Claude pour configurer mes projets sans que je doive coller mes clés dans le chat.

---

## À quoi sert ce dossier

Ce dossier contient la **source unique de vérité** pour toutes mes clés API (Anthropic, OpenAI, Supabase, GitHub, etc.).

Au lieu de :
- Coller mes clés dans le chat (où elles transitent par des serveurs)
- Les dupliquer dans chaque dossier projet (multiples `.env` qui dérivent)
- Les oublier dans des notes ou des mails

J'utilise ce dossier comme **coffre-fort local** que Claude peut lire pour injecter automatiquement les bonnes valeurs dans le `.env` du projet sur lequel je travaille.

---

## Structure du dossier

```
secrets/
├── README.md          # Ce fichier — documentation et règles
├── api-keys.md        # SOURCE DE VÉRITÉ (gitignored — jamais commit)
└── template.md        # Modèle vierge committable (pour réinstallation)
```

---

## Les 6 règles de sécurité absolues

### 1. Jamais commit

Le fichier `api-keys.md` est dans le `.gitignore` racine du Jarvis. Il ne doit JAMAIS être poussé sur GitHub, GitLab ou n'importe quel dépôt distant. Si tu vois ce fichier apparaître dans `git status`, arrête tout et vérifie ton `.gitignore`.

### 2. Jamais dans le chat

Ne colle JAMAIS une clé API directement dans une conversation avec Claude. Si tu le fais par accident, Claude masquera la clé dans sa réponse et te demandera de la révoquer (parce qu'elle a transité par un serveur).

Pour ajouter une clé, utilise plutôt la commande `/ajouter-cle` qui prend la valeur de manière sécurisée.

### 3. Jamais en dur dans le code

Les clés ne doivent JAMAIS être écrites en dur dans des fichiers `.js`, `.py`, `.ts`, ou tout autre fichier source. Toujours utiliser une variable d'environnement chargée depuis un `.env` local au projet.

### 4. Jamais sans .env.example

Quand un projet utilise des variables d'environnement, il doit avoir :
- Un `.env` local (gitignored) avec les vraies valeurs
- Un `.env.example` (committable) avec les noms de variables mais des valeurs vides

Le `.env.example` sert de documentation pour quiconque reprend le projet.

### 5. Rotation tous les 3 à 6 mois

Les clés doivent être renouvelées régulièrement. Quand tu génères une nouvelle clé chez un fournisseur, mets immédiatement à jour `api-keys.md` (via `/ajouter-cle` ou édition manuelle) et révoque l'ancienne.

### 6. Backup chiffré recommandé

Sauvegarde `api-keys.md` quelque part de sûr : clé USB chiffrée, gestionnaire de mots de passe (Bitwarden, 1Password, KeePass). Si ton disque dur meurt, tu ne veux pas avoir à régénérer toutes tes clés en urgence.

---

## Comment ajouter une nouvelle clé

### Option 1 : Commande slash (recommandé)

```
/ajouter-cle
```

Claude te demande :
1. Le service concerné
2. Le nom de la variable (ex: `ANTHROPIC_API_KEY`)
3. La valeur (Claude la traite mais ne la répète JAMAIS)
4. Les métadonnées (compte, plan, notes)

Claude écrit la nouvelle entrée à la bonne section et confirme l'ajout sans afficher la valeur.

### Option 2 : Édition manuelle

Ouvre `secrets/api-keys.md` dans ton éditeur, ajoute ta clé dans la bonne section en suivant le format standardisé.

---

## Comment Claude utilise ces clés

Quand un projet a besoin d'une ou plusieurs clés pour fonctionner (par exemple, un projet IA qui appelle l'API Anthropic) :

1. Tu lances `/generer-env` dans le contexte du projet
2. Claude liste les variables disponibles dans `api-keys.md`
3. Tu choisis celles dont le projet a besoin
4. Claude crée :
   - `projects/<projet>/.env` avec les vraies valeurs (gitignored)
   - `projects/<projet>/.env.example` avec les noms seuls (committable)
   - `projects/<projet>/.gitignore` contenant `.env` (si pas déjà présent)
5. Le projet est prêt, les clés sont utilisables via `process.env.MA_CLE` ou `os.getenv('MA_CLE')`

---

## Que faire en cas de fuite suspectée

Si tu penses qu'une clé a fuité (collée par erreur, partagée par accident, ordinateur compromis) :

1. **Révoque immédiatement** la clé chez le fournisseur (Anthropic Console, OpenAI Dashboard, etc.)
2. **Génère une nouvelle clé** chez le même fournisseur
3. **Mets à jour** `secrets/api-keys.md` avec la nouvelle valeur
4. **Régénère les .env** des projets qui utilisaient l'ancienne clé via `/generer-env`
5. **Vérifie l'historique de facturation** du fournisseur pour repérer une utilisation anormale

Une clé révoquée immédiatement vaut mieux qu'une clé compromise pendant des semaines.

---

## Sécurité physique de la machine

Ce coffre est **local et en clair sur ton disque**. Cela signifie :

- Si quelqu'un a un accès physique à ta machine, il a toutes tes clés
- Verrouille ta session quand tu t'éloignes (Win+L sur Windows)
- Active le chiffrement du disque (BitLocker sur Windows Pro)
- N'autorise pas l'accès à ton dossier `Music/` à des comptes invités

Pour un niveau de protection supérieur (clés chiffrées), tu peux migrer vers un gestionnaire dédié comme Bitwarden CLI ou 1Password CLI. C'est un autre chantier, pas couvert ici.
