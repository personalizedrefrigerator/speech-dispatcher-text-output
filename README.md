# speech-dispatcher-text-output

This project sets up an output module for [`speech-dispatcher`](https://github.com/brailcom/speechd) that logs text to a terminal (rather than speaking it aloud).

# Setup

## Option 1: Using `setup.sh`

1. Run `setup.sh`.
    - `setup.sh` is responsible for adding `stdout-generic` as a speech dispatcher module.
2. (Optional) In `~/.config/speech-dispatcher/speechd.conf`, change `DefaultModule` to `stdout-generic`.
3. Run `bash log-speech.sh`.
	- This creates a FIFO at `/tmp/speech-stdout`, then repeatedly logs output from that FIFO.
	- Pressing <kbd>ctrl</kbd>-<kbd>c</kbd> removes the FIFO and ends the output loop.

## Option 2: Manual setup

1. Run `spd-conf -uc` to initialize speech-dispatcher configuration files.
2. Copy `stdout-generic.conf` to `~/.config/speech-dispatcher/modules/`
3. Add `stdout-generic` as an output module. At the end of `~/.config/speech-dispatcher/speechd.conf`, add,
   ```conf
   #         Name             Type         Configuration file
   AddModule "stdout-generic" "sd_generic" "stdout-generic.conf"
   ```
4. (Optional) In `~/.config/speech-dispatcher/speechd.conf`, change `DefaultModule` to `stdout-generic`.

After setup, run `log-speech.sh` to:
1. Create a fifo `/tmp/speech-stdout` (with `mkfifo`).
    - `stdout-generic.conf` configures `speech-dispatcher` to push output to `/tmp/speech-stdout`.
2. Log output from `/tmp/speech-stdout` (by repeatedly calling `cat /tmp/speech-stdout/`).
