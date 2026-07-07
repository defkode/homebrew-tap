class Orbx < Formula
  desc "Per-project OrbStack sandboxes for Rails + Claude Code (and any template)"
  homepage "https://github.com/defkode/orbx"
  url "https://github.com/defkode/orbx/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "ef7ad5b70cbca0935b40587702be2da109bc90399d344c50d698b78a2a8fad18"
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
