#!/bin/bash
# Install a rebuilt GUI without changing its Documents permission identity.
set -euo pipefail
umask 077

patch_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd -P)
build=${1:-"$patch_dir/../vendor/target/release/sheprd"}
identity=${SHEPRDPK_SIGN_IDENTITY:-Apple Development}
app="$HOME/Applications/SheprdPK.app"
bin="$app/Contents/MacOS/sheprd"
backups="$HOME/Library/Application Support/SheprdPK/Backups"
version=$(awk '/^## \[[0-9]+\.[0-9][0-9]\.[0-9]+\] - / { sub(/^## \[/, ""); sub(/\].*$/, ""); print; exit }' "$patch_dir/CHANGELOG.md")
[[ -n "$version" ]] || { echo 'No CalVer in CHANGELOG.md.' >&2; exit 1; }

[[ -x "$build" && -x "$bin" && "$identity" != - ]] || {
    echo 'Expected an installed SheprdPK.app, a rebuilt sheprd and an Apple signing identity.' >&2
    exit 1
}

stage=$(mktemp -d "$HOME/Applications/.sheprdpk-update.XXXXXX")
trap 'rm -rf -- "$stage"' EXIT
candidate="$stage/SheprdPK.app"
ditto "$app" "$candidate"
install -m 755 "$build" "$candidate/Contents/MacOS/sheprd"
plutil -replace CFBundleShortVersionString -string "$version" "$candidate/Contents/Info.plist"
plutil -replace CFBundleVersion -string "$version" "$candidate/Contents/Info.plist"
codesign --force --sign "$identity" --timestamp=none "$candidate"
codesign --verify --deep --strict "$candidate"

requirement() {
    codesign -d -r- "$1" 2>&1 | awk '/^designated => / { sub(/^designated => /, ""); print }'
}
old_requirement=$(requirement "$app")
new_requirement=$(requirement "$candidate")
[[ "$new_requirement" == *'anchor apple generic'* ]] || {
    echo 'The new app must have a stable Apple signing requirement.' >&2
    exit 1
}
if [[ -n "$old_requirement" ]]; then
    codesign --verify -R "=$old_requirement" "$candidate"
fi

before=$("$bin" status --json) || [[ $? == 3 ]]
old_pid=$(jq -r '.pid // empty' <<<"$before")
mkdir -p "$backups"
backup=$(mktemp -d "$backups/update.XXXXXX")/SheprdPK.bundle-backup
if [[ -n "$old_pid" ]]; then
    "$bin" app quit
    for ((i = 0; i < 40; i++)); do
        if ! kill -0 "$old_pid" 2>/dev/null; then break; fi
        sleep 0.2
    done
    if kill -0 "$old_pid" 2>/dev/null; then
        echo 'SheprdPK did not quit; it has not been replaced.' >&2
        exit 1
    fi
fi

mv "$app" "$backup"
if ! mv "$candidate" "$app"; then
    mv "$backup" "$app"
    open -a "$app"
    exit 1
fi
printf 'Previous app saved at %s\n' "$backup"
open -a "$app"

for ((i = 0; i < 80; i++)); do
    if running=$("$bin" status --json) && jq -e --arg old "$old_pid" '.pid and (.pid | tostring) != $old and (.windows | length > 0)' >/dev/null <<<"$running"; then
        remote=$("$bin" remote status --json)
        if jq -e '.enabled' >/dev/null <<<"$remote"; then
            # Moving the bundle doesn't stop a running helper in the old copy.
            "$bin" remote restart
        fi
        exit 0
    fi
    sleep 0.25
done
echo 'SheprdPK did not report a running window after the update.' >&2
exit 1
