class Qp < Formula
  desc "qp - Query Packages. A CLI utility for querying installed packages."
  homepage "https://github.com/Zweih/qp"
  version "5.102.2"
  license "GPL-3.0-only"

  depends_on "sqlite" => :optional

  sha256_amd64 = "72267cca0e9218f44805845d613a7bb44a581dff17d7173fa236bddc2c7c415b"
  sha256_arm64 = "a6efe7c26784b489eed5a5b1ea2cca425025081f295dc730d30a0a0b61a649f6"

  sha256_linux_x86_64 = "20b9716d391387c3021eaf843e6e96f0435eae17ef0cf5836e6d6dd4256b749e"
  sha256_linux_aarch64 = "1fbcf91656a4b2726ce4751a261702515cebe246d99c0d6db9a5a1baf8b47227"

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
