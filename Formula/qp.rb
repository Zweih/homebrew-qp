class Qp < Formula
  desc "qp - Query Packages. A CLI utility for querying installed packages."
  homepage "https://github.com/Zweih/qp"
  version "5.86.5"
  license "GPL-3.0-only"

  depends_on "sqlite" => :optional

  sha256_amd64 = "5f7490d49d0ea9e9c458ea541ef07ef00dfec63340be74085b3c93cd06d03097"
  sha256_arm64 = "2653ee42a5b4f8ec669584287cfad81282b20c2eed77917bfb164b307e46d9ef"

  sha256_linux_x86_64 = "818e9cfb6aafc889ecea674e75df9d5d1dee9fdbef65655e2880aed10612da27"
  sha256_linux_aarch64 = "a2df651feba23ab3f487a389fdb0440469a76fac859a963b3263e272b9f41154"

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
