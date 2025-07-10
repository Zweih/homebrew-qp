class Qp < Formula
  desc "qp - Query Packages. A CLI utility for querying installed packages."
  homepage "https://github.com/Zweih/qp"
  version "5.102.1"
  license "GPL-3.0-only"

  depends_on "sqlite" => :optional

  sha256_amd64 = "4ff5cf2b4a4d9e97cab98cb25a91ecda3da2388e4a88a99323900888ac735f75"
  sha256_arm64 = "f7a5eb3fb6fa16f9dd84a38803d001b3b335969f375ef6fe4abed87e9b5d8cdc"

  sha256_linux_x86_64 = "be9d0ed433a38fea78a91983cb7a0a630778058fac9a19e0e70c0ddeb1cb8a9a"
  sha256_linux_aarch64 = "033ed3bc89d76fd9d56b786cd12bec1e6e83a32a8a42af2d3975f6360cd7bf6f"

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
