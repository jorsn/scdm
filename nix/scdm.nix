{
  # use flags
  preferBusybox ? true,
  X ? true,
  # dependencies
  coreutils,

  ## alternatives

  ### if preferBusybox == true
  busybox,
  ### else
  bash,
  gawk,
  gnugrep,
  gnused,
  kbd,

  ## optionals

  ### if X
  xorg,

  # lib functions
  lib,
  stdenv
}:

let
  busyboxOr    = p: if preferBusybox then busybox else p;
  busyboxOrGnu = if preferBusybox then [ busybox ] else [ bash gawk gnugrep gnused kbd ];
  runtimeDeps  = [ coreutils ] ++ busyboxOrGnu ++ lib.optional X xorg.xinit;
  sh           = busyboxOr bash;
  sed          = busyboxOr gnused;
in stdenv.mkDerivation rec {
  name = "scdm-${version}";
  version = "2.1";

  src = ./..;

  buildInputs = [ sh ];

  dontBuild = true;

  makeFlags = [ "prefix=$(out)" "etcdir=$(docdir)" ];

  manDescNoteNixOS = ''
    If you are using NixOS, you may want to
    .Em append
    it to
    .Cd environment.loginShellInit
    in your
    .Pa configuration.nix .
    .\" END DESCRIPTION'';

  preInstall = ''
    substituteInPlace scdm.1 --replace '/usr/local' "$out"
    substituteInPlace scdm.1 --replace '.\" END DESCRIPTION' '${manDescNoteNixOS}'
    ${sed}/bin/sed -i -e ':a' -e 'N' -e '$ba' \
        -e 's%\(consult the example file \\\nPq Pa \)/etc\(/scdmrc .\)%\1'"$out"'/doc\2%g' scdm.1
    ${sed}/bin/sed -i '1a \export PATH="${lib.makeBinPath ([ "$out"  ] ++ runtimeDeps)}"' scdm
  '';

  meta = {
    description = "The Simple Console Display Manager";
    longDescription =
      ''
        ${name} is a login manager for the console. It can be used instead of DM's like
        xdm, kdm etc. to choose and start terminal or X11 sessions.

        Use flags:
            * `preferBusybox` (`true`): use busybox for all applicable dependencies;
                                        Otherwise, gnu utilities are used.
            * `X`             (`true`): install startx to support X sessions
      '';


    homepage = "https://github.com/jorsn/scdm";
    downloadPage = "https://github.com/jorsn/scdm/releases";
    license = lib.licenses.bsd3;

    platforms = lib.platforms.unix;
    hydraPlatforms = [];
  };
}
