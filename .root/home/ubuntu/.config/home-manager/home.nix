{ pkgs, ... }:
{
  home = {
    username = "ubuntu";
    homeDirectory = "/home/ubuntu";
    stateVersion = "25.11";
    shell.enableFishIntegration = true;
    packages = with pkgs; [
      tree
      dust
    ];
  };

  programs = {
    home-manager.enable = true;
    bat.enable = true;
    fd.enable = true;
    ripgrep.enable = true;
    git.enable = true;
    fastfetch.enable = true;
    bash = {
      enable = true;
      bashrcExtra = builtins.readFile ./bashrcExtra.sh;
      initExtra = builtins.readFile ./initExtra.sh;
    };
    neovim = {
      enable = true;
      defaultEditor = true;
    };
    eza = {
      enable = true;
      icons = "auto";
    };
    fish = {
      enable = true;
      shellInit = builtins.readFile ./shellInit.fish;
    };
    yazi = {
      enable = true;
      enableFishIntegration = true;
    };
    fzf = {
      enable = true;
      enableFishIntegration = true;
    };
    starship = {
      enable = true;
      enableFishIntegration = true;
    };
    zoxide = {
      enable = true;
      enableFishIntegration = true;
    };
  };
}
