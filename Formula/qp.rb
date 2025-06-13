class Qp < Formula
  desc "qp - Query Packages. A CLI utility for querying installed packages."
  homepage "https://github.com/Zweih/qp"
  version "5.86.9"
  license "GPL-3.0-only"

  depends_on "sqlite" => :optional

  sha256_amd64 = "248dd60ddaa330e97c32a5d24f8eeab0293e835ca34198a6ce159511499c879f"
  sha256_arm64 = "b306075946c0a0974139af83c35be8adf266019d61f584596126f92438bf16ea"

  sha256_linux_x86_64 = "4e30d39e6cd7d5e5c63d1eda1ac908346c9ca5beedb55f4835e2f3af10900182"
  sha256_linux_aarch64 = "4ecf49c5af046493564290449debdbbc27325fce6e57d4ed9238a1c0c4f42e0e"

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
