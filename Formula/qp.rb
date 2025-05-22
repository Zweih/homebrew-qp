class Qp < Formula
  desc "qp - Query Packages. A CLI utility for querying installed packages."
  homepage "https://github.com/Zweih/qp"
  version "5.50.0"
  license "GPL-3.0-only"

  sha256_amd64 = "7da770eac0def945fba639339a0285a745e44c96e8783863c8a6bc5c9e2c6918"
  sha256_arm64 = "d379e3a185ef9b64566d6d532e62aec12974531c75d827d9b2a518422a68ee01"

  sha256_linux_x86_64 = "45b29f76e136681aa03add7b4211d83ed4e01d83c726e50123d6fd258f76060f"
  sha256_linux_aarch64 = "54208ce8a3b1e44a6d3bcb01a0697e39cedd8fa4f01f03e0888941c8fe0ac9af"

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
