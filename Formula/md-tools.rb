# typed: false
# frozen_string_literal: true

class MdTools < Formula
  desc "Command-line tools for working with Markdown files"
  homepage "https://github.com/danhorst/md-tools"
  license "MIT"

  url "https://github.com/danhorst/md-tools/archive/refs/tags/v1.1.3.tar.gz"
  version "1.1.3"
  sha256 "4f9fd4a227c3aafb9fc9387670cdfcec6fa31b2b5bdb83c33a8ecb92608ea5a3"

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
