# typed: false
# frozen_string_literal: true

class Wrk < Formula
  desc "Jump to a git project and create or attach a tmux session"
  homepage "https://github.com/danhorst/wrk"
  url "https://github.com/danhorst/wrk/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "d0f4d5a3ac34f5318e26d112ab3ec31ef345243713b3ce1ae54b0f85b98d226d"
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
