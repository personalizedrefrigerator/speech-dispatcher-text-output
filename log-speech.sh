#!/bin/bash

# Logs output from speech-dispatcher.
# See also ~/.config/speech-dispatcher/modules/stdout-generic.conf

if test "$1" = "--help"; then
	echo "Help: $0: Logs output from /tmp/speech-stdout"
	exit 1
fi

if test ! -e /tmp/speech-stdout ; then
	mkfifo /tmp/speech-stdout
fi

function cleanup() {
	rm /tmp/speech-stdout
	exit
}

# Handle ctrl+c.
trap cleanup INT

echo "[*] Waiting for output..."

while :
do
	cat /tmp/speech-stdout
done
