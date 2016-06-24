#!/bin/sh

scdm_tty="$(tty)"

test "$EUID" != 0 \
	-a "${scdm_tty:0:8}" = /dev/tty \
	-a -z "$SCDM_SPAWN" \
	-a -z "$SSH_TTY" \
	&& exec scdm
