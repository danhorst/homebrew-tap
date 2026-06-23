# typed: false
# frozen_string_literal: true

class PhotoImport < Formula
  desc "Fast, deduplicating photo importer for a Capture One library"
  homepage "https://github.com/danhorst/photo-import"
  url "https://github.com/danhorst/photo-import/archive/refs/tags/v0.1.0.tar.gz"
  version "0.1.0"
  sha256 "2056b38436303f7f5d084bc60d5832cf4a3bcd8409314e2cd6e500d1736d823c"
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
