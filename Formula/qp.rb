class Qp < Formula
  desc "qp - Query Packages. A CLI utility for querying installed packages."
  homepage "https://github.com/Zweih/qp"
  version "5.75.0"
  license "GPL-3.0-only"

  depends_on "sqlite", optional: true

  sha256_amd64 = "38c90e2494663aca0c902d9a931cb1d24291760b6934eb4473becf09b1991482"
  sha256_arm64 = "30749e7b2338d2c8aa0ce3cc9043f72bb535ce3cff60db26f903941bfc1c94f0"

  sha256_linux_x86_64 = "178228d893feefe3b4367d150ff37b73a3983db38d288534fed9f44e86fca15f"
  sha256_linux_aarch64 = "fb6babefd3abbb4c1ee801a115b070612ffab8ec56020a034586a756c4a9c20d"

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
