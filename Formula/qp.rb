class Qp < Formula
  desc "qp - Query Packages. A CLI utility for querying installed packages."
  homepage "https://github.com/Zweih/qp"
  version "5.84.0"
  license "GPL-3.0-only"

  depends_on "sqlite", optional: true

  sha256_amd64 = "2eb9f9075be7306e70ca94b666b6a8944cefd4393d8047af964854d3af6bcaea"
  sha256_arm64 = "8bf74ef129ed782667e67148734601f36e68b875a9db0d1684cc7f50271bb37a"

  sha256_linux_x86_64 = "d17ffccc9cbd4e13f8211c8bdc4c773396924aa09b8ad2e0acfe85ca352b7baa"
  sha256_linux_aarch64 = "b4c04c19e12185b6e0bb620365a9f6e8ab509eb2cd00658ec521eb0eec0d6101"

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
