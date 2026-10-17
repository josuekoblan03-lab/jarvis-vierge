# Programme de formation — Développer des apps web avec Claude Code

> 16 séances · 4 par semaine · 1 mois · présentiel 2 h
> Fil rouge : l'apprenant construit **Faya**, une boutique de vêtements en ligne avec assistant de style IA et paiement GeniusPay (Next.js + Supabase + GeniusPay + Vercel), du début à la fin, en utilisant toute la méthode de travail du formateur.
> Détail complet du projet : voir `projet-fil-rouge-faya.md`.

---

## Pour qui

- **Apprenant** : bases de code (HTML/CSS/JS, un peu Python), terminal et Git encore flous. Abonnement Claude **Pro** (quotas serrés, l'économie fait partie de l'apprentissage).
- **Formateur** : a déjà construit de vraies apps avec Claude Code, transmet sa manière de travailler.

## Objectif de fin de mois

Une **vraie app web déployée en ligne**, construite par l'apprenant, avec base de données et authentification. À la fin, il sait travailler seul avec Claude Code : cadrer, construire, brancher des services (MCP), faire relire par des agents, se protéger avec des hooks, déployer, et tester la sécurité de son app.

## Outil central

Le **Jarvis Vierge** (ce workspace). Installé en séance 1, il contient déjà agents, skills, commandes, hooks et MCP. L'apprenant repart avec.

---

## Méthode pédagogique (règles du formateur)

1. **C'est l'apprenant qui tape les prompts.** Le formateur montre une fois, l'apprenant refait. Jamais l'inverse.
2. **Toujours partir du « pourquoi ».** Avant chaque outil : quel problème il résout. Pas d'outil pour l'outil.
3. **Démo sur du vrai.** Le formateur illustre avec ses propres projets réels quand c'est pertinent, puis l'apprenant applique sur son app.
4. **Un concept par séance, ancré dans le projet.** La notion arrive quand le projet en a besoin.
5. **Économie Pro en continu.** À chaque séance, un réflexe d'économie de quota (Sonnet par défaut, `/clear`, sessions courtes, continuité par fichiers).
6. **Fin de séance = checkpoint.** `PROGRESS.md` à jour, `NEXT_SESSION.md` régénéré, devoir noté. L'apprenant doit pouvoir reprendre seul.

## Structure type d'une séance (2 h)

| Durée | Phase |
|---|---|
| 10 min | Retour sur le devoir de la séance précédente |
| 25 min | Concept du jour + démo live |
| 1 h 15 | Pratique sur l'app de l'apprenant (formateur en copilote) |
| 10 min | Récap + checkpoint (PROGRESS/NEXT_SESSION) + devoir |

---

## Vue d'ensemble des 16 séances

### Semaine 1 — Fondations et méthode

| # | Titre | Concept clé | Résultat concret |
|---|---|---|---|
| S1 | Prise en main | Installer le Jarvis Vierge, terminal, Git, 1re conversation | Environnement prêt, CONTEXT.md + CLAUDE.md remplis |
| S2 | La méthode de travail | brainstorming → spec → plan → exécution | Idée d'app cadrée, spec écrite |
| S3 | Continuité parfaite | PROGRESS / NEXT_SESSION / `/reprendre`, `/nouveau-projet` | Projet initialisé, squelette Next.js lancé |
| S4 | Lire et piloter du code | Prompts efficaces, lire la sortie, corriger | Première page qui tourne en local |

### Semaine 2 — Construire l'interface

| # | Titre | Concept clé | Résultat concret |
|---|---|---|---|
| S5 | C'est quoi tout ça ? | MCP, agent, skill, plugin, hook, commande (le vocabulaire) | L'apprenant sait ce que chaque brique fait |
| S6 | Design avec Claude Design | maquetter dans Claude Design, puis transposer en code | Page principale maquettée + codée fidèle |
| S7 | Responsive et accessibilité | mobile, a11y, agent web-accessibility-checker | App utilisable mobile + accessible |
| S8 | Commandes et skills perso | créer une commande, invoquer une skill | 1 commande perso créée |

### Semaine 3 — Brancher le monde extérieur

| # | Titre | Concept clé | Résultat concret |
|---|---|---|---|
| S9 | MCP en pratique | brancher Supabase + navigateur, `.env`, coffre | App connectée à une vraie base |
| S10 | Base de données | schéma, CRUD, requêtes | Catalogue produits + panier sur vraie base |
| S11 | Authentification | login, sessions, protection des routes | Comptes clients + rôle admin + isolation des données |
| S12 | Économie Pro et continuité avancée | tenir les quotas, sessions longues vs neuves | L'apprenant optimise sa conso |

### Semaine 4 — Niveau pro et sécurité

| # | Titre | Concept clé | Résultat concret |
|---|---|---|---|
| S13 | Agents, revue + assistant IA | sous-agents, code-reviewer, debug ; assistant de style IA | Revue faite + assistant de style IA branché |
| S14 | Hooks et garde-fous | protection .env, formatage auto, scope-guard | Clés (GeniusPay/Supabase) protégées, qualité auto |
| S15 | Déploiement + paiement | Vercel, env en prod ; paiement GeniusPay (test) | Boutique en ligne avec tunnel de paiement |
| S16 | Tester la sécurité + démo finale | pentest autorisé de sa propre app, bilan | Faya auditée, démo, autonomie |

---

## Évaluation

- **Continue** : à chaque séance, l'apprenant montre qu'il reprend seul via `/reprendre` et qu'il a fait son devoir.
- **Finale (S16)** : l'app est en ligne, l'apprenant fait une démo de 10 min et explique sa méthode de travail avec Claude Code.

## Le projet fil rouge : Faya

L'app construite tout au long de la formation est **Faya**, une boutique de vêtements en ligne avec assistant de style IA et paiement GeniusPay. Le concept, le périmètre MVP, le modèle de données et le branchement feature par séance sont détaillés dans **`projet-fil-rouge-faya.md`**. En S2, on écrit sa spec ensemble avec l'apprenant.

## Fichiers de ce dossier

- `programme.md` — ce fichier.
- `fiches-formateur/SXX.md` — le déroulé minute par minute de chaque séance (pour le formateur).
- `memos/SXX.md` — la fiche mémo que l'apprenant garde (concepts, commandes, prompts types).
