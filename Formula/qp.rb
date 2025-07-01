class Qp < Formula
  desc "qp - Query Packages. A CLI utility for querying installed packages."
  homepage "https://github.com/Zweih/qp"
  version "5.98.1"
  license "GPL-3.0-only"

  depends_on "sqlite" => :optional

  sha256_amd64 = "7824642a6005843a8de938b96a162f690f03f0a91bed94cce5777195c68eb836"
  sha256_arm64 = "7385be3f5a0d6c4211c6dc7042280fa88e7c02274ffab0e6b44cfd66d932c895"

  sha256_linux_x86_64 = "ffa5533ebfbfa81af6d8cc7d10e9e96626c3802b2313515928df3f745a2ce26d"
  sha256_linux_aarch64 = "6456274d9c4d8039ca9c3e4a8f3eff0ba37073309dc305d608152003f0283bd7"

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
