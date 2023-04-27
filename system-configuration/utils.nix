{ pkgs, self, system, ... }: {
  environment.systemPackages = [
    pkgs.yt-dlp
    pkgs.ffmpeg_5-full
    pkgs.libraspberrypi
    pkgs.git
    pkgs.gnumake
    pkgs.alsa-utils
    pkgs.screen
    pkgs.sox
    pkgs.wget
  ];
}
