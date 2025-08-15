class Qp < Formula
  desc "qp - Query Packages. A CLI utility for querying installed packages."
  homepage "https://github.com/Zweih/qp"
  version "5.106.0"
  license "GPL-3.0-only"

  depends_on "sqlite" => :optional

  sha256_amd64 = "e454188d7bbad4e424be28841010c7801fae08b6605e7da4b931fe82b93f7eab"
  sha256_arm64 = "4dcdb20696a6e68cc57142f2d1039076c6e03809a9d111acc8a23bbf509badb2"

  sha256_linux_x86_64 = "177c0d5bf8b853309aebbd304fd3ffd22f9dc1e6652f731c7a0009c72f8ac89d"
  sha256_linux_aarch64 = "69841c969869f7d650bfe37bd85961ea53fc1ac1a174cfec2492a857dc6101f9"

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
