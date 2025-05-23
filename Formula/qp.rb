class Qp < Formula
  desc "qp - Query Packages. A CLI utility for querying installed packages."
  homepage "https://github.com/Zweih/qp"
  version "5.52.0"
  license "GPL-3.0-only"

  sha256_amd64 = "dc08db92548acd520c927f49ec5ac8362fcee18d422d952cfebf1d2fcb2cd484"
  sha256_arm64 = "f694db8c466fc6fe9f37a7d4e9b1715c672d11271444652f4c8e737dfacbd0b3"

  sha256_linux_x86_64 = "a93fdf59e583aff74725cfd70c0732acea9604983e45bae976250bb147477d2b"
  sha256_linux_aarch64 = "bca99c28b22fec1b95e27326f2b1661b3711e2977196cafa05d76d837c226201"

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
