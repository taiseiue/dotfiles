{ config, pkgs, ... }:

{
  programs.fish = {
    enable = true;

    shellAbbrs = {
      "cd.." = "cd ..";
      vi = "nvim";
      ll = "ls -alF";
      grep = "grep --color=auto";
      g = "ghq";
    };

    functions = {
      mkcd = "mkdir -p $argv[1]; and cd $argv[1]";
      
      ghq = ''
        if test "$argv[1]" = "checkout"
            set -l branch (git branch | sed 's/^[ \*]*//' | fzf --query "$argv[2]" --prompt "branch> ")
            if test -n "$branch"
                git checkout "$branch"
            end
        else if contains -- "$argv[1]" clone list rm root create get
            command ghq $argv
        else
            set -l query "$argv[1]"
            set -l candidates (command ghq list | grep -i -- "$query")
            set -l count (count $candidates)

            if test $count -eq 1
                cd (command ghq root)/$candidates
            else if test $count -gt 1
                set -l selected (printf "%s\n" $candidates | fzf --query "$query" --prompt "repo> ")
                if test -n "$selected"
                    cd (command ghq root)/$selected
                end
            else
                echo "No matching repository found."
            end
        end
      '';

      usenode = ''
        set -l version $argv[1]
        if test -z "$version"
            if test -f .nvmrc
                set version (string trim (cat .nvmrc))
            else if test -f .node-version
                set version (string trim (cat .node-version))
            else
                echo "No version specified and no node-version file found."
                return 1
            end
        end

        set -l major (echo $version | cut -d. -f1)
        echo "Switching to Node.js version $version"
        nix shell "nixpkgs#nodejs_$major" --command "$SHELL"
      '';

      # キーバインド
      fish_user_key_bindings = ''
        bind \cg 'ghq; commandline -f repaint'
      '';
    };

    plugins = [
      {
        name = "fzf-fish";
        src = pkgs.fishPlugins.fzf-fish.src;
      }
      {
        name = "autopair";
        src = pkgs.fishPlugins.autopair.src;
      }
      {
        name = "sponge";
        src = pkgs.fishPlugins.sponge.src;
      }
    ];

    shellInit = ''
      if test -f /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.fish
          source /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.fish
      end
    '';

    interactiveShellInit = ''
      if test -f "$HOME/.local.fish"
          source "$HOME/.local.fish"
      end
    '';
  };

  programs.fzf = {
    enable = true;
    enableFishIntegration = true;
  };
}
