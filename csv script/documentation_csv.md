# Documentation du fichier CSV pour le script CMD


## Types d'opérations

### 1. Création d'OU (ou-)
- Format : `ou-NomOU`
- Options :
  - `-` : Crée l'OU avant le dernier OU créé
  - `--` : Recule de 2 positions
  - `---` : Recule de 3 positions
- Exemple : `ou-DepartementIT`

### 2. Création d'utilisateur (user-)
- Format : `user-NomUtilisateur`
- Options :
  - `-` : sera ajouté dans le dernier groupe créé
- Mot de passe par défaut : P@ssw0rd
- Exemple : `user-Jean.Dupont`

### 3. Création de groupe global (gg-)
- Format : `gg-NomGroupe`
- Options :
  - `-` : sera ajouté dans le dernier groupe créé
- Exemple : `gg-Administrateurs`

### 4. Création de dossier (dl-)
- Format : `dl-NomDossier-Permissions`
- Options :
  - `-` : Crée le dossier à la racine de C: avec les permissions NTFS
  - `--` : Crée le dossier dans le dernier dossier créé
  - `---` : Crée un sous-dossier dans le dernier dossier créé
- Permissions possibles :
  - `L-E` : Lecture et Écriture (Modification)
  - `L` : Lecture seule
  - `X` : Refus d'accès
- Exemple : `dl-Projets-L-E`

## Règles importantes
1. Ne jamais utiliser le caractère `/` dans les noms
2. Utiliser `_` au lieu de `-` dans les noms de dossiers
3. Les noms ne doivent pas contenir de tirets (`-`)
