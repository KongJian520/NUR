{
  buildGoModule,
  lib,
  fetchFromGitHub,
}:
let
  # 软件版本号
  version = "0.1.23";
  # 软件包名称
  pname = "trzsz-ssh";

  src = fetchFromGitHub {
    owner = "trzsz";
    repo = "trzsz-ssh";
    rev = "v${version}";
    sha256 = "sha256-Cp5XI7ggpt48llojcmarYPi9mTM+YBqwjG/eNAnKTxc=";
  };

in
buildGoModule rec {

  inherit pname version src;

  # 完整的包名，包含版本号
  name = "${pname}";
  vendorHash = "sha256-pI9BlttS9a1XrgBBmUd+h529fLbsbwSMwjKn4P50liE=";
  # 软件包的元数据
  meta = {
    description = "trzsz-ssh ( tssh ) is an ssh client designed as a drop-in replacement for the openssh client. It aims to provide complete compatibility with openssh, mirroring all its features, while also offering additional useful features not found in the openssh client.";
    homepage = "https://trzsz.github.io/ssh/";
    # 许可证信息。这里暂定为 AGPLv3。
    license = lib.licenses.mit;
    maintainers = [ "KongJian520" ];
    # 支持的平台，此处仅支持 64 位 Linux
    platforms = [ "x86_64-linux" ];
    # 最终安装到环境中的主程序名称
    mainProgram = "tssh";
  };
}
