#!/bin/sh
echo -ne '\033c\033]0;Barba Azul Tomas Version\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/Bluebeard’s Secrets.x86_64" "$@"
