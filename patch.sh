#!/bin/bash

shortcuts_to_process=(
    "/var/lib/snapd/desktop/applications/chromium_chromium.desktop"
    "/var/lib/snapd/desktop/applications/spotify_spotify.desktop"
    "/usr/share/applications/codium.desktop"
)

for index in "${!shortcuts_to_process[@]}"; do
    echo "Now processing: ${shortcuts_to_process[$index]}"
    cp "${shortcuts_to_process[$index]}" "${shortcuts_to_process[$index]}.backup"
    sed -i '/^Exec=/!b;/--ozone-platform=wayland/!s/$/ --ozone-platform=wayland/' "${shortcuts_to_process[$index]}"
done


