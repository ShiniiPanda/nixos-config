{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    stylix.url = "github:danth/stylix";
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1"; 
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
     home-manager = {
       url = "github:nix-community/home-manager";
       inputs.nixpkgs.follows = "nixpkgs";
     };
  };

  outputs = { self, nixpkgs, nixos-hardware, home-manager, stylix, ... }@inputs: 
  let
    userSettings = {
      profile = "panda";
      theme = "forest";
      shell = "zsh";
      terminal = "kitty";

      wm = "hyprland";
      launcher = "rofi";
      browser = "brave";
      fileManager = "thunar";
      notification = "mako";
    };
  in
   {
    nixosConfigurations.default = nixpkgs.lib.nixosSystem {
      specialArgs = {
        inherit inputs;
        inherit userSettings;
      };
      modules = [
        ./profiles/default/configuration.nix
        nixos-hardware.nixosModules.asus-rog-strix-g713ie
        home-manager.nixosModules.default
        stylix.nixosModules.stylix
      ];
    };
  };
}
