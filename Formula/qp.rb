class Qp < Formula
  desc "qp - Query Packages. A CLI utility for querying installed packages."
  homepage "https://github.com/Zweih/qp"
  version "5.76.0"
  license "GPL-3.0-only"

  depends_on "sqlite", optional: true

  sha256_amd64 = "b04dfa4c1c73ff9f72f139d76fb4002a1183b6a34690cf0f3d7469d54b8473c4"
  sha256_arm64 = "791a3c91fb36e013af8135e23b10f51fcd56de44e049e2102a0847af6eed78a0"

  sha256_linux_x86_64 = "4d3aec31d4408c7a98d59c5ae1699546c56189b2c165d697f3e6b8a06eb2d91f"
  sha256_linux_aarch64 = "3640f761637376afeed89cfebd76f5a9a873d3ece14f2d388d2f03cc9128fc86"

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
