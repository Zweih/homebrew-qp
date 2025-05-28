class Qp < Formula
  desc "qp - Query Packages. A CLI utility for querying installed packages."
  homepage "https://github.com/Zweih/qp"
  version "5.65.2"
  license "GPL-3.0-only"

  sha256_amd64 = "558f5a15403bc643168b68b3ba78dca39609f877037073fa9ca70c178c6efae2"
  sha256_arm64 = "93419929606fada517324524c46f2a9b1f29f0c35361e1dd83cd695d27597fa1"

  sha256_linux_x86_64 = "38336e949bd3779ffb6a53a9fab595f2a9d1e05e9e9e2ba428d3ebd3dd6f0a48"
  sha256_linux_aarch64 = "0344e6f1abeb52506c205571b03b8c9ea5e24ad6dc12a30fb5695eed6c36074b"

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
