class CcProfiles < Formula
  include Language::Python::Virtualenv

  desc "Local web UI to manage multiple Claude Code profiles"
  homepage "https://github.com/andreaiannarone/cc-profiles"
  url "https://files.pythonhosted.org/packages/84/7d/6e26c85cf7f6724f8a999ea969d17654ed2533c81b3341398fe8a8e6fd1f/cc_profiles-0.6.6.tar.gz"
  sha256 "f77e2fd638fba74f762521a895628b6dbf4a351f69e3dae84a93d23f099bc39e"
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
