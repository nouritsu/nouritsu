{pkgs ? import <nixpkgs> {}}:
pkgs.mkShell {
  packages = with pkgs.buildPackages; [
    nodejs_24
  ];

  shellHook = ''
    npm install
  '';
}
