{ pkgs, inputs, ... }: {
  programs.virt-manager.enable = true;

  users.groups.libvirtd.members = [ "panda" ];

  virtualisation = {
    libvirtd.enable = true;
    spiceUSBRedirection.enable = true;
  };

  environment.systemPackages = with pkgs; [ virt-viewer dnsmasq ];
}
