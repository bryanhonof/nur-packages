{
  stdenv,
  fetchFromGitHub,

  pkg-config,
  git,
  cairo,
  fftw,
  fftwFloat,
  lv2,
  liblo,
  jack2,
}:


stdenv.mkDerivation (finalAttrs: {
  pname = "StompTuner";
  version = "0.5";

  src = fetchFromGitHub {
    owner = "brummer10";
    repo = "StompTuner";
    fetchSubmodules = true;
    rev = "v${finalAttrs.version}";
    hash = "sha256-ChUlmD3XjAw1Uycchm2i7wnNSo8a9cfVC7+kl5Qwh/E=";
  };

  postPatch = ''
    patchShebangs dpf/utils
  '';

  nativeBuildInputs = [
    pkg-config
    git
    fftw
    fftwFloat
  ];

  buildInputs = [
    cairo
    liblo
    lv2
    jack2
  ];

  makeFlags = [
    "SKIP_NATIVE_AUDIO_FALLBACK8=true"
    "BUILD_AU=false"
  ];

  installFlags = [
    "PREFIX="
    "DESTDIR=${placeholder "out"}"
  ];
})
