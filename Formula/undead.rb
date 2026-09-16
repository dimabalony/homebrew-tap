class Undead < Formula
  desc "Brings Claude Code and Codex sessions back after quitting your terminal or rebooting"
  homepage "https://github.com/dimabalony/undead-ai-sessions"
  url "https://github.com/dimabalony/undead-ai-sessions/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "1f2c7a9808c79f6093abfdd33eff0caf8257b322ff0fa1ab8ebe00d092fcafab"
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
