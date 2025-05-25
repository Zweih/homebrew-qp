class Qp < Formula
  desc "qp - Query Packages. A CLI utility for querying installed packages."
  homepage "https://github.com/Zweih/qp"
  version "5.56.0"
  license "GPL-3.0-only"

  sha256_amd64 = "4f2133d7f925d47af7fd76b17bf5ad0ee7e97f48668b08947201bd93918aa6e3"
  sha256_arm64 = "fe836b3226643e6d0befa40ecfd268aba7d89704e866fd8862c8e7d76edc4c53"

  sha256_linux_x86_64 = "8126dc9a6830ac94554e7c99d9cb3696f60bf9450238195739fb55b2aff7eb5d"
  sha256_linux_aarch64 = "bfca2ddb0c62587b0e946e963f73732d6af842c89ad4edfaf688b7a8b477fd76"

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
