class Qp < Formula
  desc "qp - Query Packages. A CLI utility for querying installed packages."
  homepage "https://github.com/Zweih/qp"
  version "5.78.1"
  license "GPL-3.0-only"

  depends_on "sqlite", optional: true

  sha256_amd64 = "2c99ebfd39c71fa9175ea72dbf616ab2ce35da7bdb4c00771ad4f28edd373c6c"
  sha256_arm64 = "6404ad933373d0b0fda0482cdc89309ce8fa1ceb58a52b688716b30ca84966dd"

  sha256_linux_x86_64 = "09ed04fac059790e650efc07329ca4a3644b988cd34cf20db309f1822fbb9f53"
  sha256_linux_aarch64 = "41fdbf6ac4cc63b47bc92ead5246b99efb22f1e3368abeae33afdb940e595c7b"

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
