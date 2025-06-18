class Qp < Formula
  desc "qp - Query Packages. A CLI utility for querying installed packages."
  homepage "https://github.com/Zweih/qp"
  version "5.91.3"
  license "GPL-3.0-only"

  depends_on "sqlite" => :optional

  sha256_amd64 = "3ab6e1691d03496131f6395b9a685122ca463dec1ca914feb36562f0b99f5b93"
  sha256_arm64 = "dc27571678f68641efa399d7c40f0095ecc192db5cf7e6b9c907a28d591a3db9"

  sha256_linux_x86_64 = "5c6692a2f613c3a8d175ca0ddeb16fb2ce92439a0db6cf5d662a581972dc4048"
  sha256_linux_aarch64 = "7a6b9aeeefe2c77f142c66651f972d64e2ce6760b006749ef688812fcde8dbc3"

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
