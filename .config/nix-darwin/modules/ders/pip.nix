{stdenv}: let
  bin = "/opt/homebrew/bin";
  pip_mirror = "https://pypi.tuna.tsinghua.edu.cn/simple";
  pip_pkgs = ''
    ruff
    neovim-remote
    pipdeptree
    gdtoolkit
    virtualenvwrapper
  '';
in
  stdenv.mkDerivation {
    name = "homebrew-pip";
    phases = ["installPhase"];
    installPhase = ''
      mkdir -p $out // empty nix out

      export PATH=$PATH:${bin}
      pip install pipdeptree -i ${pip_mirror}
      pipdeptree --json-tree \
        | jq ".[] | .package_name" \
        | xargs -I{} bash -c "echo 'pip wheel ${pip_pkgs}' | grep -w -q {} || pipdeptree -p {} -fj | jq '.[] | .package.key' | xargs pip uninstall -y | true"
      echo '${pip_pkgs}' | xargs -I{} pip install {} -i ${pip_mirror}
    '';
  }
