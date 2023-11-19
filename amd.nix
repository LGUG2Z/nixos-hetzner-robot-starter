{...}: {
  imports = [./hardware-configuration.nix];

  boot.kernelModules = ["kvm-amd"];
}
