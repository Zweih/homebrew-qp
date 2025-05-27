class Qp < Formula
  desc "qp - Query Packages. A CLI utility for querying installed packages."
  homepage "https://github.com/Zweih/qp"
  version "5.62.0"
  license "GPL-3.0-only"

  sha256_amd64 = "17cfc8e2f28a7e4e4d1a3317554c33e1887b3d855fc6a4fb26c4aa70759735df"
  sha256_arm64 = "7bbeeb1af4f641178962c36699fe5f56c417b026cf51352fae181179942181c4"

  sha256_linux_x86_64 = "c214fda3667c668baa87167ea824893889c7e59dc9891526d4cc11e09d46207e"
  sha256_linux_aarch64 = "d42feee72958319cef61e673abf6896e1a9c6068cd44ed533fe0a451d4639b44"

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
