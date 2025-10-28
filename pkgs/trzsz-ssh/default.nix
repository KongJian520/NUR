# 定义一个 Nix 包函数
# 它接受一个属性集作为参数，Nixpkgs 会在调用时自动提供这些属性，
# 例如 lib, appimageTools, fetchurl。
{
  lib,
  appimageTools,
  fetchurl,
  writeText, # 用于生成 .desktop 文件
}:
let
  # 软件版本号
  version = "0.1.23";
  # 软件包名称
  pname = "yakit";

  src = fetchFromGitHub {
    owner = "trzsz";
    repo = "trzsz-ssh";
    rev = "v${version}";
    sha256 = "";
  };

in
buildGoModule rec {

  inherit pname version src;

  # 完整的包名，包含版本号
  name = "${pname}";


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
