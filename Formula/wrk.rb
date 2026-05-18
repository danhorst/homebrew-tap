# typed: false
# frozen_string_literal: true

class Wrk < Formula
  desc "Jump to a git project and create or attach a tmux session"
  homepage "https://github.com/danhorst/wrk"
  url "https://github.com/danhorst/wrk/archive/refs/tags/v1.5.2.tar.gz"
  sha256 "a32f6e59fd16276eeae738b928a5a53fcd3d0c432886ce5cb86b1b725a5b19ab"
  license "MIT"

  bottle do
    root_url "https://github.com/danhorst/homebrew-tap/releases/download/wrk-1.5.2"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "e996af51eeedb8115653466eea62b656f661aadb060a4b3cf0ed77f803a6168e"
  end

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
