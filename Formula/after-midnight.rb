# typed: false
# frozen_string_literal: true

class AfterMidnight < Formula
  desc "Preserve your night vision while using macOS"
  homepage "https://github.com/danhorst/after-midnight"
  license "MIT"

  url "https://github.com/danhorst/after-midnight/archive/refs/tags/v0.2.1.tar.gz"
  version "0.2.1"
  sha256 "317faa07ca47d3093e94f322062c55c709aa2aad404fcda60cb416d6dde940a9"

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
