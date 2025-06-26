class Qp < Formula
  desc "qp - Query Packages. A CLI utility for querying installed packages."
  homepage "https://github.com/Zweih/qp"
  version "5.94.1"
  license "GPL-3.0-only"

  depends_on "sqlite" => :optional

  sha256_amd64 = "9ace4c4870e85e961d6e89d9223776ebad4ab0c5f9158a971d4a6e5640f38340"
  sha256_arm64 = "7372046eb1123ef4e846e8bf86c14f2847f2aadc863ff73f20440ede5298de1e"

  sha256_linux_x86_64 = "f3a5e75b90b5696bae5982f259f9079468ae25282e6b4a3efce2351f3ec93113"
  sha256_linux_aarch64 = "713fa414c4ea315a5c5423a74fa7406b5eb6a841ea120e3ce31e822219bf394b"

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
