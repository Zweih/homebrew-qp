class Qp < Formula
  desc "qp - Query Packages. A CLI utility for querying installed packages."
  homepage "https://github.com/Zweih/qp"
  version "5.79.2"
  license "GPL-3.0-only"

  depends_on "sqlite", optional: true

  sha256_amd64 = "8b855b0731dce7893818e0450f90e7bbfd2959dca899fdfff18645e2911957c9"
  sha256_arm64 = "a1c8e4fe22e5fc0038b13c23c9c7e2fb502552f235e810864706865219e511aa"

  sha256_linux_x86_64 = "2add1c31ec11570b0169b797bb2ec553129805f80cb0a7e98b399f6d987cfa41"
  sha256_linux_aarch64 = "4a848cd760405c51f353af34d6d774b734cba73be2bc1ffb59bf0c7773e38c33"

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
