# Template — Modèle vierge pour api-keys.md

> Ce fichier est un modèle vierge qui peut être committé (sans aucune valeur réelle).
> Si tu repars de zéro un jour ou clones ton Jarvis sur une autre machine, copie ce fichier en `api-keys.md` puis remplis-le avec tes vraies clés.
>
> **Important** : `api-keys.md` est gitignored. `template.md` ne l'est pas. Donc tu peux pousser ton Jarvis sur GitHub sans risque, le template servira juste de squelette à quelqu'un qui voudra installer son propre Jarvis.

---

## Structure standard d'une entrée

```markdown
## [Nom du service]

- **Compte associé** : <email_ou_identifiant>
- **Plan** : <Gratuit / Tier 1 / Pro / Enterprise>
- **Date de création** : <AAAA-MM-JJ>
- **Clé(s)** :
  - `NOM_DE_VARIABLE` = <TON_API_KEY_ICI>
- **Notes** : <limitations, quotas, particularités>
- **Renouvellement estimé** : <AAAA-MM-JJ>
```

---

## Services pré-configurés

Voici la liste des services pré-configurés dans `api-keys.md`. Ce sont ceux que je suis le plus susceptible d'utiliser vu mon profil (IA, dev web, cybersécurité, automatisation).

- Anthropic (Claude API)
- OpenAI (ChatGPT API)
- Google AI (Gemini API)
- Supabase
- GitHub (Personal Access Token)
- Vercel
- n8n
- Stripe
- Resend (emails)
- Cloudflare

Pour ajouter un service non prévu, utilise la commande `/ajouter-cle` ou édite manuellement `api-keys.md` en suivant la structure standard.

---

## Rappel des règles de sécurité

1. Jamais commit `api-keys.md`
2. Jamais coller une clé dans le chat
3. Jamais écrire une clé en dur dans le code
4. Toujours utiliser `.env` + `.env.example` dans les projets
5. Rotation tous les 3 à 6 mois
6. Backup chiffré recommandé (clé USB, gestionnaire de mots de passe)

Voir [README.md](./README.md) pour le détail complet.
