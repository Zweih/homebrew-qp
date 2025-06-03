class Qp < Formula
  desc "qp - Query Packages. A CLI utility for querying installed packages."
  homepage "https://github.com/Zweih/qp"
  version "5.72.0"
  license "GPL-3.0-only"

  sha256_amd64 = "d9ea0de78ee3d75f0b04010d8244ff28821fac023eb726e0b0910a619ce3adf0"
  sha256_arm64 = "c2b57ab09bb1599a1b98c6f8eddf8f981ec5d7079dea9b6f018aa6db272e5759"

  sha256_linux_x86_64 = "e276ceb61c1c9c18a981b887abe3c8f934085774cbbb7e73bd6710ce2d4f2bc4"
  sha256_linux_aarch64 = "88bba19e95b5e4fc7319060ae6cda5a6ec480eccbe06b62bb5e2d2df259cec4e"

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
