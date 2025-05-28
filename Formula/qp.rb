class Qp < Formula
  desc "qp - Query Packages. A CLI utility for querying installed packages."
  homepage "https://github.com/Zweih/qp"
  version "5.65.0"
  license "GPL-3.0-only"

  sha256_amd64 = "6acf3a7adab144e50e90fad5e5a9770d2f5a4d0005f3e763e9fe8f0a178957d1"
  sha256_arm64 = "a56bfbe58a0fa10e6095537789c7cb5b38e4adc5c2e7207367c29bc11cd515a8"

  sha256_linux_x86_64 = "da0c7edbeb65e5c65e9a96576abdbb08d5c2a244e5a60e976fb7a6869c7676d2"
  sha256_linux_aarch64 = "3db9ae884dde0f63add7028ac94b94d9ea13c506187aa0ceac2c08803b1cac34"

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
