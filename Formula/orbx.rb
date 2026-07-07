class Orbx < Formula
  desc "Per-project OrbStack sandboxes for Rails + Claude Code (and any template)"
  homepage "https://github.com/defkode/orbx"
  url "https://github.com/defkode/orbx/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "1edb65c2a9a22572b5abc84046ae82bb282e7f7ab093ca5a9fb81be74d39ad10"
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
