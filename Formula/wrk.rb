# typed: false
# frozen_string_literal: true

class Wrk < Formula
  desc "Jump to a git project and create or attach a tmux session"
  homepage "https://github.com/danhorst/wrk"
  url "https://github.com/danhorst/wrk/archive/refs/tags/v1.3.2.tar.gz"
  sha256 "4eb93addc505b71ed6ae5def8f68ba7dc987f12499c0079e707f7c29aa4eb2a0"
  license "MIT"

  depends_on "fzf"
  depends_on "tmux"
  depends_on "tree"

  def install
    bin.install "wrk"
  end

  test do
    assert_predicate bin/"wrk", :executable?
  end
end
