# typed: false
# frozen_string_literal: true

class MdTools < Formula
  desc "Command-line tools for working with Markdown files"
  homepage "https://github.com/danhorst/md-tools"
  license "MIT"

  url "https://github.com/danhorst/md-tools/archive/refs/tags/v1.0.6.tar.gz"
  version "1.0.6"
  sha256 "8143a265f4027f62a10643d4e2cca468596d8b83cfb3a2488d6256473d6c8dc6"

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
