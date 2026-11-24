# SheprdPK

Version **2026.11.06** · [Français](README.md) · [Changelog](CHANGELOG.md)

SheprdPK: the [Sheprd](https://github.com/sheprd-labs/sheprd) client and the local profiles that go with it. This repository holds both: the fork's source as a submodule, the configuration files and scripts beside it.

| Folder | Role |
| --- | --- |
| `vendor/` | Sheprd's source, a submodule of the fork [mondary/sheprd](https://github.com/mondary/sheprd) — fork changes and upstream pull requests |
| `patch/` | Local profiles, interface overrides, configuration links and the app update |

## Install

```sh
git clone --recurse-submodules https://github.com/mondary/Macos_SheprdPK
cd Macos_SheprdPK
./patch/link-configs.sh
```

## Local profiles

| Edit here | Path used by Sheprd |
| --- | --- |
| `patch/sheprd/` | `~/.config/sheprd` |
| `patch/sheprd-moonframe/` | `${XDG_CONFIG_HOME:-$HOME/.config}/sheprd-moonframe` |
| `patch/.local/config-gpui.local.toml` | `${XDG_CONFIG_HOME:-$HOME/.config}/herdr/config-gpui.local.toml` |

`./patch/link-configs.sh` installs these links without overwriting existing files. If a destination exists and is not the correct link, move the original somewhere safe first. The last link is only created if the local configuration exists. Sheprd and the daemon keep their default settings paths.

The local TOML contains credentials and stays out of Git. The installed Material Icon Theme assets (`material/icons/`, `material/png/`, `material/material-icons.json`) also stay out of Git. Copy them from an existing installation to use the same icons on another machine.

## The application

In the right sidebar, **Git → Repositories** lets you select a local repository inside a parent folder and see its branch, changes, and recent commits. When the terminal has focus, Tab and Shift+Tab go to OpenCode or whichever program is running.

The bottom bar shows available provider quotas and detected system resources. The steaming cup indicates that sleep is being prevented. Click the version number to open About or check for updates. A local build can check official releases without installing them. The **Details** button moves the pane on each click: right of the tabs, hidden, then left between the workspaces and the tabs. The choice is kept at the next launch.

## Updating SheprdPK on this Mac

From `vendor/`, build with `cargo build --locked --release -p sheprd-gpui --features moonframe`, then run `../patch/update-app.sh`. The script updates `~/Applications/SheprdPK.app`, backs up the old version, and relaunches the app and its remote helper without closing terminals.

Support this project on [Ko-fi](https://ko-fi.com/pouark).
