class Qp < Formula
  desc "qp - Query Packages. A CLI utility for querying installed packages."
  homepage "https://github.com/Zweih/qp"
  version "5.71.1"
  license "GPL-3.0-only"

  sha256_amd64 = "0e373d82f2e71685c002cfda2d3cf205bf578d1294739cb27c1f29541a279108"
  sha256_arm64 = "4c2d1472b1b02b145cd1b5419b90583e5cbf63c4a5ed854c515e10fb094f7d8b"

  sha256_linux_x86_64 = "e544fe09b38e60ae20cf123ca012df606033c6f3f85f286be13433b7e6d1862e"
  sha256_linux_aarch64 = "41ec6834e1dee4aaf9f95d0134e7681ed143ea7f1c05efafc32b7c59f0c9c663"

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
