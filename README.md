scdm — The Simple Console Display Manager
==========================================

[![tests on branch master](https://img.shields.io/travis/jorsn/scdm/master.svg?label=tests%20on%20branch%20master)](https://travis-ci.org/jorsn/scdm)
[![tests on branch dev](https://img.shields.io/travis/jorsn/scdm/dev.svg?label=tests%20on%20branch%20dev)](https://travis-ci.org/jorsn/scdm)

**scdm** is a login manager for the console, a bit like
[CDM] but simpler. It can be used instead of DM's like xdm, kdm etc. to
choose and start terminal or X11 sessions.

[CDM]: https://github.com/ghost1227/cdm


Installation
------------

### Nix

Ad-hoc installation:

    $ nix-env -if https://github.com/jorsn/scdm/archive/<tag/commit>.tar.gz

For a declarative installation you can include the following line in a location
where you define packages, e.g. in an overlay like this:

```nix
self: super:

{
    scdm = import (builtins.fetchTarball
        https://github.com/jorsn/scdm/archive/nix.tar.gz)
        { pkgs = super; };
}
```

### Gentoo

An ebuild is available in [this overlay](https://github.com/jorsn/jorsn-gentoo).


### Other *nixes

* Type `make install`. The default installation `prefix` is `/usr/local`.
* Or create a package for your distribution, publish and install this
  and tell me about it, e.g. via a pull request or just an email to
  johannes.rosenberger (at) jorsn.eu.


Configuration & Invocation
---------------------------

The configuration is almost self-explaining. It is documented in
the example scdmrc.

To run **scdm**, use

    $ scdm <rcfile>

**scdm** tries to source configuration files in this order, and uses the first
existing one:

    <rcfile specified on command line>
    $HOME/.scdmrc
    /etc/scdmrc

To autostart **scdm** when you log in your account, copy the content of
`/usr/share/doc/scdm/profile.sh` to the tail of your shell profile (`~/.profile`,
etc.) or copy the file to `/etc/profile.d/` and make sure it is sourced after
everything else, e.g. name the file `1000-scdm.sh` (because it uses exec).

If you are using NixOS, you may want to append it to `environment.loginShellInit`
in your `configuration.nix`.


Bugs & Enhancements
-------------------

If you encounter any bugs or have ideas for enhancements, please send me an email or
create an issue at [GitHub](https://github.com/jorsn/scdm/issues).

Dependencies
-------------

**scdm** only depends on:

* a posix compliant shell (with utils)
* `fgconsole`, which is provided by [busybox](https://busybox.net/)
   or the [linux keyboard tools](http://kbd-project.org/)
* the coreutils
* `startx(1)` if you want to start X11 sessions

The first two points are fully covered by busybox.

Copyright
----------

Copyright (c) 2013--2018 Johannes Rosenberger

This code is released under a BSD Style License.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY
EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT
SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED
TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH
DAMAGE.

For more details please read the '[LICENSE]' file.

[LICENSE]: https://github.com/jorsn/scdm/blob/master/LICENSE
