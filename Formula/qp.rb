class Qp < Formula
  desc "qp - Query Packages. A CLI utility for querying installed packages."
  homepage "https://github.com/Zweih/qp"
  version "5.103.3"
  license "GPL-3.0-only"

  depends_on "sqlite" => :optional

  sha256_amd64 = "b197841ead936f6c8d6bbcfec7daf10ee434071cc58a2d967e923e020c1214a2"
  sha256_arm64 = "6428c12b96d1de9376be2977eb290853379bd7185ef758aa2a3de257e28a66e1"

  sha256_linux_x86_64 = "e63fbb965e04bd5758bf6638685369cfc7ccbdf0facea56c4b12d8d6042b5e6f"
  sha256_linux_aarch64 = "af400ae0ffb87a15a1876106a91f8b01ddf28919aa6869449d01dc1a96096957"

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
