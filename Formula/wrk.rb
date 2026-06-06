# typed: false
# frozen_string_literal: true

class Wrk < Formula
  desc "Jump to a git project and create or attach a tmux session"
  homepage "https://github.com/danhorst/wrk"
  url "https://github.com/danhorst/wrk/archive/refs/tags/v1.6.1.tar.gz"
  sha256 "ee60f69ebf459038fc6a2a04e6a82f4fb0ea5e4bc21a36f9ca8e2be102979ed6"
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
