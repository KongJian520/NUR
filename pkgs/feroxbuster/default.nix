{
  lib,
  fetchFromGitHub,
  openssl,
  pkg-config,
  rustPlatform,
  pkgs,
# Security,
}:

rustPlatform.buildRustPackage rec {
  pname = "feroxbuster";
  version = "2.10.3";

  src = fetchFromGitHub {
    "owner" = "epi052";
    "repo" = pname;
    "rev" = "64113b8da434f51077867302968764fd641e9ffc";
    "hash" = "sha256-/NgGlXYMxGxpX93SJ6gWgZW21cSSZsgo/WMvRuLw+Bw=";
  };

  useFetchCargoVendor = true;
  cargoHash = "sha256-WpFx7Yq4Ll5AxCPs7sBJnqHqDi2to72l+L5acdvUXZc=";

  OPENSSL_NO_VENDOR = true;

  nativeBuildInputs = [
    pkg-config
  ];

  buildInputs = [
    openssl
    pkgs.seclists
  ];

  # Tests require network access
  doCheck = false;

  meta = with lib; {
    description = "Fast, simple, recursive content discovery tool";
    homepage = "https://github.com/epi052/feroxbuster";
    changelog = "https://github.com/epi052/feroxbuster/releases/tag/v${version}";
    license = with licenses; [ mit ];
    maintainers = with maintainers; [ fab ];
    platforms = platforms.unix;
    mainProgram = "feroxbuster";
  };
}
