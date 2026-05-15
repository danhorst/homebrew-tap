# typed: false
# frozen_string_literal: true

class Wrk < Formula
  desc "Jump to a git project and create or attach a tmux session"
  homepage "https://github.com/danhorst/wrk"
  url "https://github.com/danhorst/wrk/archive/refs/tags/v1.4.0.tar.gz"
  sha256 "3a717626e729b106bbfba01fa726a34eff0b246c6fb4b57cd51beb24503ea00e"
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
