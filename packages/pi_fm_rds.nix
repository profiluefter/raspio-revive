{ pkgs }:
pkgs.stdenv.mkDerivation {
  name = "pi_fm_rds";

  src = pkgs.fetchFromGitHub {
    owner = "ChristopheJacquet";
    repo = "PiFmRds";
    rev = "b0f253232b2c5084c51dc81200e6d1a116221ff2";
    sha256 = "sha256-vTX3sHvwg5igMaUIayChFBXM/pdjREzo8Jv2cuLLfEY=";
  };

  buildInputs = with pkgs; [ libsndfile soxr ];

  buildPhase = ''
    make -C src RPI_VERSION=3
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp src/pi_fm_rds $out/bin/
  '';
}
