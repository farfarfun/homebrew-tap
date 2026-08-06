class Nltdeploy < Formula
  desc "Bash tools for local development and service management"
  homepage "https://github.com/farfarfun/nltdeploy"
  url "https://github.com/farfarfun/nltdeploy/archive/refs/tags/v0.1.14.tar.gz"
  sha256 "de0fdff2b77abde250e9d01b3418cc99be8cb81a03d1f9dc03308bca25fad4be"
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
