class Clippy < Formula
  desc "Make Clippy say things"
  homepage "https://code.roman.zone/clippy"
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
