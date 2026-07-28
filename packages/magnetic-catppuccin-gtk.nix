{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  sassc,
}:

stdenvNoCC.mkDerivation {
  pname = "magnetic-catppuccin-gtk";
  version = "unstable-2026-01-15";

  src = fetchFromGitHub {
    owner = "Fausto-Korpsvart";
    repo = "Catppuccin-GTK-Theme";
    rev = "main";
    hash = "sha256-bSEWm62EWHC9zcYA+YoQp2cuSFt2FDsjalapnjYdoYU=";
  };

  nativeBuildInputs = [
    sassc
  ];

    # cd "$src/themes"
    #
    # mkdir -p "$out/share/themes"
    #
    # cp ./install.sh ./install-nix.sh
    # chmod +x ./install-nix.sh
    # patchShebangs ./install-nix.sh

  installPhase = ''
    runHook preInstall

    cp -r . "$TMPDIR/Catppuccin-GTK-Theme"
    chmod -R u+w "$TMPDIR/Catppuccin-GTK-Theme"

    cd "$TMPDIR/Catppuccin-GTK-Theme/themes"
    patchShebangs ./install.sh

    export HOME="$TMPDIR/home"
    mkdir -p "$HOME"

    BATCH_MODE=true ./install.sh \
      --dest "$out/share/themes" \
      --theme mauve \
      --mode dark \
      --size standard

    runHook postInstall
  '';

  meta = {
    description = "Catppuccin GTK theme";
    homepage = "https://github.com/Fausto-Korpsvart/Catppuccin-GTK-Theme";
    license = lib.licenses.gpl3Only;
    platforms = lib.platforms.linux;
  };
}
