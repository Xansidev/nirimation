{
  lib,
  stdenvNoCC,
  python3,
}:

stdenvNoCC.mkDerivation {
  pname = "nirimation";
  version = "1.0.0";

  src = lib.fileset.toSource {
    root = ../.;
    fileset = lib.fileset.unions [
      ../LICENSE
      ../animations/nirimation
      (lib.fileset.fileFilter (file: file.hasExt "kdl") ../animations)
    ];
  };

  buildInputs = [ python3 ];

  installPhase = ''
    runHook preInstall

    install -Dm755 animations/nirimation $out/bin/nirimation
    substituteInPlace $out/bin/nirimation \
      --replace-fail '"/usr/share/nirimation"' "\"$out/share/nirimation\""

    install -dm755 $out/share/nirimation
    install -m644 animations/*.kdl $out/share/nirimation/
    install -Dm644 LICENSE $out/share/licenses/nirimation/LICENSE

    runHook postInstall
  '';

  meta = {
    description = "Animations for the Niri Wayland compositor";
    homepage = "https://github.com/XansiVA/nirimation";
    license = lib.licenses.mit;
    platforms = lib.platforms.linux;
    mainProgram = "nirimation";
  };
}
