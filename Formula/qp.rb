class Qp < Formula
  desc "qp - Query Packages. A CLI utility for querying installed packages."
  homepage "https://github.com/Zweih/qp"
  version "5.101.0"
  license "GPL-3.0-only"

  depends_on "sqlite" => :optional

  sha256_amd64 = "a0213d2700e653a0ab0c8ecbceba186924d0bec8d5e3a9cabe6aa66fa8898fa3"
  sha256_arm64 = "e984ca23379d7a50948e71568ea4b5583a0d4f1ac09b04a2eb38f52eb978cd2f"

  sha256_linux_x86_64 = "1b8725e64d904291ea02cf5a55c9f5dad9b53bcb1fdbf9fd6af88b4b1102b673"
  sha256_linux_aarch64 = "6ba919a0561623fcf27627dd2201e5f6dd5d713c38aeed17b37ffcfe9cee8604"

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
