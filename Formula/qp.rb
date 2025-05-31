class Qp < Formula
  desc "qp - Query Packages. A CLI utility for querying installed packages."
  homepage "https://github.com/Zweih/qp"
  version "5.70.0"
  license "GPL-3.0-only"

  sha256_amd64 = "a958d667483251e320aca71eb60f45f80ec9669853468f37282e4d14c780251f"
  sha256_arm64 = "7f40972a4a5469be70a7f96ac1eca9f3536c2fa3962525fa726b962843586a57"

  sha256_linux_x86_64 = "86995a79e362ad3067e898f2dd41f402fbd8e439f3a803e455baef4f87dc3581"
  sha256_linux_aarch64 = "7233b753943aef4aab7d5153f29a008a12f32c5e486d1489494a36e7e7a43a35"

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
