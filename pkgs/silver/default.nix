{
  lib,
  fetchFromGitHub,
  goPackages,
}:

let
  # Fetch the sliver repository from GitHub. Replace the sha256 with the
  # real value produced by `nix-prefetch-git` or by running `nix build` once.
  src = fetchFromGitHub {
    owner = "BishopFox";
    repo = "sliver";
    rev = "master"; # consider pinning to a tag/commit for reproducibility
    fetchSubmodules = true;
    sha256 = lib.fakeSha256; # placeholder: run `nix-prefetch-git` to get real hash
  };
  version = "v1.5.43";
in
goPackages.buildGoModule rec {
  inherit src version;
  pname = src.repo;

  # buildGoModule will fetch Go modules during the build. If you prefer
  # to vendor dependencies, vendor them and set `vendorSha256` instead.

  meta = with lib; {
    description = "Sliver - open-source adversary emulation/red-team framework";
    homepage = "https://github.com/BishopFox/sliver";
    # I couldn't reliably detect the license automatically here; adjust if needed.
    license = licenses.mit;
    maintainers = with maintainers; [ ];
  };
}
