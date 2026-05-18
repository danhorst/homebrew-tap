# typed: false
# frozen_string_literal: true

class Wrk < Formula
  desc "Jump to a git project and create or attach a tmux session"
  homepage "https://github.com/danhorst/wrk"
  url "https://github.com/danhorst/wrk/archive/refs/tags/v1.5.3.tar.gz"
  sha256 "489e6f0c5599e6f2abbb611e6801fdce115a01089d07b84f1f4661810357619a"
  license "MIT"

  bottle do
    root_url "https://github.com/danhorst/homebrew-tap/releases/download/wrk-1.5.3"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "1998b9bcc1750aee64cf2a29ed8f2dfd00d263ad861b12d17c828edb5839c924"
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
