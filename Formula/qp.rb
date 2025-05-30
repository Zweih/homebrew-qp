class Qp < Formula
  desc "qp - Query Packages. A CLI utility for querying installed packages."
  homepage "https://github.com/Zweih/qp"
  version "5.67.1"
  license "GPL-3.0-only"

  sha256_amd64 = "3b29af2e76e153cbb121361fbc943152be758e49a649e350940ab70cfe6f277d"
  sha256_arm64 = "a63b77b0160e714ca004e75580e32df93dc2f8e4faa07b23f2e60311b74ec867"

  sha256_linux_x86_64 = "88308963e7b20987bfd323405e12844c23000242d4bac9f42b556f5818efa8e3"
  sha256_linux_aarch64 = "c25c720327cf62c534a48e0371594e88f10c985bf16f7619efb573110fa34ab1"

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
