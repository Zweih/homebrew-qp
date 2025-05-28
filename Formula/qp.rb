class Qp < Formula
  desc "qp - Query Packages. A CLI utility for querying installed packages."
  homepage "https://github.com/Zweih/qp"
  version "5.63.1"
  license "GPL-3.0-only"

  sha256_amd64 = "5d9c715eeddf75dd6ba69edc777bfd53740505ebba338789c4d7ade197738815"
  sha256_arm64 = "9382d996c406b4c5ca73dcf754f8d4055c3ef231f8549361708b3636a77e99d8"

  sha256_linux_x86_64 = "d564ecf695f15732ee19474324844a01e51e082e1d96a329731cfe92bc83c9db"
  sha256_linux_aarch64 = "eba5bdc6babb52d7d22a5032cc2324667460a746e3fdc2e0060563968bbbdf0d"

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
