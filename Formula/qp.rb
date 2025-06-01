class Qp < Formula
  desc "qp - Query Packages. A CLI utility for querying installed packages."
  homepage "https://github.com/Zweih/qp"
  version "5.71.0"
  license "GPL-3.0-only"

  sha256_amd64 = "512ed52055e44da52f41894bfddcd72ff15d5a4ca94c08180d50ae887bb52419"
  sha256_arm64 = "b46c8aa40c2d54ae1192eaa0c51f8568d37424a82eff2ac7c86432121c70f8c0"

  sha256_linux_x86_64 = "63acc021e5667f5e4a05d367b91c2da83571e301ed119de5d02fd58d5a6389da"
  sha256_linux_aarch64 = "60d7f8298be844c0c744f3827a6f683abd401a17cca7e37ca5995805ce469cbc"

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
