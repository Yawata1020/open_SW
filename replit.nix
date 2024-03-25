{ pkgs }: {
  deps = [
    pkgs.nvi
    pkgs.vim
    pkgs.open-watcom-v2
    pkgs.echo less
    pkgs.tree
    pkgs.bashInteractive
    pkgs.nodePackages.bash-language-server
    pkgs.man
  ];
}