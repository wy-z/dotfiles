{stdenv}: let
  bin = "/opt/homebrew/bin";
  npm_pkgs = ''
    tree-sitter-cli
    neovim
    prettier
    typescript
  '';
in
  stdenv.mkDerivation {
    name = "homebrew-npm";
    phases = ["installPhase"];
    installPhase = ''
      mkdir -p $out // empty nix out

      export PATH=$PATH:${bin}
      npm list -g --json \
        | jq '.dependencies | keys | .[]' \
        | xargs -I{} bash -c "echo 'npm ${npm_pkgs}' | grep -w -q {} || npm uninstall -g {}"
      echo '${npm_pkgs}' | xargs -I{} npm install -g {}
    '';
  }
