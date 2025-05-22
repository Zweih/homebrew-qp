class Qp < Formula
  desc "qp - Query Packages. A CLI utility for querying installed packages."
  homepage "https://github.com/Zweih/qp"
  version "5.50.1"
  license "GPL-3.0-only"

  sha256_amd64 = "7985f09635933eda259bedfeeffba0b50ac58dcacceaedf1bb6d974daba5638a"
  sha256_arm64 = "c39f302d9ee056eaee8ada11c31db882a57d712310cbf541b6bd0e52fd22b70f"

  sha256_linux_x86_64 = "ba582ac99722690ea9eea5747a8e0e6cb10219e1f4414f2c1092ce17d4cc8603"
  sha256_linux_aarch64 = "58395002284c1d41c09d72d4451c5b693ebbdf25b2d70a51b35c674020a0cdcd"

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
