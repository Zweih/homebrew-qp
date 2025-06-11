class Qp < Formula
  desc "qp - Query Packages. A CLI utility for querying installed packages."
  homepage "https://github.com/Zweih/qp"
  version "5.86.4"
  license "GPL-3.0-only"

  depends_on "sqlite" => :optional

  sha256_amd64 = "2f027e8e2efda6ba433d7c96ecbab2e1cc569bd1a56d0c1d5bacd627510762e7"
  sha256_arm64 = "db8d262c66ce61126f78ddcece5bd6d7b77de75f63169e149fa12cd20f4db179"

  sha256_linux_x86_64 = "f0afd2498557d012da00da811a50de9311af87ca947e357f4437c76aab79a2ef"
  sha256_linux_aarch64 = "1fff94fe49ccce08a21a2a0655166fb94f72f80437b986adb44960ab7b8139d8"

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
