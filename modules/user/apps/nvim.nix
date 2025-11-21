{ config, lib, pkgs, ... }:
let 
	configDirectory = pkgs.fetchFromGitHub {
		owner = "ShiniiPanda";
		repo = "AstroNvim-template";
		rev = "main";
		sha256 = "sha256-oWTi3ht8HTtCB0LYWQ8Tu83sKAa0LWxoTLx7H/1E+ds";
	};
in
{
	programs.neovim = {
		enable = true;
		plugins = with pkgs.vimPlugins; [
			astroui
			astrolsp
			astrocore
			astrotheme
		];
	};

	home.file.".config/nvim".source = configDirectory;
}
