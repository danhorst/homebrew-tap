# typed: false
# frozen_string_literal: true

class MdTools < Formula
  desc "Command-line tools for working with Markdown files"
  homepage "https://github.com/danhorst/md-tools"
  license "MIT"

  url "https://github.com/danhorst/md-tools/archive/refs/tags/v1.0.4.tar.gz"
  version "1.0.4"
  sha256 "eb4adfe62ab83c78985cfac557c4ec1c747da7c73164d8dfe84823930b10c547"

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
