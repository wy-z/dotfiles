{pkgs, ...}: {
  # Install packages from nix's official package repository.
  environment.systemPackages = with pkgs; [
    git
    alejandra
  ];

  # The apps installed by homebrew are not managed by nix, and not reproducible!
  # But on macOS, homebrew has a much larger selection of apps than nixpkgs, especially for GUI apps!
  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = true;
      # 'zap': uninstalls all formulae(and related files) not listed here.
      cleanup = "zap";
    };

    taps = [
      "homebrew/bundle"
      "homebrew/cask-fonts"
      "homebrew/cask-versions"
      "homebrew/services"
    ];

    # `brew install`
    brews = [
      "ansible"
      "aspell"
      "atuin"
      "autocorrect"
      "automake"
      "bat"
      "binaryen"
      "clang-format"
      "cloc"
      "cmake"
      "coreutils"
      "direnv"
      "elixir"
      "fd"
      "fmt"
      "fzf"
      "gh"
      "git"
      "git-delta"
      "git-lfs"
      "gnu-getopt"
      "gnu-sed"
      "go"
      "gost"
      "helm"
      "htop"
      "ipfs"
      "jq"
      "just"
      "k3sup"
      "k9s"
      "kubernetes-cli"
      "libimobiledevice"
      "luarocks"
      "mackup"
      "make"
      "mdbook"
      "miniserve"
      "node"
      "nomad"
      "pandoc"
      "pgweb"
      "postgresql@14"
      "protobuf"
      "python@3.11"
      "redis"
      "ripgrep"
      "rsync"
      "rust"
      "rustup-init"
      "shellcheck"
      "shfmt"
      "sops"
      "ssh-copy-id"
      "starship"
      "stylua"
      "subversion"
      "telnet"
      "tldr"
      "tree"
      "upx"
      "vault"
      "vips"
      "watchexec"
      "wget"
      "yarn"
      "zoxide"
      "zplug"
    ];

    # `brew install --cask`
    casks = [
      "font-hack-nerd-font"
      "godot"
      "iterm2"
      "neovide"
      "orbstack"
      "visual-studio-code"
      "chromedriver"
      "microsoft-remote-desktop"
      "discord"
    ];
  };
}
