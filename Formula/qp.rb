class Qp < Formula
  desc "qp - Query Packages. A CLI utility for querying installed packages."
  homepage "https://github.com/Zweih/qp"
  version "5.86.3"
  license "GPL-3.0-only"

  depends_on "sqlite" => :optional

  sha256_amd64 = "faaa747e05fe13a379500f5cc842420d18aaddd94cd6319c18b07fdd77694e8c"
  sha256_arm64 = "719055f6722d3c05e605915eacde826a4ca2647adc17443c4f00369b3b10b799"

  sha256_linux_x86_64 = "2d7a4edc2d3d261b800c36c230112b69b2c4946abee5b633af30a8dcf9229acf"
  sha256_linux_aarch64 = "ac797ceb54996bfce4fded57d21f53034b23369d033ce6d90387e070eef578c6"

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
