{ config, pkgs, ... }:

{
  programs.nodejs_24 = {
    enable = true;
    nodePackages = with pkgs.nodePackages; [
      typescript
      ts-node
      tsx
      eslint
      prettier
      wrangler
    ];
  };
}
