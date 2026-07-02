# typed: false
# frozen_string_literal: true

class Pm < Formula
  desc "Bidirectional photo syndication for a canonical, on-disk archive"
  homepage "https://github.com/danhorst/photo-management"
  url "https://github.com/danhorst/photo-management/archive/refs/tags/v0.7.0.tar.gz"
  version "0.7.0"
  sha256 "0615a3bbcb98e48a45764b448aa6f51072a9841bc32d979aa03a0aa44cc26163"
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
