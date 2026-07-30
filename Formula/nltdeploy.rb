class Nltdeploy < Formula
  desc "Bash tools for local development and service management"
  homepage "https://github.com/farfarfun/nltdeploy"
  url "https://github.com/farfarfun/nltdeploy/archive/refs/tags/v0.1.10.tar.gz"
  sha256 "31d907011a5087c39fc20e4c7a8257633f087d6d4d22bab0d2e9722768b8ba59"
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
