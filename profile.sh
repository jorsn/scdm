# To avoid potential situation where cdm(1) crashes on every TTY, here we
# default to execute cdm(1) on tty1 only, and leave other TTYs untouched.
if [[ "$EUID" != 0 ]]; then
	if [[ "$(tty)" == /dev/tty* ]]; then
		[[ -n "$SCDM_SPAWN" ]] && return
		# Avoid executing cdm(1) when X11 has already been started.
		#[[ -z "$DISPLAY$SSH_TTY$(pgrep xinit)" ]] && exec cdm
		[[ -z "$SSH_TTY" ]] && exec scdm
	fi
fi
