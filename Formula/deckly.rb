# Written by `cargo dev release-files`; edit packaging/homebrew/deckly.rb.in
# in the Deckly repository instead.
class Deckly < Formula
  desc "Unofficial, independent app for Stream Deck hardware"
  homepage "https://github.com/auuruum/Deckly"
  version "0.0.1"
  license "MIT"

  on_arm do
    url "https://github.com/auuruum/Deckly/releases/download/v0.0.1/deckly-aarch64-apple-darwin.tar.gz"
    sha256 "f314c198a959314ad127c13d9eca493ba4e19186d8989f0ee98d4ed9dbc231eb"
  end
  on_intel do
    url "https://github.com/auuruum/Deckly/releases/download/v0.0.1/deckly-x86_64-apple-darwin.tar.gz"
    sha256 "da34a669864941ff7e0b21fd9d27234556e4ca7ade5a07dd3b862074e597587b"
  end

  depends_on :macos

  def install
    prefix.install "Deckly.app", "LICENSE", "THIRD-PARTY-LICENSES.txt"
    bin.write_exec_script prefix/"Deckly.app/Contents/MacOS/deckly"
  end

  def caveats
    <<~EOS
      Start Deckly with `deckly`, or add it to Launchpad and Spotlight:
        ln -sf #{opt_prefix}/Deckly.app ~/Applications/Deckly.app
    EOS
  end

  test do
    assert_predicate prefix/"Deckly.app/Contents/MacOS/deckly-web", :exist?
  end
end
