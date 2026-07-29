class Nltdeploy < Formula
  desc "Bash tools for local development and service management"
  homepage "https://github.com/farfarfun/nltdeploy"
  url "https://github.com/farfarfun/nltdeploy/archive/refs/tags/v0.1.7.tar.gz"
  sha256 "b9b9320aed92951da9b5fff7b3914741217e5806352a16077ad65b850310924e"
  license "MIT"

  def install
    system "env",
           "NLTDEPLOY_ROOT=#{prefix}",
           "NLTDEPLOY_WRAPPER_ROOT=#{opt_prefix}",
           "NLTDEPLOY_PACKAGE_MANAGER=brew",
           "NLTDEPLOY_SKIP_GIT_PULL=1",
           "NLTDEPLOY_SKIP_PROFILE_HINT=1",
           "/bin/bash", "install.sh", "install"
  end

  test do
    assert_match "service", shell_output("#{bin}/nltdeploy list")
    assert_match "brew upgrade nltdeploy", shell_output("#{bin}/nltdeploy upgrade")
  end
end
