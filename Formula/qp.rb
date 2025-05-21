class Qp < Formula
  desc "qp - Query Packages. A CLI utility for querying installed packages."
  homepage "https://github.com/Zweih/qp-test"
  version "5.49.0"
  license "GPL-3.0-only"

  sha256_amd64 = "219e200c876ff82ebf40a2379fa0940a94322f8c58e624a0fb46f6fef4c1d918"
  sha256_arm64 = "cd281c44672cb42157ec6d674422abe576a4e6b53e4a4c2ac0f392f8004efbbc"

  sha256_linux_x86_64 = "f66c863875df3d5e833baecfbcc2033ce4687514c7975cba0a9f0ec885257207"
  sha256_linux_aarch64 = "ffec7f0e37e1eed57a1565f23d07a32ef9bcbaeb6428fcccc9718b81151309b1"

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
