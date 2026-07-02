# typed: false
# frozen_string_literal: true

class Pm < Formula
  desc "Bidirectional photo syndication for a canonical, on-disk archive"
  homepage "https://github.com/danhorst/photo-management"
  url "https://github.com/danhorst/photo-management/archive/refs/tags/v0.6.0.tar.gz"
  version "0.6.0"
  sha256 "f13d0d42dd6235a97764083aab7bc75328e151457d96f7fbd41f577cb3fd83ac"
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
