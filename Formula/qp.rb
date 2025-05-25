class Qp < Formula
  desc "qp - Query Packages. A CLI utility for querying installed packages."
  homepage "https://github.com/Zweih/qp"
  version "5.57.0"
  license "GPL-3.0-only"

  sha256_amd64 = "d841a5fdfb8dd9378c95e074225a097b8f59ed5eaa06ae981110e387de4a24fd"
  sha256_arm64 = "f958389f57be942d5535a7c3836ab86481a3dafad011c7ff486d89d84c1466b6"

  sha256_linux_x86_64 = "c934e5911b0b058dcd1ffedc904366a45121fe4de9e3a4556e34f75e2ea3808c"
  sha256_linux_aarch64 = "d00d54c1da59cd06e6438ec36faffc318c070fbaae096986fa3326d5285857a5"

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
