class Qp < Formula
  desc "qp - Query Packages. A CLI utility for querying installed packages."
  homepage "https://github.com/Zweih/qp"
  version "5.70.1"
  license "GPL-3.0-only"

  sha256_amd64 = "047ce21b0c4d995c02a0c41661eb5dfd604b4f1975264cc1b35e4a0a90267b1d"
  sha256_arm64 = "9352ef69a35011becb2c71767caa255f305368b316110a1d5afadd2ec7c984f2"

  sha256_linux_x86_64 = "d9de49a3edb4fcc782f8c08c9d9c1d870447a8dbc2bc013cec7783ed2c948734"
  sha256_linux_aarch64 = "b11f4e030a7e8fccaa7e46a7ef51fb79c6dedcf119cdc9e758230a02e31fe672"

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
