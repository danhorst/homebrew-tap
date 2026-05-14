# typed: false
# frozen_string_literal: true

class AfterMidnight < Formula
  desc "Preserve your night vision while using macOS"
  homepage "https://github.com/danhorst/after-midnight"
  license "MIT"

  url "https://github.com/danhorst/after-midnight/archive/refs/tags/v0.1.0.tar.gz"
  version "0.1.0"
  sha256 "2014a76e36d328bea35e293a57f774832a063f014145c99c66bb0ad08ba8b26b"

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
