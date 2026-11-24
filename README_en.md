# SheprdPK — local configuration

Version **2026.11.02** · [Français](README.md) · [Changelog](CHANGELOG.md)

Fork changes and pull requests belong in the neighboring `../vendor/` repository. This repository tracks profiles and interface overrides independently of upstream.

In the right sidebar, **Git → Repositories** lets you select a local repository inside a parent folder and see its branch, changes, and recent commits. When the terminal has focus, Tab and Shift+Tab go to OpenCode or whichever program is running.

The bottom bar shows available provider quotas and detected system resources. The steaming cup indicates that sleep is being prevented. Click the version number to open About or check for updates. A local build can check official releases without installing them.

| Edit here | Path used by Sheprd |
| --- | --- |
| `sheprd/` | `~/.config/sheprd` |
| `sheprd-moonframe/` | `${XDG_CONFIG_HOME:-$HOME/.config}/sheprd-moonframe` |
| `.local/config-gpui.local.toml` | `${XDG_CONFIG_HOME:-$HOME/.config}/herdr/config-gpui.local.toml` |

`./link-configs.sh` installs these symlinks without overwriting existing files. If a destination exists and is not the correct symlink, move the original somewhere safe first. The last link is only created if the local configuration exists. Sheprd and the daemon keep their default settings paths.

The local TOML contains credentials and stays out of Git. The installed Material Icon Theme assets (`material/icons/`, `material/png/`, `material/material-icons.json`) also stay out of Git. Copy them from an existing installation to use the same icons on another machine.

Support this project on [Ko-fi](https://ko-fi.com/pouark).

## Updating SheprdPK on this Mac

From `vendor/`, build with `cargo build --locked --release -p sheprd-gpui --features moonframe`, then run `../patch/update-app.sh`. The script updates `~/Applications/SheprdPK.app`, backs up the old version, and relaunches the app and its remote helper without closing terminals.
