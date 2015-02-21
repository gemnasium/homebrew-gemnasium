require "formula"

class GemnasiumToolbelt < Formula
  homepage "https://gemnasium.com"

  url "https://github.com/gemnasium/toolbelt/archive/0.2.6.tar.gz"
  sha1 "a7925bef3cf842567d5f8e30075611f1ad854b0f"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    # build a proper GOPATH tree for local dependencies
    (buildpath + "src/github.com/gemnasium/toolbelt").install "models", "gemnasium", "utils", "config", "commands", "autoupdate", "auth", "live-eval"

    system "go", "get", "-d"
    system "go build -o #{bin}/gemnasium"
  end

  test do
     system "#{bin}/gemnasium", "-v"
  end

  def caveats; <<-EOS.undent
    Thank you for installing gemnasium-toolbelt!

    You now need to run
      gemnasium auth login
    to save your Gemnasium credentials.

    If you already have a project on Gemnasium, you'll need to run
      gemnasium configure

    If you want to create a new project on Gemnasium, you'll need to run
      gemnasium projects create

    To get further help, please run
      gemnasium --help
    EOS
  end
end
