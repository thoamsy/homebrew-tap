class ClaudeSounds < Formula
  desc "Sound themes for Claude Code"
  homepage "https://github.com/thoamsy/claude-sounds"
  url "https://github.com/thoamsy/claude-sounds.git", tag: "v0.1.3"
  license "MIT"

  depends_on "oven-sh/bun/bun"

  def install
    system "bun", "install"
    system "bun", "build", "./index.ts", "--compile", "--outfile", bin/"claude-sounds"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/claude-sounds --version").strip
  end
end
