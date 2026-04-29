# typed: false
# frozen_string_literal: true

class Wrk < Formula
  desc "Jump to a git project and create or attach a tmux session"
  homepage "https://github.com/danhorst/wrk"
  url "https://github.com/danhorst/wrk/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "b698f1c957dac2c99e063980edccb8145b222f41fe5b6cbb2e1395b7fdfc2fc0"
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
