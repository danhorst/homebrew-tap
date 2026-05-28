# typed: false
# frozen_string_literal: true

class MdTools < Formula
  desc "Command-line tools for working with Markdown files"
  homepage "https://github.com/danhorst/md-tools"
  license "MIT"

  url "https://github.com/danhorst/md-tools/archive/refs/tags/v1.0.5.tar.gz"
  version "1.0.5"
  sha256 "188c9c19e6d91dbe8ec554845982635b160218ca84cb644b421083069e5559c0"

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
