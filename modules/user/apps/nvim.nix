{ config, lib, pkgs, ... }:
let 
	configDirectory = pkgs.fetchFromGitHub {
		owner = "ShiniiPanda";
		repo = "AstroNvim-template";
		rev = "main";
		sha256 = "sha256-Fu0nUmwl5140RcB6DTAHdLi0W0Z9n/93cM9NRG7IgOM=";
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
