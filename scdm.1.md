% scdm(1) scdm v2.0 | General Commands Manual
% Copyright (c) 2013--2016 Johannes Rosenberger <jo.rosenberger@gmx-topmail.de>. This program is licensed under a BSD style license
% 2016-05-23

NAME
=============

scdm - simple console display manager


SYNOPSIS
=============

scdm [*rcfile*]


DESCRIPTION
=============

**scdm** is a login manager for the console - a bit like
[CDM] but simpler: It has no ConsoleKit support and no dialog(1) interface.
It can be used instead of DM's like xdm, kdm etc. to choose and start
terminal or X11 sessions.

For **scdm** to be automatically launched on tty logins simply copy
*/usr/local/share/scdm/profile.sh* to */etc/profile.d/scdm.sh*.


FILES
=============

| *rcfile*
| *~/.scdmrc*
| */etc/scdmrc*
|
|       Configuration files. Evaluated in this order. For a documented example
|       consult the example file (*/etc/scdmrc*).

| */etc/profile.d/scdm.sh*
| */usr/local/share/scdm/profile.sh*
|
|       Launcher script and example.

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
