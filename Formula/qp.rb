class Qp < Formula
  desc "qp - Query Packages. A CLI utility for querying installed packages."
  homepage "https://github.com/Zweih/qp"
  version "5.73.0"
  license "GPL-3.0-only"

  depends_on "sqlite", optional: true

  sha256_amd64 = "4998ab4bff6628cab592137763a19557648b5bb5cb31caa15412399c4e14fa20"
  sha256_arm64 = "5ec3972d454f48ab1744bbc89e355d877554b0a2fcc4fcca25d424549c3b84ef"

  sha256_linux_x86_64 = "4bba158d8370051fe22651e80a1874997023474770b3e1ace168f593e69f2964"
  sha256_linux_aarch64 = "697fd9f47d21fcae7d7eee0b2f3aa350174cc32fc6b014d3e23292be2139ce28"

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
