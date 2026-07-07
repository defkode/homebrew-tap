class Orbx < Formula
  desc "Per-project OrbStack sandboxes for Rails + Claude Code (and any template)"
  homepage "https://github.com/defkode/orbx"
  url "https://github.com/defkode/orbx/archive/refs/tags/v0.1.4.tar.gz"
  sha256 "6c140879d3c71b718b4ab0db01a91deaf7556743e39480bc99dea032f3a929ae"
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
