{ self, config, ... }: {
  imports = [ self.nixosModules.pi-fm ];

  services.icecast = {
    enable = true;
    hostname = config.networking.hostName + ".local";
    admin.user = "admin";
    admin.password = "password";
    extraConf = ''
      <authentication>
        <source-password>password</source-password>
      </authentication>
    '';
  };
}
