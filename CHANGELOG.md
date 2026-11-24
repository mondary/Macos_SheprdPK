# Changelog

Historique du projet SheprdPK : le fork Sheprd (`vendor/`) et les profils locaux (`patch/`).

## TODO — Roadmap

Statut : 2026.11.06

### Phase 1 — Projet et application

- [x] Profils locaux versionnés
- [x] Panneau Git multi-dépôts et clavier Tab dans les terminaux
- [x] Barre Moonframe : indicateurs natifs et panneau Details déplaçable
- [x] Dépôt parapluie avec `vendor/` en submodule
- [ ] Landing promotionnelle bilingue `store/`
- [ ] Présence sur le hub `Web_HubApps`

---

## Releases

## [2026.11.07] - 2026-11-24

### Fixed

- `update-app.sh` lit le changelog à la racine du projet après le regroupement en dépôt parapluie.

## [2026.11.06] - 2026-11-24

### Changed

- Le projet s'organise en dépôt parapluie : `patch/` porte les profils et `vendor/` est le submodule du fork Sheprd.

Historique des builds locaux de SheprdPK.

## [2026.11.05] - 2026-11-24

### Added

- Le bouton Details déplace le panneau à chaque clic : à droite des onglets, masqué, puis à gauche entre les workspaces et les onglets. Le choix est conservé.

### Fixed

- Donner aux indicateurs natifs toute la hauteur de la barre, pour afficher les quotas, les ressources et la tasse.

## [2026.11.04] - 2026-11-24

### Fixed

- Rétablir la barre du bas après le chargement des indicateurs natifs au démarrage.

## [2026.11.03] - 2026-11-24

### Fixed

- Rechercher des mises à jour ouvre le panneau dédié et vérifie les versions officielles en lecture seule dans la build locale.

## [2026.11.02] - 2026-11-24

### Added

- Un clic sur la version ouvre les actions À propos et Rechercher des mises à jour.

### Fixed

- Moonframe retrouve les quotas des fournisseurs, les indicateurs de ressources et la tasse fumante de la barre classique.

## [2026.11.01] - 2026-11-24

### Added

- L’onglet Git affiche les dépôts locaux d’un dossier parent et permet de consulter la branche, les modifications et l’historique de chacun.

### Fixed

- Tab et Maj+Tab sont transmis au terminal actif dans Moonframe, notamment pour les raccourcis d’OpenCode.
