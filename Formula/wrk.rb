# typed: false
# frozen_string_literal: true

class Wrk < Formula
  desc "Jump to a git project and create or attach a tmux session"
  homepage "https://github.com/danhorst/wrk"
  url "https://github.com/danhorst/wrk/archive/refs/tags/v2.3.0.tar.gz"
  sha256 "ec7c43ef18ea4f4b17a0743d0afed7206ad788537b0f4343a560bcb6ed75a1fa"
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
