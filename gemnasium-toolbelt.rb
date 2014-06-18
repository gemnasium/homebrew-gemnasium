require "formula"

class GemnasiumToolbelt < Formula
  homepage "https://gemnasium.com"

  url "https://github.com/gemnasium/toolbelt/archive/v0.1.0.tar.gz"
  sha1 "999f5642f4ba554e7b6aa8780e3203c24d4e2e63"

  # head "https://github.com/gemnasium/toolbelt", using: :git, branch: "master"

  depends_on "go"

  def install
    system "go build -o gemnasium"
    bin.install "gemnasium"
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
      gemnasium projects configure

    If you want to create a new project on Gemnasium, you'll need to run
      gemnasium projects create

    To get further help, please run
      gemnasium --help
    EOS
  end
end
