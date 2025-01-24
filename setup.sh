#!/bin/bash

SCRIPT_PATH="$(dirname $0)"
CONFIG_PATH="$HOME/.config/speech-dispatcher"

if test ! -d "$CONFIG_PATH" ; then
	echo "[WARN] Speech dispatcher configuration not found. Running spd-conf to create a user configuration file. Please follow the prompts."
	spd-conf -uc
fi

# Copy config files
echo "[...] Copying config files..."
cp "$SCRIPT_PATH/stdout-generic.conf" "$CONFIG_PATH/modules/stdout-generic.conf"

# Allow speech-dispatcher to choose the stdout-generic speech dispatcher
if cat "$CONFIG_PATH/speechd.conf" | grep -i stdout-generic ; then
	echo "[OK] Already configured!"
else

echo '
# Custom output module: stdout-generic was added by "speech-dispatcher-to-stdout".
AddModule "stdout-generic" "sd_generic" "stdout-generic.conf"
'

fi

echo "Done!"

