# typed: false
# frozen_string_literal: true

class Pm < Formula
  desc "Bidirectional photo syndication around a canonical on-disk archive"
  homepage "https://github.com/danhorst/photo-management"
  url "https://github.com/danhorst/photo-management/archive/refs/tags/v0.5.1.tar.gz"
  version "0.5.1"
  sha256 "5019615a0a9ca81e889b9fd6b111bc29d7e940e764a1d0594fc0b3589e865101"
  license "MIT"

  depends_on "go" => :build
  depends_on "exiftool"

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=#{version}", output: bin/"pm"), "./cmd/pm"
  end

  def caveats
    <<~EOS
      `pm publish` and `pm pull` require osxphotos, which isn't packaged for
      Homebrew:
        pipx install osxphotos
    EOS
  end

  test do
    assert_predicate bin/"pm", :executable?
  end
end
