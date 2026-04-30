# typed: false
# frozen_string_literal: true

class Wrk < Formula
  desc "Jump to a git project and create or attach a tmux session"
  homepage "https://github.com/danhorst/wrk"
  url "https://github.com/danhorst/wrk/archive/refs/tags/v1.3.0.tar.gz"
  sha256 "3fb25b593fc64061dc0af14c2a31a781100c8abf73586cf52303e2b128e4cc97"
  license "MIT"

  depends_on "fzf"
  depends_on "tmux"

  def install
    bin.install "wrk"
  end

  test do
    assert_predicate bin/"wrk", :executable?
  end
end
