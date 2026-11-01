class CcProfiles < Formula
  include Language::Python::Virtualenv

  desc "Local web UI to manage multiple Claude Code profiles"
  homepage "https://github.com/andreaiannarone/cc-profiles"
  url "https://files.pythonhosted.org/packages/7b/28/4e59c6595a7affe9f76e4678c259f7ec2901547f81587dc7292e82c92258/cc_profiles-0.6.5.tar.gz"
  sha256 "35e94b71976aa207f9b8f2272d0b5859afbf36d040e189082c662503936133b2"
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
