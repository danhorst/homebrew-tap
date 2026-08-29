# typed: false
# frozen_string_literal: true

class MdTools < Formula
  desc "Command-line tools for working with Markdown files"
  homepage "https://github.com/danhorst/md-tools"
  url "https://github.com/danhorst/md-tools/archive/refs/tags/v1.2.1.tar.gz"
  sha256 "db287b26f9b738588d9f6f790320a57f8cf1791d230a2f585d1db55ec1f6e160"
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
