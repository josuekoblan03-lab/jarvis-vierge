# /ajouter-cle

**Objectif :** Ajouter une nouvelle clé API au coffre-fort `secrets/api-keys.md` sans jamais afficher la valeur dans le chat.

---

## Règle absolue de sécurité

Quand l'utilisateur utilise cette commande, Claude reçoit la valeur de la clé MAIS :

- **NE JAMAIS** répéter la valeur dans une réponse écrite
- **NE JAMAIS** afficher la valeur en confirmation
- **NE JAMAIS** la coller dans un autre fichier que `secrets/api-keys.md`
- **TOUJOURS** masquer la valeur (afficher uniquement les 4 derniers caractères, ex: `...XXXX`) dans les confirmations

---

## Comportement attendu

Quand l'utilisateur tape `/ajouter-cle` (avec ou sans arguments), exécute la séquence suivante.

### Étape 1 : Charger le contexte du coffre

Lis `secrets/api-keys.md` pour identifier les services déjà présents et leur structure.

### Étape 2 : Recueillir les informations

Pose les questions dans cet ordre, une par une si possible (sinon en une seule série) :

```
On va ajouter une nouvelle clé à ton coffre. J'ai besoin de quelques infos :

1. **Service** : pour quel service est cette clé ?
   (Anthropic, OpenAI, Google AI, Supabase, GitHub, Vercel, n8n, Stripe, Resend, Cloudflare, ou autre)

2. **Nom de la variable** : sous quel nom veux-tu la stocker ?
   (ex: ANTHROPIC_API_KEY, OPENAI_API_KEY, SUPABASE_SERVICE_ROLE_KEY)

3. **Valeur** : colle la clé ici.
   (Je ne la répéterai jamais dans le chat. Une fois enregistrée, elle ne sortira que vers les .env de tes projets via /generer-env.)

4. **Compte associé** : quel email/identifiant utilises-tu sur ce service ?

5. **Plan** : sur quel plan es-tu ?
   (Gratuit, Tier 1, Pro, Enterprise, etc.)

6. **Notes** : y a-t-il des limitations ou particularités à retenir ?
   (quotas, restrictions, scopes du token, distinction test/live, etc.)

7. **Renouvellement estimé** : dans combien de mois prévois-tu de la régénérer ?
   (3, 6 ou 12 mois est recommandé)
```

Si l'utilisateur fournit les infos en une seule réponse, c'est OK. Sinon, pose les questions une par une de manière fluide.

### Étape 3 : Écrire dans api-keys.md

Identifie si le service existe déjà dans `api-keys.md` :

**Cas A — Le service existe déjà :**
- Ajouter la nouvelle clé dans la section existante (sans écraser les autres clés du même service)
- Mettre à jour la date "Dernière mise à jour" en haut du fichier

**Cas B — Le service n'existe pas encore :**
- Créer une nouvelle section au format standard :

```markdown
## [Nom du service]

- **Compte associé** : <valeur>
- **Plan** : <valeur>
- **Date de création** : 2026-MM-JJ (date du jour)
- **Clé(s)** :
  - `NOM_VARIABLE` = <VALEUR_RÉELLE>
- **Notes** : <valeur>
- **Renouvellement estimé** : <date calculée>

---
```

La nouvelle section est ajoutée avant la section finale "Autres services".

### Étape 4 : Confirmer SANS afficher la valeur

Présente une confirmation propre, avec la valeur masquée :

```
✓ Clé ajoutée au coffre.

**Service** : [nom]
**Variable** : [NOM_VARIABLE]
**Valeur stockée** : ...[4 derniers caractères]
**Compte** : [compte]
**Plan** : [plan]
**Prochaine rotation** : [date estimée]

Fichier mis à jour : secrets/api-keys.md

⚠️ Rappel sécurité :
- Si tu as collé cette clé via le chat, considère qu'elle a transité par un serveur. Si possible, régénère-la chez le fournisseur et ajoute la nouvelle version.
- Pour l'utiliser dans un projet, lance /generer-env depuis le dossier du projet.
```

### Étape 5 : Ne rien faire d'autre

Ne propose pas de "tester" la clé, ne propose pas de l'afficher en clair, ne fais aucune action de toi-même après la confirmation.

---

## Règles strictes

- **JAMAIS** afficher la valeur complète dans le chat, même partiellement (sauf les 4 derniers caractères en confirmation)
- **JAMAIS** écrire la valeur dans un autre fichier que `secrets/api-keys.md`
- **JAMAIS** logger la valeur dans des outputs Bash visibles
- **TOUJOURS** masquer dans les confirmations
- **TOUJOURS** rappeler la règle de rotation
- Communication en français
- Pas de tirets longs (em dashes)

---

## Cas particuliers

### Si l'utilisateur ne fournit pas tous les champs

Continue quand même. Les champs manquants restent vides dans `api-keys.md`. Il pourra les compléter manuellement plus tard.

### Si une clé du même nom existe déjà pour le même service

Demander : "Une clé `[NOM_VARIABLE]` existe déjà pour [service]. Tu veux la remplacer (l'ancienne sera écrasée) ou ajouter celle-ci en plus avec un nom différent ?"

### Si l'utilisateur colle plusieurs clés en même temps

Traiter chaque clé séparément, ajouter chacune à la bonne section, faire une confirmation groupée à la fin.

### Si la clé semble factice ou de test

Pas de problème. Ajouter quand même (utile pour les tests). Le format de la valeur n'est pas validé.
