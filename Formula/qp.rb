class Qp < Formula
  desc "qp - Query Packages. A CLI utility for querying installed packages."
  homepage "https://github.com/Zweih/qp"
  version "5.98.0"
  license "GPL-3.0-only"

  depends_on "sqlite" => :optional

  sha256_amd64 = "86c540bd77718970279185b7f9d67a3c34e42534710b754fb1875e32971cc9a2"
  sha256_arm64 = "70bd1a60d49b4883e5061f68782c46596c7c9c4874c5dbdbd9d65de54c322ac4"

  sha256_linux_x86_64 = "7a694694e79aed5b138c5ee4fbbdea529f25ea5cf0a639db8fc7c227e97be6bd"
  sha256_linux_aarch64 = "837e1d493c83944f4d313e3033220bb44b96c23c9f1f3cbffbc985953041b315"

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
