class Undead < Formula
  desc "Brings Claude Code and Codex sessions back after quitting your terminal or rebooting"
  homepage "https://github.com/dimabalony/undead-ai-sessions"
  url "https://github.com/dimabalony/undead-ai-sessions/archive/refs/tags/v0.3.5.tar.gz"
  sha256 "b5b414458a30a9b9395ee96f03ca2366e783e154b1f9b44f55837283f21c0707"
  license "MIT"

  depends_on :macos

  def install
    libexec.install "bin", "lib"
    bin.install_symlink libexec/"bin/undead"
  end

  def caveats
    <<~EOS
      Finish the setup (adds hooks to Claude Code and Codex, and one block to ~/.zshrc):
        undead install
      Then open a new terminal tab. Check everything with: undead doctor
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/undead version")
  end
end
