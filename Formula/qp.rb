class Qp < Formula
  desc "qp - Query Packages. A CLI utility for querying installed packages."
  homepage "https://github.com/Zweih/qp"
  version "5.92.1"
  license "GPL-3.0-only"

  depends_on "sqlite" => :optional

  sha256_amd64 = "8638ce1285a7e599f0e03fe19f638159a8b61765a11fb339411797754e2b8a6f"
  sha256_arm64 = "c0d0409a325cd93ad9ac447fc55ec6516e1d9bf216dc3c6998f0a9285af0bc18"

  sha256_linux_x86_64 = "c9e1f31f83b503aec56f8cb37906defd8c963f713687de34efa23a88128da284"
  sha256_linux_aarch64 = "60acd7e64a1534bd61907e77b10e2b919cbefb94bd7e37c871257b3df0b694c9"

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
