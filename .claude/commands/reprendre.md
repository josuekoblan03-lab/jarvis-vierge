# /reprendre

**Objectif :** Reprendre un projet exactement là où je l'avais laissé, sans rien perdre.

---

## Comportement attendu

Quand l'utilisateur tape `/reprendre`, Claude doit :

### 1. Identifier le projet à reprendre

- Si Claude est déjà dans un dossier projet (présence d'un PROGRESS.md à la racine du dossier courant) : reprendre ce projet directement.
- Sinon, lire `projects/INDEX.md` et lister à l'utilisateur les projets actifs avec leur date de dernière session. Demander lequel reprendre.

### 2. Charger le contexte complet

Une fois le projet identifié, lire dans l'ordre :
1. `CLAUDE.md` (racine du Jarvis) si pas déjà lu
2. `context/CONTEXT.md`
3. Le `CLAUDE.md` du projet
4. Le `PROGRESS.md` du projet
5. Le `DECISIONS.md` du projet
6. Le `NEXT_SESSION.md` du projet

### 3. Faire un résumé de reprise

Présenter à l'utilisateur :

```
✓ Projet [nom] chargé. Voici où on en est :

**État global :** [phase actuelle en 1 ligne]

**Dernière session :** [date]

**Ce qui était en cours :**
- [item en cours]

**Prochaine étape proposée :**
[tâche concrète issue de NEXT_SESSION.md]

On y va ? Ou tu veux faire autre chose en priorité ?
```

### 4. Attendre la validation

Ne pas commencer à coder ou à modifier des fichiers tant que l'utilisateur n'a pas validé l'action proposée ou donné une autre direction.

---

## Cas d'erreur

- Si aucun projet n'existe dans `projects/` : proposer de créer un nouveau projet.
- Si un PROGRESS.md est trouvé mais corrompu ou incomplet : alerter l'utilisateur et reconstituer le contexte du mieux possible à partir du code et de l'historique.
