class Qp < Formula
  desc "qp - Query Packages. A CLI utility for querying installed packages."
  homepage "https://github.com/Zweih/qp"
  version "6.1.2"
  license "GPL-3.0-only"

  sha256_amd64 = "6dc8e12bc0c6ae3c6b8431fee4973eff19d25fae337343e78fb17e9a97ea03cf"
  sha256_arm64 = "2b0b7849ea03245e3082cb701c3790cdf264c805fff158f0a350eb416875f371"

  sha256_linux_x86_64 = "51e3b9da24a565ba64fe3661a4a333d796370ed47c3f4379b6cfc53a747c4c1e"
  sha256_linux_aarch64 = "421980f12c6ca0690ed8aa5e955381744f48fa0a41b7b133f300ffdc5e89460b"

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
