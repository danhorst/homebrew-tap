# typed: false
# frozen_string_literal: true

class Pm < Formula
  desc "Bidirectional photo syndication for a canonical, on-disk archive"
  homepage "https://github.com/danhorst/photo-management"
  url "https://github.com/danhorst/photo-management/archive/refs/tags/v0.8.0.tar.gz"
  version "0.8.0"
  sha256 "54afb634c53a1eda9c454cf2c1ca17c73faaf175768c63f2c021309f472b6fa2"
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
