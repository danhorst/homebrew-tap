# typed: false
# frozen_string_literal: true

class Wrk < Formula
  desc "Jump to a git project and create or attach a tmux session"
  homepage "https://github.com/danhorst/wrk"
  url "https://github.com/danhorst/wrk/archive/refs/tags/v1.2.1.tar.gz"
  sha256 "983af6c3cad26bfefe8a84c077596d0cd81fa9e466a35c10ab3cf63ec1c00628"
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
