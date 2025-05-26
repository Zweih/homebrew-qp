class Qp < Formula
  desc "qp - Query Packages. A CLI utility for querying installed packages."
  homepage "https://github.com/Zweih/qp"
  version "5.60.0"
  license "GPL-3.0-only"

  sha256_amd64 = "1c804230a257d08f715f165f4b02561323313e1eb8086860e79033f7f06027ce"
  sha256_arm64 = "b3ead9ba2071c74061235c1f9cb106b35160d37a68b256328293438deda963e1"

  sha256_linux_x86_64 = "f7df8d44b3bd63b9809fbbdb10b1a183230812f55470a4d8853792e99ba49c99"
  sha256_linux_aarch64 = "dc40ec11a15e4f054cf28f90324cfda52d2da2cc8fe000613ad06c631264bf2c"

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
