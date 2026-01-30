{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "ubuntu";
  home.homeDirectory = "/home/ubuntu";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    _7zz
    tree-sitter
    nixd
    nixfmt
    tree-sitter
    unzip # Used by Meson.nvim
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/user/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    VISUAL = "nvim";
  };

  home.shellAliases = {
    ls = "ls --color=auto";
    ll = "ls -alF";
    la = "ls -A";
    l = "ls -CF";
    md = "mkdir";
    cls = "clear";
    ".." = "cd ..";
    "..." = "cd ../..";
  };

  programs = {
    bash.enable = true;
    fd.enable = true;
    fzf.enable = true;
    lazygit = {
      enable = true;
      settings = import ./lazygit.nix;
    };
    neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
      defaultEditor = true;
    };
    ripgrep.enable = true;
    starship = {
      enable = true;
      settings = import ./starship.nix;
    };
    tealdeer = {
      enable = true;
      settings.updates.auto_update = true;
    };
    yazi = {
      enable = true;
      package = pkgs.yazi-unwrapped;
    };
    zellij = {
      enable = true;
      attachExistingSession = true;
      enableBashIntegration = true;
      settings = {
        theme = "catppuccin-mocha";
        pane_frames = false;
        show_startup_tips = false;
        show_release_notes = false;
      };
      # Unlock-first keymap generated from zellij
      extraConfig = builtins.readFile ./zellij.kdl;
    };
    zoxide.enable = true;
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
