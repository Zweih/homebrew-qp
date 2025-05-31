class Qp < Formula
  desc "qp - Query Packages. A CLI utility for querying installed packages."
  homepage "https://github.com/Zweih/qp"
  version "5.69.0"
  license "GPL-3.0-only"

  sha256_amd64 = "b8175249311295bc2446d13e12d2bd14b012034afd07aa81d26f05154a106b07"
  sha256_arm64 = "6e833c8b0acfeca88e387b88e83eb9b497e6800126823ec4c8c5cbc85bcda5c6"

  sha256_linux_x86_64 = "4df7fe1a79c69f57cf74694ef5c0e2ac1590cde6d764088afc480f35963f8b8c"
  sha256_linux_aarch64 = "6edccbe93f68d787def425d88eeeee56dda772c8b96b67c00eeeea5c3d6c6915"

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
