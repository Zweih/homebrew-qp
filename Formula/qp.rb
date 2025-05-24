class Qp < Formula
  desc "qp - Query Packages. A CLI utility for querying installed packages."
  homepage "https://github.com/Zweih/qp"
  version "5.54.0"
  license "GPL-3.0-only"

  sha256_amd64 = "877917d8e0768d837fd449bab1e1da9eaa3f2ff1b6b622bc2b278aa2a2ddd810"
  sha256_arm64 = "6a23b9c8f03078644b33cbd2f8290b3e5d693c782a017e19de120c912618f984"

  sha256_linux_x86_64 = "7344c0cf10dd61606c01ab04d72840047d4da517c50831a71f739654abd78d55"
  sha256_linux_aarch64 = "544ab61dae28566ee8c927e432bf724971e675c1933946d738e563a6bb5e4802"

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
