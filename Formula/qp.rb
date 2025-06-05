class Qp < Formula
  desc "qp - Query Packages. A CLI utility for querying installed packages."
  homepage "https://github.com/Zweih/qp"
  version "5.75.2"
  license "GPL-3.0-only"

  depends_on "sqlite", optional: true

  sha256_amd64 = "ff5a2d9965fa98c03508fda30e67451bd32f9f3f84bc95038f068e103bd1ab22"
  sha256_arm64 = "ded3e4a4ecaf15a7d1ad6b46d914ec6f5c0339c21cc4d13dfc30407c54c360ab"

  sha256_linux_x86_64 = "33629d64f10023c20ef91597abfa3e9800e26856c150bb38c017cf0547da6acb"
  sha256_linux_aarch64 = "38f66002a9a37281e649c4988bc1e25aebe50b77fe68aa3497f10e95d77a1cb6"

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
