class Qp < Formula
  desc "qp - Query Packages. A CLI utility for querying installed packages."
  homepage "https://github.com/Zweih/qp"
  version "5.66.1"
  license "GPL-3.0-only"

  sha256_amd64 = "aadcbb4b2c080ec50aee9d6ab45cadff8f2aa868e28fde4333595440b1dfc416"
  sha256_arm64 = "95b285620d93477ddde8aee6dc006c2686e261dfd595b35305478ad4715be643"

  sha256_linux_x86_64 = "69eea2b91a38324c29fd46ce85aec6a8a9fc47889e655f23e32028d08eba388a"
  sha256_linux_aarch64 = "e685cfacabbd5a64d7a6322f850df8a01355e9ea939680622e983dee9bc58ad0"

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
