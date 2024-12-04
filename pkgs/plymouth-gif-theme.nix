{
  stdenv,
  lib,
  ffmpeg,
  gif ? ../assets/boot.gif,
}:
let
  name = "plymouth-gif-theme";
  description = "A plymouth theme that shows a custom GIF.";
  outDir = "$out/share/plymouth/themes/${name}";

  themeFileContents = ''
    [Plymouth Theme]
    Name=${name}
    Description=${description}
    ModuleName=script

    [script]
    ImageDir=${outDir}/frames
    ScriptFile=${outDir}/video.script
  '';

  videoScriptContents = ''
    Window.SetBackgroundTopColor(0, 0, 0);
    Window.SetBackgroundBottomColor(0, 0, 0);

    for (i = 0; i < $frame_count; i++) {
      images[i] = Image("frame" + (i + 1) + ".png");
    }

    sprite = Sprite();
    sprite.SetX(Window.GetWidth() / 2 - images[0].GetWidth() / 2);
    sprite.SetY(Window.GetHeight() / 2 - images[0].GetHeight() / 2);

    progress = 1;

    fun RefreshCallback() {
      sprite.SetImage(images[progress]);
      progress++;
    }

    Plymouth.SetRefreshFunction(RefreshCallback);
  '';
in
stdenv.mkDerivation {
  pname = "plymouth-gif-theme";
  version = "1.0.1";
  phases = [ "installPhase" ];
  nativeBuildInputs = [ ffmpeg ];

  installPhase = ''
    mkdir -p ${outDir}
    mkdir -p ${outDir}/frames

    pushd ${outDir}/frames
    ffmpeg -i ${gif} frame%d.png
    frame_count=$(ls . | wc -l)
    popd

    cat <<EOF > "${outDir}/plymouth-gif-theme.plymouth"
    ${themeFileContents}
    EOF

    cat <<EOF > "${outDir}/video.script"
    ${videoScriptContents}
    EOF
  '';

  meta = {
    inherit description;
    platforms = lib.platforms.linux;
  };
}
