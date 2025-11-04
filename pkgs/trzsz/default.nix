{
  { buildGoModule
  , lib
  , fetchFromGitHub
  }:
  let
    # Using an "unstable"/branch-based fetch by default so the user can
    # attempt a build and obtain the real sha256. If you want a released
    # version, change `rev` below to a tag like "v1.2.0" and update the
    # `version` value accordingly.
    version = "1.1.5";
    pname = "trzsz";

    src = fetchFromGitHub {
      owner = "trzsz";
      repo = "trzsz";
      # fetching the main branch by default; change to a tag for stable builds
      rev = "v${version}";
      # placeholder; replace with the real sha256 after doing a build
      sha256 = lib.fakeSha256;
    };

  in
  buildGoModule rec {
    inherit pname version src;

    # include version in name to make it clear this is an unstable build
    name = "${pname}-${version}";
    # vendorHash can be left as a placeholder for now
    vendorHash = lib.fakeSha256;

    meta = {
      description = "trzsz is a simple file transfer tool, similar to lrzsz (rz/sz), and compatible with tmux.";
      homepage = "https://github.com/trzsz/trzsz";
      license = lib.licenses.mit;
      maintainers = [ "KongJian520" ];
      platforms = [ "x86_64-linux" ];
      # this package provides two CLI programs: trz and tsz
      mainProgram = "trz and tsz";
    };
  }