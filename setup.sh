#!/bin/bash

# setup.sh: Configures speech-dispatcher.

# The directory that contains this script (and should also contain
# other setup files).
SCRIPT_DIR="$(dirname "$0")"

# The path with speech-dispatcher configuration files
CONFIG_PATH="$HOME/.config/speech-dispatcher"

# Create configuration directories, if they don't exist.
if test ! -d "$CONFIG_PATH" ; then
	echo "[WARN] Speech dispatcher configuration not found. Running spd-conf to create a user configuration file. Please follow the prompts."
	# -u: Create settings for the current user
	# -c: Configure basic settings
	spd-conf -uc
fi

# Copy config files
echo "[...] Copying config files..."
cp "$SCRIPT_DIR/stdout-generic.conf" "$CONFIG_PATH/modules/stdout-generic.conf"

# Allow speech-dispatcher to choose the stdout-generic speech dispatcher
if grep -i stdout-generic "$CONFIG_PATH/speechd.conf" ; then
	echo "[OK] Already configured!"
else

echo '
# Custom output module: stdout-generic was added by "speech-dispatcher-to-stdout".
AddModule "stdout-generic" "sd_generic" "stdout-generic.conf"
' >> "$CONFIG_PATH/speechd.conf"
	echo "[OK] Added stdout-generic as a speech-dispatcher output method"

fi

echo "[OK] Done!"

