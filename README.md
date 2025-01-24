# speech-dispatcher-to-stdout

This project sets up an output module for the Linux `speech-dispatcher`. Rather than speaking aloud, output is logged to a terminal.

## Setup

1. Run `setup.sh`.
    - `setup.sh` is responsible for adding `stdout-generic` as a speech dispatcher module.
2. (Optional) In `~/.config/speech-dispatcher/speechd.conf`, change `DefaultModule` to `stdout-generic`.
3. Run `bash log-speech.sh`.
	- This creates a FIFO at `/tmp/speech-stdout`, then repeatedly logs output from that FIFO.
	- Pressing [ctrl]-[c] removes the FIFO and ends the output loop.

