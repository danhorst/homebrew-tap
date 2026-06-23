# typed: false
# frozen_string_literal: true

class PhotoImport < Formula
  desc "Fast, deduplicating photo importer for a Capture One library"
  homepage "https://github.com/danhorst/photo-import"
  url "https://github.com/danhorst/photo-import/archive/refs/tags/v0.3.0.tar.gz"
  version "0.3.0"
  sha256 "c9850b45b7b931b2a5ba491a2d2ca6fda8ee97e11543516f3f8998ff5ded35cf"
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
