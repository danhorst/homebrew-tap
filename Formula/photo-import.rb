# typed: false
# frozen_string_literal: true

class PhotoImport < Formula
  desc "Fast, deduplicating photo importer for a Capture One library"
  homepage "https://github.com/danhorst/photo-import"
  url "https://github.com/danhorst/photo-import/archive/refs/tags/v0.4.0.tar.gz"
  version "0.4.0"
  sha256 "4111ceb68bf60ddca9b875e0c708932c6192ee7a9c52a0a4b9509d6662f3a061"
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
