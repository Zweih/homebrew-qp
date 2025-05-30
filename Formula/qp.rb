class Qp < Formula
  desc "qp - Query Packages. A CLI utility for querying installed packages."
  homepage "https://github.com/Zweih/qp"
  version "5.68.0"
  license "GPL-3.0-only"

  sha256_amd64 = "cfaebd6b276f3c1e712814221476de4f2ec44338e01b4dd1647f0d8840dfc6ef"
  sha256_arm64 = "593e41a7d9f91133aba1e366640ac2596633b22edec22ce5f74910e40cefbec2"

  sha256_linux_x86_64 = "8451dfe16ca49476cebac31784b31e5cd6fc08afdc9aa9696cc408de337cd9fc"
  sha256_linux_aarch64 = "354e353aa77eb883f17492313fd87cb91379540356a0ad496720e6fd12c5a697"

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
