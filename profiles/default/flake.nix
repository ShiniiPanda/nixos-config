{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:NIXOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NIXOS/nixpkgs/nixos-25.05";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    stylix.url = "github:danth/stylix";
    ghostty = {
      url = "github:ghostty-org/ghostty";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland = {
      url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixos-hardware, home-manager, stylix, spicetify-nix
    , ... }@inputs:
    let
      userSettings = {
        profile = "panda";
        theme = "moonman";
        shell = "zsh";
        terminal = "kitty";

        wm = "hyprland";
        launcher = "rofi";
        browser = "brave";
        fileManager = "thunar";
        notification = "mako";
      };
    in {
      nixosConfigurations.default = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs;
          inherit userSettings;
        };
        modules = [
          ./hosts/configuration.nix
          nixos-hardware.nixosModules.asus-rog-strix-g713ie
          home-manager.nixosModules.default
          stylix.nixosModules.stylix
          spicetify-nix.nixosModules.spicetify
        ];
      };
    };
}
