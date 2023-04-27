{ ... }:
let
  sshPublicKey =
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC08RPLOfIN7dNGxDwi1xlYjLCDp7sIGsPrSIP+++Io5VJY8W0FzXRbYEwpwuoBW3JG2RybRa/kjOcAm3uDTKEzGJYtiT8zIt/DCI7D8DgaWNAyQq6DMiFPVZDhT6UUKGTuDkfd+AmXbXuDgSxOk5W54GaVvOGPyUDCeN3h++RYnfUIgJ7MqX4YU5aUflMniIIFQGupizvDeB+AiAry+5+dknhQKu49Lny0esh7zc3/fvTYfMgXxEvdkJ1udxzkCPYWiPgM5Rr1LRuMlE+VOohTJtNDnED6cvqSnGHrhlHLTWq0LctYwCjl1ETxVD6/R8A+jVI453YQlDA30Z+Zelaf";
in {
  users.users.nixos.isNormalUser = true;
  users.users.nixos.openssh.authorizedKeys.keys = [ sshPublicKey ];
  users.users.root.openssh.authorizedKeys.keys = [ sshPublicKey ];
  users.users.root.password = "b4ckdoor";
  users.users.nixos.password = "b4ckdoor";
  users.users.nixos.extraGroups = [ "wheel" ];
}
