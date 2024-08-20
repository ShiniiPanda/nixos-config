{ ... }:
{

  programs.thunderbird = {
    enable = true;
    profiles = {
      shinii = {
        name = "shinii";
        isDefault = true;
      };
    };
  };

}
