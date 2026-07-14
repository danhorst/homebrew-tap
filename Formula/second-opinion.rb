# typed: false
# frozen_string_literal: true

class SecondOpinion < Formula
  desc "Adversarial second opinion on a document or diff from another model"
  homepage "https://github.com/danhorst/second-opinion"
  url "https://github.com/danhorst/second-opinion/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "2a934292f9586f68ce8a1d8a37faa200b35fdfea9f9d31c0b98c895180e75af4"
  license "MIT-0"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(output: bin/"second-opinion"), "./cmd/second-opinion"
  end

  test do
    assert_predicate bin/"second-opinion", :executable?
  end
end
