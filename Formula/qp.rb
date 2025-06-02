class Qp < Formula
  desc "qp - Query Packages. A CLI utility for querying installed packages."
  homepage "https://github.com/Zweih/qp"
  version "5.71.2"
  license "GPL-3.0-only"

  sha256_amd64 = "d761fed0ad64c169ca524f647ca9d5df0a38e2b5e37be2d779f690c94f6c43a9"
  sha256_arm64 = "5ccbca15324d62fc5307f594730a194ec1e84dc2037701e75c36c7eea2130e37"

  sha256_linux_x86_64 = "3fa9f307eb7f5b57cd92f6bc20c58ff94fde585b4f2ae3c8daf42c359ef51b2c"
  sha256_linux_aarch64 = "c3f795c7116c90d4e4f74ae33faccd77b7f9447ad74f324e7e6c9a8ec72eb757"

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
