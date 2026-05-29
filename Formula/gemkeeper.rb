# typed: false
# frozen_string_literal: true

class Gemkeeper < Formula
  desc "Manage offline development with private gem dependencies"
  homepage "https://github.com/danhorst/gemkeeper"
  url "https://rubygems.org/downloads/gemkeeper-0.8.1.gem"
  sha256 "49a29944264b07a92fb497f831a7bfae0c8031c1ddc589c848c66772445cda78"
  license "MIT"

  depends_on "ruby"

  def install
    ENV["GEM_HOME"] = libexec
    system "gem", "install", "--no-document", cached_download
    bin.install Dir[libexec/"bin/*"]
    bin.env_script_all_files(libexec/"bin", GEM_HOME: libexec)
  end

  service do
    run [opt_bin/"gemkeeper", "server", "start", "--foreground"]
    keep_alive true
    working_dir var/"gemkeeper"
    log_path var/"log/gemkeeper.log"
    error_log_path var/"log/gemkeeper.log"
  end

  def post_install
    (var/"gemkeeper").mkpath
    (var/"log").mkpath
    ENV["GEM_HOME"] = libexec
    system "gem", "pristine", "--extensions"
  end

  def caveats
    <<~EOS
      To configure gemkeeper, create a config file at one of:
        #{etc}/gemkeeper.yml
        ~/.config/gemkeeper/config.yml
        ~/.gemkeeper.yml

      Example configuration:
        port: 9292
        repos_path: #{var}/gemkeeper/repos
        gems_path: #{var}/gemkeeper/gems

        gems:
          - repo: git@github.com:company/internal-gem.git
            version: latest

      To start the service:
        brew services start gemkeeper
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gemkeeper version")
  end
end
