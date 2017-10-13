require "formula"

class GemnasiumToolbelt < Formula
  homepage "https://gemnasium.com"

  url "https://github.com/gemnasium/toolbelt/archive/0.2.11.tar.gz"
  sha256 "13f52abb486b3a915da30ba948c15692da4160f6954777899b994f2bcb4190fc"

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
      gemnasium configure <project-name>

    If you want to create a new project on Gemnasium, you'll need to run
      gemnasium projects create

    To get further help, please run
      gemnasium --help
    EOS
  end
end
