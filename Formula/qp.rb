class Qp < Formula
  desc "qp - Query Packages. A CLI utility for querying installed packages."
  homepage "https://github.com/Zweih/qp"
  version "5.99.0"
  license "GPL-3.0-only"

  depends_on "sqlite" => :optional

  sha256_amd64 = "7a4540f041068656ac84bf9caaacd9c91a69873d66afd02e4fdd6238ff6fa921"
  sha256_arm64 = "de5cfce497177cd5effab616c3d1b1ac94c0cfada9551fbbfde680254f6bc843"

  sha256_linux_x86_64 = "f0b8db03225c495328e3c0fb0805e9ddd005848720b570893ca5c6c098b7355f"
  sha256_linux_aarch64 = "033eb5eb2b5385d8e9f7fe27d59cca9c8adfd161bb8738b8e95615ce56f2e989"

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
