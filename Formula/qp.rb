class Qp < Formula
  desc "qp - Query Packages. A CLI utility for querying installed packages."
  homepage "https://github.com/Zweih/qp"
  version "5.105.0"
  license "GPL-3.0-only"

  depends_on "sqlite" => :optional

  sha256_amd64 = "a76f529bbb7bf1f0e854cc12fcfba6cfc1cd89e81d0cca3b6a28dd5a855a1368"
  sha256_arm64 = "793bf77d6834d3a1519dbd4c7856d3fd66ba7c3a3d31a73e96037c44ddeb0810"

  sha256_linux_x86_64 = "9ca5062121007e283b04cbbdf4658a9b4ad6b534d514cb01edaef339ecf17e11"
  sha256_linux_aarch64 = "8e46a04d44aaf4d9840ec0b5bf3a5d1613ef9ed453d28b94f23ae6914f76d6b2"

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
