class Qp < Formula
  desc "qp - Query Packages. A CLI utility for querying installed packages."
  homepage "https://github.com/Zweih/qp"
  version "5.104.1"
  license "GPL-3.0-only"

  depends_on "sqlite" => :optional

  sha256_amd64 = "89a6a178eac55dc5f7dbe5f6e9f028ea3236ad3215c08c4a99326e5b4cf406fb"
  sha256_arm64 = "5e57dc0f529cf8a25a83d22b096a16215cb89191a65fa125847719a84f8d26f5"

  sha256_linux_x86_64 = "657b6025562e0a0c8f91c573c4c99304e731ecdaf0b8416472ab78d02dfcb698"
  sha256_linux_aarch64 = "e4452331648d612addde435289b45119852053627383698f27d33ee7a4bdcc9f"

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
