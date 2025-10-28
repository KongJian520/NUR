# default.nix
{ lib, buildMavenPackage, fetchFromGitHub, jdk }:

buildMavenPackage rec {
  pname = "Behinder";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "rebeyond";
    repo = "Behinder";
    rev = "2e2817ae70462a02281c8d96d4cd44c19e5c55b0";
    sha256 = "0000000000000000000000000000000000000000000000000000";
  };

  # 确保构建使用正确的 JDK
  buildInputs = [ jdk ];

  # 你的项目的 JAR 文件名 (在 target/ 目录下)
  jar = "target/your-maven-app-${version}.jar";

  # buildMavenPackage 会自动创建一个启动脚本，通常以 ${pname} 命名，
  # 该脚本使用找到的 JAR 文件运行 `java -jar ...`

  meta = with lib; {
    description = "A Java application built with Maven";
    homepage = "http://example.com";
    license = licenses.mit;
    platforms = platforms.all;
  };
}