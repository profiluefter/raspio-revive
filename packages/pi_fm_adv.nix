{ pkgs }:
pkgs.stdenv.mkDerivation {
  name = "pi_fm_adv";

  src = pkgs.fetchFromGitHub {
    owner = "miegl";
    repo = "PiFmAdv";
    rev = "66af3bd1c1e032492bc445094b007df68f23aff9";
    sha256 = "sha256-SAn62OGHjG0KDqsVf+zyXp5VVuTydA4u6a+WwG0xS3c=";
  };

  buildInputs = with pkgs; [ libsndfile soxr ];

  buildPhase = ''
    make -C src app PCPUI=11 CFLAGS="-Wall -Wno-multichar -std=gnu99 -c -O2 -ffast-math -DRASPI=4"
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp src/pi_fm_adv $out/bin/
  '';
}
