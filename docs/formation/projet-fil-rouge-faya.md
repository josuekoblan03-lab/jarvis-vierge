# Projet fil rouge — Faya (boutique de vêtements en ligne)

> Nom provisoire : **Faya**. L'application complète que l'apprenant construit du début à la fin de la formation.
> Stack : Next.js + Supabase + GeniusPay + Vercel. Design d'abord dans Claude Design, puis code.

---

## Le concept

Une boutique de vêtements en ligne, moderne et mobile-first (pensée pour le marché ivoirien), avec un **angle qui la démarque** : un **assistant de style IA** qui conseille des tenues selon l'occasion, le budget et le goût, et propose directement des articles du catalogue.

## Ce que fait l'app (périmètre MVP ~10 séances de build)

### Côté client
- **Catalogue** : liste des vêtements, filtres par catégorie, recherche.
- **Page produit** : photos, description, tailles, prix, bouton ajouter au panier.
- **Panier** : ajouter/retirer, quantités, total.
- **Comptes** : inscription, connexion, profil, historique de commandes.
- **Checkout + paiement** : tunnel de commande avec **GeniusPay** (agrégateur : mobile money Wave/Orange/MTN + cartes). En formation : environnement de test, pas d'argent réel tant que ce n'est pas voulu.
- **Assistant de style IA** : un chat qui, selon l'occasion (« mariage », « cours », « sortie »), le budget et les préférences, recommande une tenue et pointe des articles réels du catalogue.

### Côté admin
- **Gestion produits** : ajouter, éditer, retirer des articles (nom, prix, photos, tailles, stock, catégorie).
- **Commandes** : voir les commandes passées et leur statut.

## Modèle de données (esquisse)

- **products** : id, nom, description, prix, catégorie, tailles, stock, images.
- **users** : géré par Supabase Auth (clients) + un rôle admin.
- **carts / cart_items** : panier par utilisateur.
- **orders / order_items** : commandes, montant, statut de paiement.
- Règle d'accès (RLS Supabase) : un client ne voit QUE son panier et ses commandes ; seul l'admin gère les produits.

## Hors périmètre (YAGNI, pour après la formation)

- Multi-vendeurs, logistique/livraison réelle, codes promo avancés, avis clients, application mobile native. On construit une base solide d'abord.

---

## Comment les features se branchent sur les 16 séances

| Séance | Ce qu'on fait sur Faya |
|---|---|
| S1-S2 | Prise en main + cadrage : écrire la spec de Faya (ce périmètre). |
| S3 | `/nouveau-projet faya`, squelette Next.js. |
| S4 | Première page (accueil de la boutique). |
| S5 | Vocabulaire (MCP, agents, hooks…) sur le vrai projet Faya. |
| **S6** | **Design d'abord dans Claude Design** : maquette de la vitrine + page produit, puis transposition en code. |
| S7 | Responsive + accessibilité du catalogue (mobile-first). |
| S8 | Commandes perso (ex. `/point`, `/produit` pour aider le dev). |
| S9 | Brancher Supabase (base) + navigateur. |
| S10 | Base de données : tables **products / orders**, afficher le catalogue réel, panier. |
| S11 | Auth clients + rôle admin + isolation des données (RLS). |
| S12 | Économie Pro + consolidation (catalogue, panier, admin de base). |
| S13 | Agents + revue de code sur Faya ; **intégration de l'assistant de style IA**. |
| S14 | Hooks + garde-fous (protéger les clés GeniusPay/Supabase). |
| S15 | Déploiement Vercel + **branchement du paiement GeniusPay** (env de test) + variables d'env en prod. |
| S16 | Test de sécurité de Faya (isolation des commandes, accès admin) + démo finale. |

> Note formateur : le **paiement GeniusPay** et l'**assistant IA** sont les deux morceaux les plus techniques. Les introduire quand la base (catalogue + panier + comptes) tient déjà. Prévoir une marge : ils peuvent déborder sur une séance de consolidation.

## Clés / comptes à prévoir

- **Supabase** : projet + token (S9).
- **GeniusPay** : compte agrégateur + clés API (environnement de test), à stocker dans le coffre via `/ajouter-cle`, jamais en clair. Branché en S15.
- **Assistant IA** : via l'accès Claude de l'apprenant (ou une clé API dédiée selon l'implémentation choisie en S13).

## Pièges connus (à anticiper)

- **GeniusPay** : l'intégration dépend de leur doc/API ; prévoir un temps de lecture de doc. Rester en test tant que le flux n'est pas sûr.
- **Isolation des données** : la faille n°1 d'une boutique débutante = un client voit les commandes d'un autre. À verrouiller via RLS (S11) et vérifier en S16.
- **Assistant IA** : le cadrer pour qu'il recommande UNIQUEMENT des articles existants du catalogue (sinon il invente des produits).
