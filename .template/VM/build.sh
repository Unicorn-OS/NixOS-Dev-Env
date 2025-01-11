build(){
  nix-build '<nixpkgs/nixos>' -A vm -I nixpkgs=channel:nixos-24.05 -I nixos-config=./configuration.nix
}

run(){
  ./result/bin/run-nixos-vm
}
