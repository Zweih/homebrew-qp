class Qp < Formula
  desc "qp - Query Packages. A CLI utility for querying installed packages."
  homepage "https://github.com/Zweih/qp"
  version "5.72.1"
  license "GPL-3.0-only"

  sha256_amd64 = "9301461d7f03cdfb22a4bf62ac030fef5b43b2d9fe40a1073b7a33a9e29d5a1d"
  sha256_arm64 = "4ed7b3e2e8affa56284473900d6ccc7918dfcc92804137de7e4192dbcd7a46ed"

  sha256_linux_x86_64 = "24706f7945fe48d34fcbf556686980b59b5327c3acb2a4ac4fed09a7248ad7d2"
  sha256_linux_aarch64 = "d3713421c40bc3268d798315c98e0b0bb33b9408afb89e1ec22fa682daacd1ee"

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
