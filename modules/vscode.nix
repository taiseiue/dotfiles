{
  config,
  pkgs,
  lib,
  ...
}:

let
  mkBoolAttrs =
    patterns:
    lib.listToAttrs (
      map (pattern: {
        name = pattern;
        value = true;
      }) patterns
    );

  Excludes = [
    "**/.git"
    "**/.DS_Store"
    "**/node_modules"
  ];
in
{
  programs.vscode = {
    enable = true;
    mutableExtensionsDir = false;

    profiles.default = {
      enableExtensionUpdateCheck = false;
      enableUpdateCheck = false;
      userSettings = {
        "extensions.autoUpdate" = false;
        "extensions.autoCheckUpdates" = false;
        "editor.formatOnSave" = true;
        "editor.tabSize" = 2;
        "explorer.confirmDelete" = false;
        "explorer.confirmDragAndDrop" = false;
        "explorer.compactFolders" = false;
        "files.exclude" = mkBoolAttrs Excludes;
        "search.exclude" = mkBoolAttrs Excludes;
        "files.watcherExclude" = mkBoolAttrs Excludes;
        "git.autofetch" = false;
        "git.confirmSync" = false;
        "git.enableSmartCommit" = true;
        "workbench.colorTheme" = "Mellow Contrast (rainglow)";
      };

      extensions =
        (with pkgs.vscode-extensions; [
          vscodevim.vim
          ms-vscode-remote.remote-containers
          github.codespaces
          github.copilot-chat
          github.vscode-github-actions
          ms-vsliveshare.vsliveshare
          streetsidesoftware.code-spell-checker
          docker.docker
          ms-azuretools.vscode-docker
          ms-azuretools.vscode-containers
        ])
        ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
          {
            publisher = "ICS";
            name = "japanese-proofreading";
            version = "1.3.0";
            sha256 = "sha256-UEEeK+PbqaEQ+kLh78NLzf8mhRx4HI9oBnn2cRjJmvc=";
          }
          {
            publisher = "daylerees";
            name = "rainglow";
            version = "1.5.2";
            sha256 = "sha256-1c/xQYnuJ3BkwfqjMeT2kG1ZsXyjEOypJs0pJbouZMQ=";
          }
          {
            publisher = "sumomoneko";
            name = "migemo-isearch";
            version = "0.4.0";
            sha256 = "sha256-sdxhQc3vjoMq6gAfFWUZNmNZxNxsRasQvfIGiOf7Qgg=";
          }
        ];
    };
  };
}
