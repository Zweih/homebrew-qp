class Qp < Formula
  desc "qp - Query Packages. A CLI utility for querying installed packages."
  homepage "https://github.com/Zweih/qp"
  version "5.86.4"
  license "GPL-3.0-only"

  depends_on "sqlite" => :optional

  sha256_amd64 = "3fc625c7fc451730ee151fd26b2334551b59b9c12d4f7518548efa5a3f9003e6"
  sha256_arm64 = "4f55aa157e7bfba61473e251c2138e8ee57f07bf3b7ac9c45c0ce1c71059bf71"

  sha256_linux_x86_64 = "b473f2bf95e446c67d0a12cc91c8dcba5639ff0fdc9a04617756f10b14123a89"
  sha256_linux_aarch64 = "fe4039bd1d5a7f51f6e4d11bc7079459df5fe57ef434a84886863c410090ca62"

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
