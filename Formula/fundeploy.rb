class Fundeploy < Formula
  desc "Bash tools for local development and service management"
  homepage "https://github.com/farfarfun/fundeploy"
  url "https://github.com/farfarfun/fundeploy/archive/refs/tags/v0.1.15.tar.gz"
  sha256 "9c0798131b8bba4573902059e080ec9a5c2f4849dab86009651d8f10aa044354"
  license "MIT"

  def install
    system "env",
           "FUNDEPLOY_ROOT=#{prefix}",
           "FUNDEPLOY_WRAPPER_ROOT=#{opt_prefix}",
           "FUNDEPLOY_PACKAGE_MANAGER=brew",
           "FUNDEPLOY_SKIP_GIT_PULL=1",
           "FUNDEPLOY_SKIP_PROFILE_HINT=1",
           "/bin/bash", "install.sh", "install"
  end

  test do
    assert_match "service", shell_output("#{bin}/fundeploy list")
    assert_match "brew upgrade fundeploy", shell_output("#{bin}/fundeploy upgrade")
  end
end
