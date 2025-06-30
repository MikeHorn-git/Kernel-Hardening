{ pkgs, ... }:
{
  projectRootFile = "flake.nix";
  programs.mdformat.enable = true;
  programs.nixfmt.enable = true;
  programs.shellcheck.enable = true;
  programs.shfmt.enable = true;
}
