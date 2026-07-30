class Nltdeploy < Formula
  desc "Bash tools for local development and service management"
  homepage "https://github.com/farfarfun/nltdeploy"
  url "https://github.com/farfarfun/nltdeploy/archive/refs/tags/v0.1.11.tar.gz"
  sha256 "4e95dd77f4640a54317dd43b6eb412d6447b6fe89f01bb9eac97cd8128b5963a"
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
