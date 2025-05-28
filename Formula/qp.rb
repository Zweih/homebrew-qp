class Qp < Formula
  desc "qp - Query Packages. A CLI utility for querying installed packages."
  homepage "https://github.com/Zweih/qp"
  version "5.65.1"
  license "GPL-3.0-only"

  sha256_amd64 = "3027ef6f47f73011acf7509a563c7c9b553092a0c4b3a1f155b365e78d15d7b9"
  sha256_arm64 = "e05568edb7d84328fe81e9d1cb0c4ee322a353972df93d8ed348cc5b9a2d1602"

  sha256_linux_x86_64 = "cd2b8869d72f708f7d676e64e159f78ea59a8918bc8dfdc75a67d45384920447"
  sha256_linux_aarch64 = "009a1c4b99a02da12a12b52385e019ae82dd61b64a18f7298dbae494642f1c81"

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
