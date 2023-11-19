{
  imports = [
    ./disk-config.nix
  ];

  boot.loader.grub.enable = true;

  services.openssh = {
    enable = true;
    settings.PasswordAuthentication = false;
    extraConfig = ''
      PrintLastLog no
    '';
  };

  users.users.root.openssh.authorizedKeys.keys = [
    # FIXME: Set your own public key here!
    "ssh-rsa ..."
  ];
}
