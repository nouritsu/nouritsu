{pkgs ? import <nixpkgs> {}}:
pkgs.mkShell {
  packages = with pkgs.buildPackages; [
    gcc
    ruby_3_4
    rubyPackages_3_4.jekyll
    rubyPackages_3_4.jekyll-feed
    nodejs_24
  ];

  shellHook = ''
    npm install
    bundle install
    alias serve="bundle exec jekyll serve"
  '';
}
