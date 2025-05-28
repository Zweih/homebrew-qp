class Qp < Formula
  desc "qp - Query Packages. A CLI utility for querying installed packages."
  homepage "https://github.com/Zweih/qp"
  version "5.63.2"
  license "GPL-3.0-only"

  sha256_amd64 = "cebfd18f30ebedd2d22c5ddbd0d906598817db5609fc3ca297712e2fe008d0e3"
  sha256_arm64 = "414ec353e08e0c00195c0d294b64afcacac05f407534bca07abbd1b4778ff6c8"

  sha256_linux_x86_64 = "e7a1473f3978a93162143dd3a11527ddbfc2c2a7a1ffc6799e8eb5aa49bae4e3"
  sha256_linux_aarch64 = "c095fcf3542de8befe67216846a55d916bef28e8ddeb84870b904f10885e72dd"

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
