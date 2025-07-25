{pkgs ? import <nixpkgs> {}}:
pkgs.mkShell {
  packages = with pkgs.buildPackages; [
    gcc
    ruby_3_4
    rubyPackages_3_4.jekyll
    rubyPackages_3_4.jekyll-feed
    nodejs_24

    mprocs
  ];

  shellHook = ''
    npm install
    bundle install
    mprocs
  '';
}
