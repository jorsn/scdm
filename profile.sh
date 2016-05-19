#!/bin/sh

if [[ "$EUID" != 0 ]]; then
	if [[ "$(tty)" == /dev/tty* ]]; then
		[[ -n "$SCDM_SPAWN" ]] && return
		[[ -z "$SSH_TTY" ]] && exec scdm
	fi
fi
