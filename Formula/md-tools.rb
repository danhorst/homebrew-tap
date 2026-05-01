# typed: false
# frozen_string_literal: true

class MdTools < Formula
  desc "Command-line tools for working with Markdown files"
  homepage "https://github.com/danhorst/md-tools"
  license "MIT"

  url "https://github.com/danhorst/md-tools/archive/refs/tags/v1.0.2.tar.gz"
  version "1.0.2"
  sha256 "e9ce3b01d4788b85a7de2a62183f3762c0d74cb4e925d82f11a49e278b73b1d2"

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
