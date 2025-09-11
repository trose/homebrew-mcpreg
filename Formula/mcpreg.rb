class Mcpreg < Formula
  desc "Pleasant-to-use command-line tool for the MCP Registry"
  homepage "https://github.com/trose/mcp-registry-cli"
  url "https://github.com/trose/mcp-registry-cli/archive/refs/tags/v0.2.2.tar.gz"
  sha256 "19444fd969d337d107a06556a7e4f9aaaa77a3a27faf2220513e91c5a4b24e7c"
  license "MIT"
  head "https://github.com/trose/mcp-registry-cli.git", branch: "main"

  depends_on "jq"

  def install
    bin.install "src/mcpreg"
  end

  test do
    # Test basic functionality
    assert_match "MCP Registry CLI", shell_output("#{bin}/mcpreg --help")
    assert_match "version 0.2.2", shell_output("#{bin}/mcpreg --version")
    # Test that it can run without errors
    system bin/"mcpreg", "commands"
  end
end
