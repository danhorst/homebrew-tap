# typed: false
# frozen_string_literal: true

class Wrk < Formula
  desc "Jump to a git project and create or attach a tmux session"
  homepage "https://github.com/danhorst/wrk"
  url "https://github.com/danhorst/wrk/archive/refs/tags/v1.5.1.tar.gz"
  sha256 "746cbb95a2d59d2d4ef70ae847b5e75e7bd0f41204ab36389a8436de60d703d1"
  license "MIT"

  bottle do
    root_url "https://github.com/danhorst/homebrew-tap/releases/download/wrk-1.5.1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "010399050d2cee455083adee039f9d8cc2715cacc853a23ba9303359afddb8d1"
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
