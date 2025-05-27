class Qp < Formula
  desc "qp - Query Packages. A CLI utility for querying installed packages."
  homepage "https://github.com/Zweih/qp"
  version "5.62.1"
  license "GPL-3.0-only"

  sha256_amd64 = "eac7fda6a8024ad08d923d7c473ba62066ab63ffb64d37911049530bde5141ed"
  sha256_arm64 = "d82fc39114927f3d985be1edb2271f1b02d30465e3667fa3e8d9857be5b63bf0"

  sha256_linux_x86_64 = "8d2434a0ed633845c7bf51988e3f387a61a85d12663928e7ca5c40a87e1224f0"
  sha256_linux_aarch64 = "1d700c7098525c40caaef08ff797202c40c085f940e98355990d52c4a3b00ef6"

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
