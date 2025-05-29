class Qp < Formula
  desc "qp - Query Packages. A CLI utility for querying installed packages."
  homepage "https://github.com/Zweih/qp"
  version "5.66.2"
  license "GPL-3.0-only"

  sha256_amd64 = "cab245041570826bbf702694dcaa6b64df263262792633044f3ee8674245cb12"
  sha256_arm64 = "c6151bcd08728839a65d2228bc7062e013369a68eb38d39ddeb63a90051897eb"

  sha256_linux_x86_64 = "b89fedce571d8ad6f92e88f6a69fcc9c9548f89e162a39ef04b4d8f35703c988"
  sha256_linux_aarch64 = "edfa8d8fd95bbc8c5961eb93f46c173affdb6ff1ba1808c231156381ea87584c"

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
