class Mcpreg < Formula
  desc "Pleasant-to-use command-line tool for the MCP Registry"
  homepage "https://github.com/trose/mcp-registry-cli"
  url "https://github.com/trose/mcp-registry-cli/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "5b0935d43e8a6b273ca8c79a6f8494f8e8447809e9927572f309d0fac622f097"
  license "MIT"
  head "https://github.com/trose/mcp-registry-cli.git", branch: "main"

  depends_on "jq"

  def install
    bin.install "src/mcpreg"
  end

  test do
    # Test basic functionality
    assert_match "MCP Registry CLI", shell_output("#{bin}/mcpreg --help")
    assert_match "version 0.2.1", shell_output("#{bin}/mcpreg --version")
    # Test that it can run without errors
    system bin/"mcpreg", "commands"
  end
end
