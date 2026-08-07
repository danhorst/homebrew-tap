# typed: false
# frozen_string_literal: true

class Wrk < Formula
  desc "Jump to a git project and create or attach a tmux session"
  homepage "https://github.com/danhorst/wrk"
  url "https://github.com/danhorst/wrk/archive/refs/tags/v2.2.0.tar.gz"
  sha256 "9fb5919c0bd500306e74788ac38991b731ba8049c37aeea30c0889d0cc25aeec"
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
