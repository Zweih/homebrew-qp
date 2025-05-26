class Qp < Formula
  desc "qp - Query Packages. A CLI utility for querying installed packages."
  homepage "https://github.com/Zweih/qp"
  version "5.58.0"
  license "GPL-3.0-only"

  sha256_amd64 = "c0ac2b5673f8b71dbb799547f80dcc71c3feb3dad1d5f7865712a57aa5f6cdd0"
  sha256_arm64 = "559707d50f6e112e4d384e55a52c85df26afb01caf016c8e087c68f693019300"

  sha256_linux_x86_64 = "70880d850eeaa8573e2f0112929c76c630984f6977ff6d7fcdcd9b9b420aa385"
  sha256_linux_aarch64 = "527fc3285458e4195594a9a4ffd71139afa15b45426509a1059e78219c94dfbf"

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
