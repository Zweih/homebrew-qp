class Qp < Formula
  desc "qp - Query Packages. A CLI utility for querying installed packages."
  homepage "https://github.com/Zweih/qp"
  version "5.47.1"
  license "GPL-3.0-only"
  sha256_amd64 = "60248429cd57c6cde47b94318418b9861a198da8c2652515fba156a03cebed44"
  sha256_arm64 = "572061992cdc58a3e37c8e4f6ab0fff8fe0f69bd39caa2e6cdb9b741b25f8a03"

  on_macos do
    if Hardware::CPU.intel?
      url "#{homepage}/releases/download/v#{version}/qp-v#{version}-darwin_amd64.tar.gz"
      sha256 sha256_amd64
    elsif Hardware::CPU.arm?
      url "#{homepage}/releases/download/v#{version}/qp-v#{version}-darwin_arm64.tar.gz"
      sha256 sha256_arm64
    end
  end

  def install
    bin.install "qp"
    man1.install "qp.1"
  end

  test do
    assert_match "qp", shell_output("#{bin}/qp --help")
  end
end
