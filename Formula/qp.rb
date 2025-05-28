class Qp < Formula
  desc "qp - Query Packages. A CLI utility for querying installed packages."
  homepage "https://github.com/Zweih/qp"
  version "5.65.3"
  license "GPL-3.0-only"

  sha256_amd64 = "607439d266c302c7b5700029fa977a399f37f4cdf2be0c573e610387664bde6b"
  sha256_arm64 = "49b9bb681d19e3f541b4191fddc2c7d54acc4a824787185b6d093180ac0e96a7"

  sha256_linux_x86_64 = "aa7ef9958eb79c1af7223494b88d08cf6e626c51af0b5a45271b900b3f488204"
  sha256_linux_aarch64 = "789c4dee851cd8120e33a799efab4fa007f4cf0f45a2cf0af17396363ef436b6"

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
