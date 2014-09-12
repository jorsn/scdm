% scdm(1) scdm v1.1.1 | General Commands Manual
% Copyright (c) 2014 Johannes Rosenberger <jo.rosenberger@gmx-topmail.de>. This program is licensed under a BSD style license
% 2014-04-25

NAME
=============

scdm - simple console display manager


SYNOPSIS
=============

scdm [*rcfile*]


DESCRIPTION
=============

**scdm** is a simple console display manager a bit like [CDM] but simpler:
It has no ConsoleKit support and no dialog interface.
It can be used instead of DM's like xdm, kdm etc.
scdm is automatically launched if you login in a getty by its start script in /etc/profile.d,
displays a list of sessions in a bash select loop and starts the specified
session.


FILES
=============

| *rcfile*
| *~/.scdmrc*
| */etc/scdmrc*
|
|       Configuration files. Evaluated in this order.

| */etc/profile.d/scdm.sh*
|
|       Launcher script.

| *~/.xprofile*
| */etc/xprofile*
| *~/.xlogout*
| */etc/xlogout*
|
|       Like *~/.profile* or *~/.bash\_logout*, only for X sessions.


BUGS
=============

If you encounter any or would like additional features, please send a mail to
Johannes Rosenberger <jo.rosenberger@gmx-topmail.de>



[CDM]: https://github.com/ghost1227/cdm

<!-- vim: ft=markdown ts=4 sw=4 expandtab
-->
