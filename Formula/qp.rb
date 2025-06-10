class Qp < Formula
  desc "qp - Query Packages. A CLI utility for querying installed packages."
  homepage "https://github.com/Zweih/qp"
  version "5.84.1"
  license "GPL-3.0-only"

  depends_on "sqlite", optional: true

  sha256_amd64 = "ea6e0b7a410e4e17f54f8ade9547df63e71708639e3131f92c7e848c66c8a74b"
  sha256_arm64 = "4345b6569cc4c37c4bc3ab344962496327d5189e9a6d8acdd86b1c6d04d37a17"

  sha256_linux_x86_64 = "a1527422513b1fa8318d312357375c88aafc20c00a26ade44b2a47b1654ea8c0"
  sha256_linux_aarch64 = "1db32bc526da60f32c42a213600b16f1cadfda7e916c1a5a6ebd15717f9f0c24"

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
