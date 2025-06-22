class Qp < Formula
  desc "qp - Query Packages. A CLI utility for querying installed packages."
  homepage "https://github.com/Zweih/qp"
  version "5.93.1"
  license "GPL-3.0-only"

  depends_on "sqlite" => :optional

  sha256_amd64 = "729943c60151538b22def30a00bdc4faab0b2b93b54efe00a42886ea7dbb621b"
  sha256_arm64 = "15cb38ea850f32be50903afa495f4a97ca5886cd024d6a4702a16c93294d32f8"

  sha256_linux_x86_64 = "eb1f0f39159ef354f9517e8e060e6885be70df4334f1b967f1090905e0ebb258"
  sha256_linux_aarch64 = "b7f299b48ad76b7a94f25502caebce5d42b5bdb27eda9098c58442c429d80957"

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
