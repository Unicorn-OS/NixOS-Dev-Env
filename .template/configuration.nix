{ config, pkgs, ... }:

{

  # For VSCode
  nixpkgs.config.allowUnfree = true;

  boot.loader.systemd-boot.enable = true;

  boot.loader.efi.canTouchEfiVariables = true;


  # Enable the X11 windowing system.

  services.xserver.enable = true;


  # Enable the GNOME Desktop Environment.

  services.xserver.displayManager.gdm.enable = true;

  services.xserver.desktopManager.gnome.enable = true;


  imports = [ <nixpkgs/nixos/modules/virtualisation/qemu-vm.nix> ];

#  virtualisation.qemu.options = [
#    "-device virtio-vga"
#  ];

  virtualisation.vmVariant = {
    # following configuration is added only when building VM with build-vm
    virtualisation.cores = 4;
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "workman";
  };

  users.users.alice = {

    isNormalUser = true;

    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.

    initialPassword = "test";

  };


  environment.systemPackages = with pkgs; [
# Alchemy
    transmission_4
    transmission_4-gtk

# Browser
    brave
    chromium

# Dev
    cowsay
    lolcat
    android-studio
    git
    htop
    jetbrains.clion
    jetbrains.idea-community
#    jetbrains.jdk
    jetbrains.phpstorm
    jetbrains.pycharm-community
    jetbrains.rust-rover
    jetbrains.webstorm
    python3Full
    vscode   
    vscode-extensions.redhat.ansible

# Lang
    rustc
    rustfmt
#    rustup

# Env
    variety

# Spice Circuit Simulator:
#https://search.nixos.org/packages?channel=24.11&from=0&size=50&sort=relevance&type=packages&query=spice
#    ngspice
#    gnucap-full
#    xyce-parallel #|| xyce
#    xschem
  ];

  system.stateVersion = "24.05";
}
