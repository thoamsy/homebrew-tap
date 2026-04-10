class ClaudeSounds < Formula
  desc "Sound themes for Claude Code"
  homepage "https://github.com/thoamsy/claude-sounds"
  url "https://github.com/thoamsy/claude-sounds.git", tag: "v0.2.0"
  license "MIT"

  depends_on "oven-sh/bun/bun"

  def install
    system "bun", "install"
    libexec.install "index.ts", "src", "node_modules", "package.json"
    (bin/"claude-sounds").write_env_script libexec/"index.ts",
      PATH: "#{Formula["oven-sh/bun/bun"].opt_bin}:${PATH}"
  end

  def caveats
    <<~EOS
      Run 'claude-sounds init' to set up sound hooks in Claude Code.
      Import a theme: claude-sounds import theme.zip
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/claude-sounds --version").strip
  end
end
