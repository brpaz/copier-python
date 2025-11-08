{
  pkgs,
  lib,
  config,
  inputs,
  ...
}: {
  devcontainer.enable = true;
  dotenv.enable = true;
  languages.python = {
    enable = true;
    package = pkgs.python313;
    uv = {
      enable = true;
      sync = {
        enable = true;
      };
    };
  };

  # https://devenv.sh/packages/
  packages = with pkgs; [
    lefthook
    go-task
    commitlint-rs
    python313Packages.ruff
    python313Packages.black
    python313Packages.pytest
    python313Packages.mkdocs
    python313Packages.mkdocs-material
    python313Packages.mkdocs-mermaid2-plugin
  ];

  enterShell = ''
    lefthook install
    python --version
  '';

  # https://devenv.sh/tasks/
  # tasks = {
  #   "myproj:setup".exec = "mytool build";
  #   "devenv:enterShell".after = [ "myproj:setup" ];
  # };

  # https://devenv.sh/tests/
  enterTest = ''
    task test
  '';

  # https://devenv.sh/git-hooks/
  # git-hooks.hooks.shellcheck.enable = true;

  # See full reference at https://devenv.sh/reference/options/
}
