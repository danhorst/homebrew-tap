# typed: false
# frozen_string_literal: true

class AfterMidnight < Formula
  desc "Preserve your night vision while using macOS"
  homepage "https://github.com/danhorst/after-midnight"
  url "https://github.com/danhorst/after-midnight/archive/refs/tags/v0.2.7.tar.gz"
  sha256 "2f4a5f6a7e1dd9639d49b353d68d2b900c0ca69bfa05786f3e2934b5c5ae7124"
  license "MIT"

  depends_on xcode: ["15.0", :build]
  depends_on macos: :ventura

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/am"
  end

  test do
    assert_predicate bin/"am", :executable?
  end
end
