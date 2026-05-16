# typed: false
# frozen_string_literal: true

class AfterMidnight < Formula
  desc "Preserve your night vision while using macOS"
  homepage "https://github.com/danhorst/after-midnight"
  license "MIT"

  url "https://github.com/danhorst/after-midnight/archive/refs/tags/v0.2.5.tar.gz"
  version "0.2.5"
  sha256 "fbe66669ba0a4916830a2f62e5e10d8f6aabc225a9b43094c95ac2969bb8a435"

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
