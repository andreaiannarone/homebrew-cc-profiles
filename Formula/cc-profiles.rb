class CcProfiles < Formula
  include Language::Python::Virtualenv

  desc "Local web UI to manage multiple Claude Code profiles"
  homepage "https://github.com/andreaiannarone/cc-profiles"
  url "https://files.pythonhosted.org/packages/45/d0/6344326b0e79991939eaf03e9d01a65d98a38b8f5aba70ed4d2faf75bfc6/cc_profiles-0.5.6.tar.gz"
  sha256 "a5cbcb52f0e6ec1938346f87d7f63dd331c557c5e6937488edfc30efe38cd861"
  license "GPL-3.0-or-later"

  depends_on "python-setuptools" => :build  # the sdist builds with setuptools; Homebrew builds without isolation
  depends_on "python@3.13"

  def install
    virtualenv_install_with_resources
  end

  def caveats
    <<~EOS
      Open it with: cc-profiles open
      Start it once and it adds /cc-profiles to Claude Code in every profile.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cc-profiles --version")
  end
end
