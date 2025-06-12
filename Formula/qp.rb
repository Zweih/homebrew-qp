class Qp < Formula
  desc "qp - Query Packages. A CLI utility for querying installed packages."
  homepage "https://github.com/Zweih/qp"
  version "5.86.6"
  license "GPL-3.0-only"

  depends_on "sqlite" => :optional

  sha256_amd64 = "fb60d445d6b4ab4f411b607d9af88c02aa8ae948369ec08b4d9c18260aed5cab"
  sha256_arm64 = "8caf7b82c97ee1f9c570c0eb52b4c2cd898cae400d462c025e0c6ea9b1c13f37"

  sha256_linux_x86_64 = "3dee95da9fc58d482154d53bb8fe808fbd7cca6595b02c88d2a7cc4acafffc0f"
  sha256_linux_aarch64 = "c42059b034e4b582fbfc5b76bf34e5e7d30135b6752c7f771558628f622f6914"

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
