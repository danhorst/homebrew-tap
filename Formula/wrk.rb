# typed: false
# frozen_string_literal: true

class Wrk < Formula
  desc "Jump to a git project and create or attach a tmux session"
  homepage "https://github.com/danhorst/wrk"
  url "https://github.com/danhorst/wrk/archive/refs/tags/v2.1.1.tar.gz"
  sha256 "00908ed4e58d4bea09f6835f16b0cfda781b4e53700e6e6446a8207ffcb02b4e"
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
