# typed: false
# frozen_string_literal: true

class Pm < Formula
  desc "Bidirectional photo syndication for a canonical, on-disk archive"
  homepage "https://github.com/danhorst/photo-management"
  url "https://github.com/danhorst/photo-management/archive/refs/tags/v0.8.1.tar.gz"
  version "0.8.1"
  sha256 "e8cf1d519327e0ff97facd9093f72a3cecaf28221f03aab845edb1c3556dd52d"
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
