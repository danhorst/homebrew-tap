# typed: false
# frozen_string_literal: true

class MdTools < Formula
  desc "Command-line tools for working with Markdown files"
  homepage "https://github.com/danhorst/md-tools"
  url "https://github.com/danhorst/md-tools/archive/refs/tags/v1.2.2.tar.gz"
  sha256 "a1b6f04055402e4111e9cb43f03d0e227dd200cc043b99b5aca21a7ea674a888"
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
