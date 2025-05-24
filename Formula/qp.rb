class Qp < Formula
  desc "qp - Query Packages. A CLI utility for querying installed packages."
  homepage "https://github.com/Zweih/qp"
  version "5.55.0"
  license "GPL-3.0-only"

  sha256_amd64 = "6c4f1e2b5b3a415c6db921ab475fbf69b2fa97b9888a8a14d0da78de6fd8b146"
  sha256_arm64 = "95a4375fbe14843f09d6e899be08ce311346ba82207edbf68c607aa34756da15"

  sha256_linux_x86_64 = "766e01a63bc017fd19f5a6cdd4d35997e991c9869c1b009118e5c4622ed5a5d4"
  sha256_linux_aarch64 = "150f5ff78f4f4a25456b8ad3c82935b85dcc05e18e979e1f22e3c1f721aa8126"

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
