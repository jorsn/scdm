scdm — The Simple Console Display Manager
==========================================
**scdm** is a login manager for the console, a bit like
[CDM] but simpler. It can be used instead of DM's like xdm, kdm etc. to
choose and start terminal or X11 sessions.

[CDM]: https://github.com/ghost1227/cdm


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
etc.) or copy the file to `/etc/profile.d/scdm.sh`.

Dependencies
-------------

**scdm** only depends on a posix compliant shell (with utils), the coreutils and,
for X11 logins, `startx(1)`.


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
