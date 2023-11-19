{
  lib,
  modulesPath,
  ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot.initrd.availableKernelModules = ["xhci_pci" "ahci" "sd_mod" "nvme"];
  boot.initrd.kernelModules = [];
  boot.extraModulePackages = [];

  networking.useNetworkd = true;
  networking.useDHCP = false;
  networking.usePredictableInterfaceNames = false;

  systemd.network.networks."10-uplink" = {
    matchConfig.Name = lib.mkDefault "en* eth0";
    networkConfig.DHCP = "ipv4";
    networkConfig.Gateway = "fe80::1";
    networkConfig.IPv6AcceptRA = "no";
  };

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
