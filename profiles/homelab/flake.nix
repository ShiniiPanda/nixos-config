{
  description = "Nixos homelab config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:nixos/nixos-hardware/master";
    stylix = {
      url = "github:danth/stylix/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    ghostty = {
      url = "github:ghostty-org/ghostty";
      #inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland = {
      url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
      #inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixos-hardware, home-manager, stylix, nixpkgs-unstable, ... }@inputs:
    let
      userSettings = {
        profile = "shinii";
        theme = "moonman";
        shell = "zsh";
        terminal = "kitty";

        wm = "hyprland";
        launcher = "rofi";
        browser = "brave";
        fileManager = "thunar";
        notification = "mako";
      };

      pkgs-unstable = import nixpkgs-unstable {
        system = "x86_64-linux";
      };
    in {
      nixosConfigurations.default = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs;
          inherit userSettings;
          inherit pkgs-unstable;
        };
        modules = [
          ./hosts/configuration.nix
          # nixos-hardware.nixosModules.asus-rog-strix-g713ie
          home-manager.nixosModules.home-manager
          stylix.nixosModules.stylix
        ];
      };
    };
}
