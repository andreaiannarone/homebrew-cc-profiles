class CcProfiles < Formula
  include Language::Python::Virtualenv

  desc "Local web UI to manage multiple Claude Code profiles"
  homepage "https://github.com/andreaiannarone/cc-profiles"
  url "https://files.pythonhosted.org/packages/47/99/60df76d5e39968d5a1d459d37dc17ce0da8a5f8ceeda21c804f6318696f6/cc_profiles-0.6.0.tar.gz"
  sha256 "59b0dcd75eb1c937cbeff107fa00c9c0a586cd14a5c8138e081fb3ee8c0b7959"
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
