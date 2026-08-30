class Orbx < Formula
  desc "Per-project OrbStack sandboxes for Rails + Claude Code (and any template)"
  homepage "https://github.com/defkode/orbx"
  url "https://github.com/defkode/orbx/archive/refs/tags/v0.1.8.tar.gz"
  sha256 "1a5e44a7f7c7029ba334d7e03f9609cfb048d2edbf7d05c0b1fe3ac381d8448b"
  license "MIT"

  depends_on "bash" # orbx uses bash >= 4 features; macOS ships 3.2

  def install
    bin.install "bin/orbx"
    (pkgshare/"templates").install Dir["templates/*.yaml"]
    inreplace bin/"orbx", "@TEMPLATE_DIR@", "#{opt_pkgshare}/templates"
  end

  test do
    assert_match "orbx #{version}", shell_output("#{bin}/orbx --version")
  end
end
