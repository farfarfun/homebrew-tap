class Nltdeploy < Formula
  desc "Bash tools for local development and service management"
  homepage "https://github.com/farfarfun/nltdeploy"
  url "https://github.com/farfarfun/nltdeploy/archive/refs/tags/v0.1.15.tar.gz"
  sha256 "d83ea0b51b62f8f1d661f4a975f1e0dfe668379839527551d523ccf87824f7d4"
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
