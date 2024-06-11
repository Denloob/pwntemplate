#!/usr/bin/env bash

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
CONFIG_PATH=~/.config/pwntmpl/

mkdir -p "$CONFIG_PATH"
cp "$SCRIPT_DIR/remote_only.mako" "$SCRIPT_DIR/binary_exploitation.mako" "$CONFIG_PATH"

INSTALL_PATH="/usr/bin/pwntmpl"

cp -i "$SCRIPT_DIR/pwntmpl" "$INSTALL_PATH"
