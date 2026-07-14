# typed: false
# frozen_string_literal: true

class MdTools < Formula
  desc "Command-line tools for working with Markdown files"
  homepage "https://github.com/danhorst/md-tools"
  url "https://github.com/danhorst/md-tools/archive/refs/tags/v1.1.5.tar.gz"
  sha256 "f726b53a7e15d5d9ee4d427a6872e7808fd88c8b3a723186f131f54181d8f65b"
  license "MIT-0"

  depends_on "go" => :build

  def install
    %w[mdfnt mdfootnote mdinline mdjoin mdref mdsplit mdsidenote mdtable mdunwrap mdwrap].each do |cmd|
      system "go", "build", *std_go_args(output: bin/cmd), "./cmd/#{cmd}"
    end
  end

  test do
    assert_predicate bin/"mdref", :executable?
  end
end
