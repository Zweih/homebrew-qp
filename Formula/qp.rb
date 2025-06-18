class Qp < Formula
  desc "qp - Query Packages. A CLI utility for querying installed packages."
  homepage "https://github.com/Zweih/qp"
  version "5.91.2"
  license "GPL-3.0-only"

  depends_on "sqlite" => :optional

  sha256_amd64 = "3b4ce3e15d254602c6b7671d5bb68cf3162579e8873470113c676c914e4d00e0"
  sha256_arm64 = "1936103256e122c8f585b6dbdafe6493938154327866b718169686d2e7b57f40"

  sha256_linux_x86_64 = "24d6aab1f4c3f7744c0dfd529494cced1c9dfd7a1319d0ee2ff1911693ac1019"
  sha256_linux_aarch64 = "1aeb5f745cb23e43fad588eaee97efbd5b7ff07fa22b361d43628c28aaa9ea9e"

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
