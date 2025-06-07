class Qp < Formula
  desc "qp - Query Packages. A CLI utility for querying installed packages."
  homepage "https://github.com/Zweih/qp"
  version "5.80.0"
  license "GPL-3.0-only"

  depends_on "sqlite", optional: true

  sha256_amd64 = "5353710dacef26988b3ee146473aecfa0ebd089f42a20d734f8b3a6be50c4eba"
  sha256_arm64 = "d5c262d9324b2649771bd02662ec500b3325042bd57d6dddff5f525593cf0293"

  sha256_linux_x86_64 = "9badf44c3c701399f701c95747055aff7040ea574fb36e6378b7e0c051435c90"
  sha256_linux_aarch64 = "c77fc0979ba97f79129c073e6d691183104de6032b164535e3ba5001bbb6a8b7"

  on_macos do
    if Hardware::CPU.intel?
      url "#{homepage}/releases/download/v#{version}/qp-v#{version}-brew-darwin_amd64.tar.gz"
      sha256 sha256_amd64
    elsif Hardware::CPU.arm?
      url "#{homepage}/releases/download/v#{version}/qp-v#{version}-brew-darwin_arm64.tar.gz"
      sha256 sha256_arm64
    end
  end

   on_linux do
    if Hardware::CPU.intel?
      url "#{homepage}/releases/download/v#{version}/qp-v#{version}-brew-x86_64.tar.gz"
      sha256 sha256_linux_x86_64
    elsif Hardware::CPU.arm?
      url "#{homepage}/releases/download/v#{version}/qp-v#{version}-brew-aarch64.tar.gz"
      sha256 sha256_linux_aarch64
    end
  end

  def install
    bin.install "qp"
    man1.install "qp.1"
    doc.install "NEWS"
  end

  test do
    assert_match "qp", shell_output("#{bin}/qp --help")
  end
end
