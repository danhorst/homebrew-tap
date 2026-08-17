# typed: false
# frozen_string_literal: true

class MdTools < Formula
  desc "Command-line tools for working with Markdown files"
  homepage "https://github.com/danhorst/md-tools"
  url "https://github.com/danhorst/md-tools/archive/refs/tags/v1.2.0.tar.gz"
  sha256 "e65a081a79f726b20333cf8e5ef4dbbdb5cb4c98eed78aba54808b66b46e5db9"
  license "MIT-0"

  depends_on "go" => :build

  def install
    %w[mdfnt mdfootnote mdhtml mdinline mdjoin mdref mdsplit mdsidenote mdtable mdunwrap mdwrap].each do |cmd|
      system "go", "build", *std_go_args(output: bin/cmd), "./cmd/#{cmd}"
    end
  end

  test do
    assert_predicate bin/"mdref", :executable?
  end
end
