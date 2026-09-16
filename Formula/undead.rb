class Undead < Formula
  desc "Brings Claude Code and Codex sessions back after quitting your terminal or rebooting"
  homepage "https://github.com/dimabalony/undead-ai-sessions"
  url "https://github.com/dimabalony/undead-ai-sessions/archive/refs/tags/v0.3.4.tar.gz"
  sha256 "885b1df9db2440d6988ce4966d50d41b3b732da97daeb44f1d0050a982dbb202"
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
