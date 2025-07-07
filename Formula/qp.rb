class Qp < Formula
  desc "qp - Query Packages. A CLI utility for querying installed packages."
  homepage "https://github.com/Zweih/qp"
  version "5.99.2"
  license "GPL-3.0-only"

  depends_on "sqlite" => :optional

  sha256_amd64 = "8d8a3a9f2862c6be1ed1dba1ed2aee9a1ac3baf72d76e4246effb47facf30bac"
  sha256_arm64 = "275c2a1bbe4bb8bbe92886d8bad6142de582716ac55df85d6debf7e146aaa32b"

  sha256_linux_x86_64 = "93bba2de4e9173bfa0c0f21252f1ff25695b7c888228b4096a1aa5e8c1301623"
  sha256_linux_aarch64 = "e27c8f01a0feb3f3e594dff2f6a9f558a06a2aafb021dd0bacb87c6e17caa92c"

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
