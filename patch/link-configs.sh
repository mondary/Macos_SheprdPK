#!/bin/sh
# Link the checked-out profiles without replacing anything already installed.
# .local/config-gpui.local.toml is optional and must stay out of Git.
set -eu

patch_dir=$(CDPATH= cd -P -- "$(dirname -- "$0")" && pwd -P)
config_dir=${XDG_CONFIG_HOME:-"$HOME/.config"}

link() {
    source=$1
    dest=$2
    if [ -L "$dest" ] && [ "$(readlink "$dest")" = "$source" ]; then
        return
    fi
    if [ -e "$dest" ] || [ -L "$dest" ]; then
        printf 'Refusing to replace %s; back it up first.\n' "$dest" >&2
        exit 1
    fi
    mkdir -p -- "$(dirname -- "$dest")"
    ln -s -- "$source" "$dest"
    printf '%s -> %s\n' "$dest" "$source"
}

# The Material provider also looks for its pack at ~/.config/sheprd.
link "$patch_dir/sheprd" "$HOME/.config/sheprd"
link "$patch_dir/sheprd-moonframe" "$config_dir/sheprd-moonframe"
if [ -f "$patch_dir/.local/config-gpui.local.toml" ]; then
    link "$patch_dir/.local/config-gpui.local.toml" "$config_dir/herdr/config-gpui.local.toml"
fi
