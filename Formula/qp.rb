class Qp < Formula
  desc "qp - Query Packages. A CLI utility for querying installed packages."
  homepage "https://github.com/Zweih/qp"
  version "5.61.0"
  license "GPL-3.0-only"

  sha256_amd64 = "d91cd1640f52f5a47ba22d711d40d1f732494c86b345dee8e9e7a227d134109e"
  sha256_arm64 = "1cd21d47ed59ed7afc0eb04a9dac74e49cda0e3b1da2550abad7c5f68e4cdbd5"

  sha256_linux_x86_64 = "a11785f4b08bdb977007e01f83081d0d9d0c0c73f9c12fc8d1318aaa2ad542ad"
  sha256_linux_aarch64 = "ffe1be16585e3520705efccf8265c2f6954f0b3e2fe59a2a774c00b42a3b780f"

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
