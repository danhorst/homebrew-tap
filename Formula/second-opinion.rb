# typed: false
# frozen_string_literal: true

class SecondOpinion < Formula
  desc "Adversarial second opinion on a document or diff from another model"
  homepage "https://github.com/danhorst/second-opinion"
  url "https://github.com/danhorst/second-opinion/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "1593e2a7b90b868e409e224942d423799695f30ccebd24ef1734cd271a197da6"
  license "MIT-0"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(output: bin/"second-opinion"), "./cmd/second-opinion"
  end

  test do
    assert_predicate bin/"second-opinion", :executable?
  end
end
