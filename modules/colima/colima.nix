{
  config,
  pkgs,
  lib,
  ...
}:
{
  home.packages = with pkgs; [
    colima
  ];
  home.activation.colimaConfig = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    mkdir -p ~/.colima/default ~/.colima/heavy
    cp -f ${./profiles/default.yaml} ~/.colima/default/colima.yaml
    cp -f ${./profiles/heavy.yaml} ~/.colima/heavy/colima.yaml
  '';
}
