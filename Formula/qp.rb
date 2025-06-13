class Qp < Formula
  desc "qp - Query Packages. A CLI utility for querying installed packages."
  homepage "https://github.com/Zweih/qp"
  version "5.86.8"
  license "GPL-3.0-only"

  depends_on "sqlite" => :optional

  sha256_amd64 = "eb94659a6af9a4555365544d45b8698a770aeceb13c81c53e29de3228be30d3a"
  sha256_arm64 = "fdca798641dbaee9118d87def8e4cce6de575dd1bf786ae8f7025c7e398d6804"

  sha256_linux_x86_64 = "595f94aee0858a84d9687d76804f95f8f01b1b61631fd22623ddb3edcc80ebb2"
  sha256_linux_aarch64 = "7885281e769b82982a093404ee10feaad4778600456c3a9410600be4c30aa919"

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
