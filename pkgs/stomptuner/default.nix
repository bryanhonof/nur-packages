{
  stdenv,
  fetchFromGitHub,
  git,
  cairo,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "stomptuner";
  version = "0.5";

  src = fetchFromGitHub {
    owner = "brummer10";
    repo = "StompTuner";
    rev = "v${finalAttrs.version}";
    hash = "sha256-ChUlmD3XjAw1Uycchm2i7wnNSo8a9cfVC7+kl5Qwh/E=";
    fetchSubmodules = true;
  };

  nativeBuildInputs = [
    git
  ];

  buildInputs = [
    cairo
  ];
})
