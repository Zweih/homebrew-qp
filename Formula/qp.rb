class Qp < Formula
  desc "qp - Query Packages. A CLI utility for querying installed packages."
  homepage "https://github.com/Zweih/qp"
  version "5.75.3"
  license "GPL-3.0-only"

  depends_on "sqlite", optional: true

  sha256_amd64 = "1f367e1d6da396b4274facd398a7e24d264e520f46332779ba841f7ab68f8f16"
  sha256_arm64 = "cfdb8d300cc6a07753bf089961224736f3fb91385f85b00a4be68fe2bef065f5"

  sha256_linux_x86_64 = "a8c5d7daa663572db17a41154745c4c9cac67927fbe61f11f70a1b743361a7e4"
  sha256_linux_aarch64 = "ba8dc0681e1e5873cad416b17b986b0872bee8aeebc9a42bbbd89835dd90fb53"

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
