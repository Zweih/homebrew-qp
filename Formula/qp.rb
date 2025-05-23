class Qp < Formula
  desc "qp - Query Packages. A CLI utility for querying installed packages."
  homepage "https://github.com/Zweih/qp"
  version "5.53.2"
  license "GPL-3.0-only"

  sha256_amd64 = "a8ae30930ae55a58e7a400dbb7aa03c3a00ecc0001b5c6fddff798b1827daefd"
  sha256_arm64 = "a80175c84ff9ec578d7cc44ecd2ed60ede8b770f6ced3f7f1177950ae727df68"

  sha256_linux_x86_64 = "46f840e55e114a72f5021c53adf0de0b58b60423b6b006e201943f04b401fefd"
  sha256_linux_aarch64 = "da90de2dc92ca14cdda6e77d2932342a0992e73721d13f68028a1bddbc1a2024"

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
