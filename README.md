# dotfiles
taiseiue's dotfiles

## Installation

### 1. Install Nix
And enable Nix flakes.

```sh
$ sh <(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install)
$ mkdir -p ~/.config/nix
$ echo "experimental-features = nix-command flakes" > ~/.config/nix/nix.conf
```

### 2. Install home-manager

```sh
$ nix run home-manager/master -- init --switch
```

### 3. Switch at first time
In this directory.

```sh
$ home-manager switch --flake .#taiseiue@lily
```

### Opt. Configure without git
This is used for temporary hosts or hosts that should not be managed by git.

```sh
$ cp hosts/local.example.nix hosts/local.nix
$ $EDITOR hosts/local.nix
$ home-manager switch --flake .#taiseiue@local
```

## Usage
### Switch
```
task switch:host
```
