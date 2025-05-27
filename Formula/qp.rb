class Qp < Formula
  desc "qp - Query Packages. A CLI utility for querying installed packages."
  homepage "https://github.com/Zweih/qp"
  version "5.62.2"
  license "GPL-3.0-only"

  sha256_amd64 = "78f1e279605619bf1ee9eb33c56a10db88bdb2322c4ad934297b0a6602c913ca"
  sha256_arm64 = "8779d751b41cc28961e66cb2163f3ee9caad983d1ab7f510c08897a5bcb27f88"

  sha256_linux_x86_64 = "6d543a8834ec0b77a710758b1581d2e0f3774b1032472461d550ee1e5fcfcfb8"
  sha256_linux_aarch64 = "6ab17c3f677103cb4e86ac18d5891621c54d51057f81d7cf8a3ccb956c0e1b29"

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
