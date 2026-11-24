# SheprdPK — configurations locales

Version **2026.11.02** · [English](README_en.md) · [Changelog](CHANGELOG.md)

Les modifications du fork et les PR restent dans le dépôt voisin `../vendor/`. Ce dépôt versionne les profils et les surcharges d’interface, indépendamment de l’amont.

Dans le panneau droit, **Git → Repositories** permet de choisir un dépôt local dans un dossier parent et de voir sa branche, ses modifications et ses derniers commits. Quand le terminal a le focus, Tab et Maj+Tab sont transmis à OpenCode ou au programme actif.

En bas de la fenêtre, la barre affiche les quotas disponibles des fournisseurs et les ressources détectées de la machine. La tasse fumante indique que la veille est suspendue. Clique sur le numéro de version pour afficher À propos ou rechercher des mises à jour. La build locale peut consulter les versions officielles sans les installer.

| Modifier ici | Chemin lu par Sheprd |
| --- | --- |
| `sheprd/` | `~/.config/sheprd` |
| `sheprd-moonframe/` | `${XDG_CONFIG_HOME:-$HOME/.config}/sheprd-moonframe` |
| `.local/config-gpui.local.toml` | `${XDG_CONFIG_HOME:-$HOME/.config}/herdr/config-gpui.local.toml` |

`./link-configs.sh` installe ces liens sans écraser les fichiers existants. Si la destination existe déjà sans être le bon lien, déplacer d’abord l’original en lieu sûr. Le dernier lien n’est créé que si la configuration locale est présente. Sheprd garde ses réglages par défaut et le démon garde sa configuration à leurs emplacements habituels.

Le TOML local contient des identifiants et reste hors Git. Les ressources installées du Material Icon Theme (`material/icons/`, `material/png/`, `material/material-icons.json`) restent également hors Git : les recopier depuis l’installation existante pour retrouver les icônes sur une autre machine.

Soutenir ce projet sur [Ko-fi](https://ko-fi.com/pouark).

## Mettre à jour SheprdPK sur ce Mac

Depuis `vendor/`, compiler avec `cargo build --locked --release -p sheprd-gpui --features moonframe`, puis lancer `../patch/update-app.sh`. Le script met à jour `~/Applications/SheprdPK.app`, conserve une copie de l’ancienne version et relance l’app et son service distant sans fermer les terminaux.

Garder le même certificat Apple Development pour les mises à jour : une signature ad hoc lie l’autorisation Documents aux octets d’un seul build. Si plusieurs certificats sont disponibles, choisir le certificat utilisé précédemment avec `SHEPRDPK_SIGN_IDENTITY`. macOS peut demander une nouvelle décision Documents lors du premier passage à la signature stable. Le script n’accorde aucune autorisation.
