# typed: false
# frozen_string_literal: true

class Wrk < Formula
  desc "Jump to a git project and create or attach a tmux session"
  homepage "https://github.com/danhorst/wrk"
  url "https://github.com/danhorst/wrk/archive/refs/tags/v1.2.0.tar.gz"
  sha256 "fb561bb00017dcf12c52167e57a595208a2d944060c81946f2e4d74be637566c"
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
