class CcProfiles < Formula
  include Language::Python::Virtualenv

  desc "Local web UI to manage multiple Claude Code profiles"
  homepage "https://github.com/andreaiannarone/cc-profiles"
  url "https://files.pythonhosted.org/packages/7c/b4/52b0a370b9f25e39514baaee6d340d75fb37d0c87b8448350accab90ca16/cc_profiles-0.6.7.tar.gz"
  sha256 "784626734d3c9cf4e91c275c8ff0621f0292c506a98d02661aa0f10f8a53394f"
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
