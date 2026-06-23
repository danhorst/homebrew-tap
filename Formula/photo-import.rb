# typed: false
# frozen_string_literal: true

class PhotoImport < Formula
  desc "Fast, deduplicating photo importer for a Capture One library"
  homepage "https://github.com/danhorst/photo-import"
  url "https://github.com/danhorst/photo-import/archive/refs/tags/v0.2.0.tar.gz"
  version "0.2.0"
  sha256 "0fa7873bddd5d2d24c948ae247c719fcf03a2287b20ca65cca61992756cc8a18"
  license "MIT"

  depends_on "go" => :build
  depends_on "exiftool"

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=#{version}", output: bin/"photo-import"), "./cmd/photo-import"
  end

  test do
    assert_predicate bin/"photo-import", :executable?
  end
end
