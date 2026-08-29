# typed: false
# frozen_string_literal: true

class Wrk < Formula
  desc "Jump to a git project and create or attach a tmux session"
  homepage "https://github.com/danhorst/wrk"
  url "https://github.com/danhorst/wrk/archive/refs/tags/v2.4.0.tar.gz"
  sha256 "e4d37ebd7b14ca9220f603f0b980187827581cb904588c4fe2066e466c452cc7"
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
