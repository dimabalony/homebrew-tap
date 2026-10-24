class Undead < Formula
  desc "Brings Claude Code and Codex sessions back after quitting your terminal or rebooting"
  homepage "https://github.com/dimabalony/undead-ai-sessions"
  url "https://github.com/dimabalony/undead-ai-sessions/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "90dee6a91613395d76a78b35a8f95156fe7c67eaa5247e2f22e4b13aaa551b5a"
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
