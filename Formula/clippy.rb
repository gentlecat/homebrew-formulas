class Clippy < Formula
  desc "Make Clippy say things"
  homepage "https://code.roman.zone/clippy"
  url "https://github.com/gentlecat/clippy/archive/v1.0.tar.gz"
  sha256 "f3ae8d3d4564a41b6e2a21f237d2f2b104f48108591e8b83497500182a3ab3a4"
  head "https://github.com/gentlecat/clippy.git"

  depends_on "go" => :build

  def install
    ENV["GOBIN"] = bin
    ENV["GOPATH"] = buildpath
    (buildpath/"src/code.roman.zone/clippy").install buildpath.children

    cd "src/code.roman.zone/clippy" do
      system "go", "build", "-o", bin/"clippy", "./cmd/clippy"
      prefix.install_metafiles
    end
  end

  test do
    system "#{bin}/clippy", "test"
  end
end
