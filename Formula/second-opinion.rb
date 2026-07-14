# typed: false
# frozen_string_literal: true

class SecondOpinion < Formula
  desc "Adversarial second opinion on a document or diff from a model that didn't write it"
  homepage "https://github.com/danhorst/second-opinion"

  url "https://github.com/danhorst/second-opinion/archive/refs/tags/v0.1.0.tar.gz"
  version "0.1.0"
  sha256 "0000000000000000000000000000000000000000000000000000000000000"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(output: bin/"second-opinion"), "./cmd/second-opinion"
  end

  test do
    assert_predicate bin/"second-opinion", :executable?
  end
end
