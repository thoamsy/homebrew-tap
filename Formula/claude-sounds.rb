class ClaudeSounds < Formula
  desc "Sound themes for Claude Code"
  homepage "https://github.com/thoamsy/claude-sounds"
  url "https://github.com/thoamsy/claude-sounds.git", tag: "v0.2.0"
  license "MIT"

  def install
    # Bun is often installed outside Homebrew (curl installer puts it in ~/.bun/bin)
    ENV.prepend_path "PATH", "#{Dir.home}/.bun/bin"

    odie "bun is required but not found. Install it: curl -fsSL https://bun.sh/install | bash" unless which("bun")

    system "bun", "install"
    libexec.install "index.ts", "src", "node_modules", "package.json"
    (bin/"claude-sounds").write_env_script libexec/"index.ts"
  end

  def caveats
    <<~EOS
      Run 'claude-sounds init' to set up sound hooks in Claude Code.
      Import a theme: claude-sounds import theme.zip
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/claude-sounds version").strip
  end
end
