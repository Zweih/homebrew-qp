class Qp < Formula
  desc "qp - Query Packages. A CLI utility for querying installed packages."
  homepage "https://github.com/Zweih/qp"
  version "5.51.0"
  license "GPL-3.0-only"

  sha256_amd64 = "4862898378668613007e54470f7ba7f4764dee14c8a5d6fa871d3f1272639a5c"
  sha256_arm64 = "d38b6ad094a6134c89e5ed511d6db818ca1cac983f6a5b1343b24668c1680f58"

  sha256_linux_x86_64 = "fc1b35071b1056a0569055121246a92db0dce3d708d4a901ccc50173ef8af3a0"
  sha256_linux_aarch64 = "c14883dc7bdafb04b3364ee95920452be6a1ce3613446efad4f8d47c94dc99ec"

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
