{
  pkgs,
  logo ? ./assets/default-logo.gif,
}:
let
  outDir = "$out/share/plymouth/themes/plymouth-gif-theme";
in
pkgs.stdenv.mkDerivation {
  pname = "plymouth-gif-theme";
  version = "1.0.0";
  dontBuild = true;
  src = ./theme;

  nativeBuildInputs = with pkgs; [
    ffmpeg
  ];

  installPhase = ''
    mkdir -p ${outDir}
    mkdir -p ${outDir}/frames

    pushd ${outDir}/frames
    ${pkgs.ffmpeg}/bin/ffmpeg -i ${logo} frame%d.png
    frame_count=$(ls . | wc -l)
    popd

    cp -r * ${outDir}
    find ${outDir} -name \*.plymouth -exec sed -i "s@\/usr\/@$out\/@" {} \;

    sed -i "1iFRAME_COUNT=$frame_count;" ${outDir}/video.script
  '';
}
