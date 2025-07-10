class Qp < Formula
  desc "qp - Query Packages. A CLI utility for querying installed packages."
  homepage "https://github.com/Zweih/qp"
  version "5.102.2"
  license "GPL-3.0-only"

  depends_on "sqlite" => :optional

  sha256_amd64 = "eb10bf5d9a799f832d4949fcbc76ac38b429754ab1b4eec0ab9e3143824b552b"
  sha256_arm64 = "e34698b69d99cb0c8157e76bc1bd1d5b025135a8b7a7b6a091b79824169be51f"

  sha256_linux_x86_64 = "19bfa915854b26f511f7a9ff3da4872ab0ccd7d58892ea95f6ca38c21eba000b"
  sha256_linux_aarch64 = "8ab9cc2a5b33045b815b2555a26f1e57360790d941429b8157ef9c963333b226"

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
