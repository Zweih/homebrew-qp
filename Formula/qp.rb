class Qp < Formula
  desc "qp - Query Packages. A CLI utility for querying installed packages."
  homepage "https://github.com/Zweih/qp"
  version "5.64.0"
  license "GPL-3.0-only"

  sha256_amd64 = "0ee3d70421c2f01b1f3bce3a0d77dafd50a1713a5d5fd7246837540576d2bdad"
  sha256_arm64 = "c76ab04a2dd9e3c367e2065fab3a1c30c02f0707d22c073123f28ef3661e7e05"

  sha256_linux_x86_64 = "411dae29628de5f112e9bc2841cfcbd5d1c5501bd53596d0db94e806db94a725"
  sha256_linux_aarch64 = "fe30b532c96e55567e7cf9a622d909583a5b27c82ae21ec62359ec72e4922380"

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
