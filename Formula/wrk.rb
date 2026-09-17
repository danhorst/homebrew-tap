# typed: false
# frozen_string_literal: true

class Wrk < Formula
  desc "Jump to a git project and create or attach a tmux session"
  homepage "https://github.com/danhorst/wrk"
  url "https://github.com/danhorst/wrk/archive/refs/tags/v2.5.1.tar.gz"
  sha256 "1bd8d27f08f2d3b36d75ec5894f8b1a5c6dbaad12107a82b5048e56d83a20426"
  license "MIT"

  depends_on "fzf"
  depends_on "jq"
  depends_on "tmux"
  depends_on "tree"

  def install
    bin.install "wrk"
  end

  test do
    assert_predicate bin/"wrk", :executable?
  end
end
