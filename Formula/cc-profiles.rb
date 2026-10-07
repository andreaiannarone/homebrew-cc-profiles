class CcProfiles < Formula
  include Language::Python::Virtualenv

  desc "Local web UI to manage multiple Claude Code profiles"
  homepage "https://github.com/andreaiannarone/cc-profiles"
  url "https://files.pythonhosted.org/packages/33/36/dac52567ed77665f4d294a29ce23f337f7e86c5590100446f2a190a32524/cc_profiles-0.5.0.tar.gz"
  sha256 "bb5792985f852b53d33aa6c3b99cbbb24b1d3b267b41f0fdc8f31ff927d66753"
  license "GPL-3.0-or-later"

  depends_on "python-setuptools" => :build  # the sdist builds with setuptools; Homebrew builds without isolation
  depends_on "python@3.13"

  def install
    virtualenv_install_with_resources
  end

  def caveats
    <<~EOS
      Open it with: cc-profiles open
      Add /cc-profiles to Claude Code with: cc-profiles install-command
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cc-profiles --version")
  end
end
