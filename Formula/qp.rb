class Qp < Formula
  desc "qp - Query Packages. A CLI utility for querying installed packages."
  homepage "https://github.com/Zweih/qp"
  version "5.97.0"
  license "GPL-3.0-only"

  depends_on "sqlite" => :optional

  sha256_amd64 = "59063b96962cefe5c0c73a90e1921034b9888dd10885823fc2539a9d6c1c2e6a"
  sha256_arm64 = "b0799125b5eb6126f13a8213b3f8a0028d8ff67c163a1d0f2a03984cb319bb6a"

  sha256_linux_x86_64 = "975ad0e932f0e4e4d639b7265fcb2bea79d731ddf4319141fc484eaf34350cfa"
  sha256_linux_aarch64 = "1604c09f21d57ed154618a6d508ad440706e004b3d8f6f7406262cdd0b74370a"

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
