class Qp < Formula
  desc "qp - Query Packages. A CLI utility for querying installed packages."
  homepage "https://github.com/Zweih/qp"
  version "5.95.0"
  license "GPL-3.0-only"

  depends_on "sqlite" => :optional

  sha256_amd64 = "0c768011ff0dc788a275a78f767d64f2c0aa82bd992962d1991b8508e8d3d846"
  sha256_arm64 = "28ced39c92868dd2a8f0e270d7f771b6897dbd16571375e3216aac7665411d65"

  sha256_linux_x86_64 = "ed03e0676a239e3e70331dbea3fd0f4dc8241b016ef35ff91cefab8df2a2dd2e"
  sha256_linux_aarch64 = "e0c291beee3b0769a4a1d0ca55a17faae9bf507076666bde5e5b28c40b7dcaac"

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
