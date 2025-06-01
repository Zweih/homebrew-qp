class Qp < Formula
  desc "qp - Query Packages. A CLI utility for querying installed packages."
  homepage "https://github.com/Zweih/qp"
  version "5.70.2"
  license "GPL-3.0-only"

  sha256_amd64 = "ab611063928ef29b044dc3aa8b6c2a908fcb4d80789c20a912954b62658dec15"
  sha256_arm64 = "5e978cea6adf5556788cf5573c7bff718f925bb4d9db5d0f2d4cc23af568f8d8"

  sha256_linux_x86_64 = "4a7146df074065652d9c5392c58f8a7308c78f17b26c5b8d609d1f10604aaedf"
  sha256_linux_aarch64 = "3011c04851fc502fc2d4c219661ec543facdd04470ddd78584835a1be2dddd8b"

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
