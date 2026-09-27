class Fundeploy < Formula
  desc "Bash tools for local development and service management"
  homepage "https://github.com/farfarfun/fundeploy"
  url "https://github.com/farfarfun/fundeploy/archive/refs/tags/v0.1.17.tar.gz"
  sha256 "60ae1c8a04e886f5a65fda9f39ae08d3141e3cba7c45461177010e4113f7569f"
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
