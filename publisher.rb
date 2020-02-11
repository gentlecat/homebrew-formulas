class Publisher < Formula
  desc "Static website generator"
  homepage "https://code.roman.zone/publisher"
  head "https://github.com/gentlecat/publisher.git"

  depends_on "go" => :build

  def install
    ENV["GOBIN"] = bin
    ENV["GOPATH"] = buildpath
    (buildpath/"src/code.roman.zone/publisher").install buildpath.children

    cd "src/code.roman.zone/publisher" do
      system "go", "build", "-o", bin/"publisher", "./cmd/publisher"
      prefix.install_metafiles
    end
  end

  test do
    system "#{bin}/publisher", "help"
  end
end
