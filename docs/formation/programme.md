# Programme de formation — Développer des apps web avec Claude Code

> 8 séances · 4 par semaine · 2 semaines · présentiel ~3 h · pour deux apprenants
> Fil rouge : les apprenants construisent **Faya**, une boutique de vêtements en ligne avec assistant de style IA et paiement GeniusPay (Next.js + Supabase + GeniusPay + Vercel), du début à la fin, en utilisant toute la méthode de travail du formateur.
> Détail complet du projet : voir `projet-fil-rouge-faya.md`.
> Format intensif : chaque séance fusionne deux thèmes. Les fiches détaillées (`fiches-formateur/S1…S16.md`) et mémos (`memos/S1…S16.md`) restent la référence ; le formateur en couvre deux par séance.

---

## Pour qui

- **Apprenants (deux)** : bases de code (HTML/CSS/JS, un peu Python), terminal et Git encore flous. Abonnement Claude **Pro** (quotas serrés, l'économie fait partie de l'apprentissage).
- **Formateur** : a déjà construit de vraies apps avec Claude Code, transmet sa manière de travailler.

## Objectif de fin de formation

Une **vraie app web déployée en ligne** (Faya), avec base de données, authentification et paiement. À la fin, les apprenants savent travailler seuls avec Claude Code : cadrer, construire, brancher des services (MCP), faire relire par des agents, se protéger avec des hooks, déployer, et tester la sécurité de leur app.

## Outil central

Le **Jarvis Vierge** (ce workspace). Installé en séance 1, il contient déjà agents, skills, commandes, hooks et MCP. Les apprenants repartent avec.

---

## Méthode pédagogique (règles du formateur)

1. **Ce sont les apprenants qui tapent les prompts.** Le formateur montre une fois, chaque apprenant refait. Jamais l'inverse.
2. **Toujours partir du « pourquoi ».** Avant chaque outil : quel problème il résout. Pas d'outil pour l'outil.
3. **Démo sur du vrai.** Le formateur illustre avec ses propres projets réels quand c'est pertinent, puis les apprenants appliquent sur Faya.
4. **Un bloc de concepts par séance, ancré dans le projet.** La notion arrive quand le projet en a besoin.
5. **Économie Pro en continu.** Réflexe d'économie de quota à chaque séance (Sonnet par défaut, `/clear`, sessions courtes, continuité par fichiers).
6. **Fin de séance = checkpoint.** `PROGRESS.md` à jour, `NEXT_SESSION.md` régénéré, travail noté. Les apprenants doivent pouvoir reprendre seuls.

> Deux apprenants : privilégier le binôme sur un même projet Faya (l'un pilote, l'autre vérifie et commente, on alterne), ou deux instances de Faya en parallèle si chacun a sa machine. Le formateur arbitre selon l'équipement.

## Structure type d'une séance (~3 h)

| Durée | Phase |
|---|---|
| 15 min | Retour sur le travail de la séance précédente |
| 40 min | Concepts du jour (deux thèmes) + démonstrations |
| 1 h 45 | Pratique sur Faya (formateur en copilote, les apprenants alternent) |
| 20 min | Récapitulatif + checkpoint (PROGRESS/NEXT_SESSION) + travail à préparer |

---

## Vue d'ensemble des 8 séances

### Semaine 1 — Fondations, méthode et interface

| # | Thèmes fusionnés | Concepts clés | Résultat concret |
|---|---|---|---|
| **Séance 1** | Prise en main + Méthode (S1+S2) | Jarvis, terminal, Git, 1re conversation ; brainstorming → spec | Environnement prêt, contexte rempli, spec de Faya écrite |
| **Séance 2** | Continuité + Piloter le code (S3+S4) | `/nouveau-projet`, PROGRESS/NEXT_SESSION/`/reprendre` ; prompts, lire la sortie | Projet initialisé, squelette Next.js, première page de la boutique |
| **Séance 3** | Vocabulaire + Design (S5+S6) | MCP, agents, skills, hooks, commandes ; design-first avec Claude Design | Vitrine maquettée dans Claude Design puis transposée en code |
| **Séance 4** | Responsive/a11y + Outils perso (S7+S8) | mobile-first, accessibilité ; créer une commande/skill | Catalogue responsive et accessible, 1 commande perso |

### Semaine 2 — Données, services, mise en ligne et sécurité

| # | Thèmes fusionnés | Concepts clés | Résultat concret |
|---|---|---|---|
| **Séance 5** | MCP + Base de données (S9+S10) | brancher Supabase, `.env`, coffre ; schéma, CRUD | Catalogue et panier sur vraie base de données |
| **Séance 6** | Auth + Économie/continuité (S11+S12) | comptes, rôles, isolation (RLS) ; tenir les quotas | Comptes clients + admin, données isolées, conso maîtrisée |
| **Séance 7** | Revue + Assistant IA + Garde-fous (S13+S14) | agents, revue, debug ; assistant de style IA ; hooks | App relue, assistant IA branché, clés protégées |
| **Séance 8** | Déploiement + Paiement + Sécurité (S15+S16) | Vercel, env prod ; paiement GeniusPay ; audit (cadre autorisé) | Boutique en ligne, paiement en test, auditée, démo finale |

> Correspondance avec les fiches détaillées : Séance 1 = S1+S2, Séance 2 = S3+S4, Séance 3 = S5+S6, Séance 4 = S7+S8, Séance 5 = S9+S10, Séance 6 = S11+S12, Séance 7 = S13+S14, Séance 8 = S15+S16.

---

## Évaluation

- **Continue** : à chaque séance, chaque apprenant montre qu'il reprend seul le projet (via `/reprendre`) et qu'il a préparé le travail demandé.
- **Finale (Séance 8)** : Faya est en ligne ; chaque apprenant fait une courte démonstration et explique sa méthode de travail avec Claude Code.

## Le projet fil rouge : Faya

L'app construite tout au long de la formation est **Faya**, une boutique de vêtements en ligne avec assistant de style IA et paiement GeniusPay. Le concept, le périmètre MVP, le modèle de données et le branchement feature par séance sont détaillés dans **`projet-fil-rouge-faya.md`**. En séance 1, on écrit sa spec avec les apprenants.

## Fichiers de ce dossier

- `programme.md` — ce fichier (plan 2 semaines / 8 séances).
- `projet-fil-rouge-faya.md` — le projet construit.
- `fiches-formateur/S1…S16.md` — le déroulé détaillé par thème (2 par séance).
- `memos/S1…S16.md` — la fiche mémo par thème que les apprenants gardent.
