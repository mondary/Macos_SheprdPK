# SheprdPK

Version **2026.11.06** · [English](README_en.md) · [Changelog](CHANGELOG.md)

SheprdPK : le client [Sheprd](https://github.com/sheprd-labs/sheprd) et les profils locaux qui l'accompagnent. Le dépôt réunit les deux : le code du fork en submodule, les fichiers de configuration et les scripts à côté.

| Dossier | Rôle |
| --- | --- |
| `vendor/` | Source de Sheprd, submodule vers le fork [mondary/sheprd](https://github.com/mondary/sheprd) — modifications du fork et PR amont |
| `patch/` | Profils locaux, surcharges d'interface, liens de configuration et mise à jour de l'app |

## Installer

```sh
git clone --recurse-submodules https://github.com/mondary/Macos_SheprdPK
cd Macos_SheprdPK
./patch/link-configs.sh
```

## Profils locaux

| Modifier ici | Chemin lu par Sheprd |
| --- | --- |
| `patch/sheprd/` | `~/.config/sheprd` |
| `patch/sheprd-moonframe/` | `${XDG_CONFIG_HOME:-$HOME/.config}/sheprd-moonframe` |
| `patch/.local/config-gpui.local.toml` | `${XDG_CONFIG_HOME:-$HOME/.config}/herdr/config-gpui.local.toml` |

`./patch/link-configs.sh` installe ces liens sans écraser les fichiers existants. Si la destination existe déjà sans être le bon lien, déplacer d'abord l'original en lieu sûr. Le dernier lien n'est créé que si la configuration locale est présente. Sheprd garde ses réglages par défaut et le démon garde sa configuration à leurs emplacements habituels.

Le TOML local contient des identifiants et reste hors Git. Les ressources installées du Material Icon Theme (`material/icons/`, `material/png/`, `material/material-icons.json`) restent également hors Git : les recopier depuis l'installation existante pour retrouver les icônes sur une autre machine.

## L'application

Dans le panneau droit, **Git → Repositories** permet de choisir un dépôt local dans un dossier parent et de voir sa branche, ses modifications et ses derniers commits. Quand le terminal a le focus, Tab et Maj+Tab sont transmis à OpenCode ou au programme actif.

En bas de la fenêtre, la barre affiche les quotas disponibles des fournisseurs et les ressources détectées de la machine. La tasse fumante indique que la veille est suspendue. Clique sur le numéro de version pour afficher À propos ou rechercher des mises à jour. La build locale peut consulter les versions officielles sans les installer. Le bouton **Details** déplace le panneau à chaque clic : à droite des onglets, masqué, puis à gauche entre les workspaces et les onglets. Le choix est conservé au prochain lancement.

## Mettre à jour SheprdPK sur ce Mac

Depuis `vendor/`, compiler avec `cargo build --locked --release -p sheprd-gpui --features moonframe`, puis lancer `../patch/update-app.sh`. Le script met à jour `~/Applications/SheprdPK.app`, conserve une copie de l'ancienne version et relance l'app et son service distant sans fermer les terminaux.

Soutenir ce projet sur [Ko-fi](https://ko-fi.com/pouark).
