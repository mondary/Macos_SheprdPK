# SheprdPK — configurations locales

Les modifications du fork et les PR restent dans le dépôt voisin `../vendor/`. Ce dépôt versionne les profils et les surcharges d’interface, indépendamment de l’amont.

| Modifier ici | Chemin lu par Sheprd |
| --- | --- |
| `sheprd/` | `~/.config/sheprd` |
| `sheprd-moonframe/` | `${XDG_CONFIG_HOME:-$HOME/.config}/sheprd-moonframe` |
| `.local/config-gpui.local.toml` | `${XDG_CONFIG_HOME:-$HOME/.config}/herdr/config-gpui.local.toml` |

`./link-configs.sh` installe ces liens sans écraser les fichiers existants. Si la destination existe déjà sans être le bon lien, déplacer d’abord l’original en lieu sûr. Le dernier lien n’est créé que si la configuration locale est présente. Sheprd garde ses réglages par défaut et le démon garde sa configuration à leurs emplacements habituels.

Le TOML local contient des identifiants et reste hors Git. Les ressources installées du Material Icon Theme (`material/icons/`, `material/png/`, `material/material-icons.json`) restent également hors Git : les recopier depuis l’installation existante pour retrouver les icônes sur une autre machine.
