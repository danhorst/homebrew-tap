# typed: false
# frozen_string_literal: true

class Pm < Formula
  desc "Bidirectional photo syndication for a canonical, on-disk archive"
  homepage "https://github.com/danhorst/photo-management"
  url "https://github.com/danhorst/photo-management/archive/refs/tags/v0.9.0.tar.gz"
  version "0.9.0"
  sha256 "66307a153b8c1fe8dc2c6eb4aa5e4421982c5f68fb3644f4fe34615c25dc5870"
  license "MIT"

  depends_on "go" => :build
  depends_on "exiftool"

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=#{version}", output: bin/"pm"), "./cmd/pm"
  end

  test do
    assert_predicate bin/"pm", :executable?
  end
end
