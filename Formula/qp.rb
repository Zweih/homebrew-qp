class Qp < Formula
  desc "qp - Query Packages. A CLI utility for querying installed packages."
  homepage "https://github.com/Zweih/qp"
  version "5.66.0"
  license "GPL-3.0-only"

  sha256_amd64 = "2d4a4248e90e0cbd10c9b0a70b7548367138e88ab73ebe3caec8db0d6957752a"
  sha256_arm64 = "15a9fb1c884e464a63b1aedbea4e1cdf91f21b9ae3819ac95dbc04a8a2faa95a"

  sha256_linux_x86_64 = "36c7de46edf87a15f660e77532e0893ab99cabca77096e00b7c98c2e1924a317"
  sha256_linux_aarch64 = "379d7ae499df7530dbbb78b500bdd8c852c72048d0dd45b8e2cb6dc743ec2c11"

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
