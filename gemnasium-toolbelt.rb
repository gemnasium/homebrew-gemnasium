require "formula"

class GemnasiumToolbelt < Formula
  homepage "https://gemnasium.com"

  url "https://github.com/gemnasium/toolbelt/archive/0.2.2.tar.gz"
  sha1 "3da1b3c2b33e8a1ba8f73fa97d6d25fd9e8b61d5"

  # head "https://github.com/gemnasium/toolbelt", using: :git, branch: "master"

  depends_on "go"

  def install
    system "go build -o toolbelt"
    # Cannot directly build as gemnasium since there's already a directory named gemnasium
    system "mv toolbelt gemnasium"
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