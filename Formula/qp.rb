class Qp < Formula
  desc "qp - Query Packages. A CLI utility for querying installed packages."
  homepage "https://github.com/Zweih/qp"
  version "5.94.2"
  license "GPL-3.0-only"

  depends_on "sqlite" => :optional

  sha256_amd64 = "6416fa720ff2bc8da9738d28624d4906e64c936edcb5c2cdcecffa0b366ea49e"
  sha256_arm64 = "42c39e50b11827246e4dbe4d99cc9e1b4504253f516dc178c30e142e85b9bfb8"

  sha256_linux_x86_64 = "e22f0c0d93926fee6f67fbe48c44e6557f74ff6c5d5b1ea2fe2a841b6ded70ef"
  sha256_linux_aarch64 = "8311f9c798115f17a1fe570da7c69cf0d7de6a5874aed4ab7a66a42d57206acf"

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
