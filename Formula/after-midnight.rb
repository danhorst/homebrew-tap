# typed: false
# frozen_string_literal: true

class AfterMidnight < Formula
  desc "Preserve your night vision while using macOS"
  homepage "https://github.com/danhorst/after-midnight"
  license "MIT"

  url "https://github.com/danhorst/after-midnight/archive/refs/tags/v0.2.6.tar.gz"
  version "0.2.6"
  sha256 "cba790278abf3a3d763f873b1788e7aedb0d3cfe77993498b8680d0c1523c4ac"

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
