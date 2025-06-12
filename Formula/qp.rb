class Qp < Formula
  desc "qp - Query Packages. A CLI utility for querying installed packages."
  homepage "https://github.com/Zweih/qp"
  version "5.86.7"
  license "GPL-3.0-only"

  depends_on "sqlite" => :optional

  sha256_amd64 = "578b3876b1266254cbe6a99c066ed66fb7f62a03f958d08462f8d6ac43ac2e80"
  sha256_arm64 = "941a867dc928b9a09b3cd108067f311c6a95c00aeafa04c90d29a1065db31a12"

  sha256_linux_x86_64 = "0dce3ece3290c84a0f79a8f53efe7092231da603d96720323e8ea46867020583"
  sha256_linux_aarch64 = "9e19509721c4c3fa78d093fc4256f9f8ad2db167a8dcae6596d562ac262313a3"

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
