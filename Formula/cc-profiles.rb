class CcProfiles < Formula
  include Language::Python::Virtualenv

  desc "Local web UI to manage multiple Claude Code profiles"
  homepage "https://github.com/andreaiannarone/cc-profiles"
  url "https://files.pythonhosted.org/packages/ca/26/8431e511bbcc002de82e91da2f0699b4c2906c11ff26d92d592535029e09/cc_profiles-0.5.1.tar.gz"
  sha256 "cd3041d4f178bfa536f28991722a74f522abdd12537cba3f497522dd81f746b3"
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
