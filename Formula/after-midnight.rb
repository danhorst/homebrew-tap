# typed: false
# frozen_string_literal: true

class AfterMidnight < Formula
  desc "Preserve your night vision while using macOS"
  homepage "https://github.com/danhorst/after-midnight"
  license "MIT"

  url "https://github.com/danhorst/after-midnight/archive/refs/tags/v0.2.2.tar.gz"
  version "0.2.2"
  sha256 "48c7df5fc372ba828dfeb5238a2dfc1b1b83f50ca9a8cbf2dd326cd5a54387b8"

  depends_on :macos => :ventura
  depends_on xcode: ["15.0", :build]

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/am"
  end

  test do
    assert_predicate bin/"am", :executable?
  end
end
