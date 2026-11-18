class Wechat2dot < Formula
  desc "Mirror your primary DOT room into your own WeChat"
  homepage "https://github.com/AndreLYL/wechat2dot"
  url "https://github.com/AndreLYL/wechat2dot/releases/download/v2.0.0a2/wechat2dot-2.0.0a2.tar.gz"
  sha256 "6b496cc4023cee03be15ab074e64304d0391c8e363e8009344e4cf9c8eec1e98"
  license "MIT"
  depends_on "uv"
  depends_on "python@3.12"

  def install
    system "uv", "venv", "--python", Formula["python@3.12"].opt_bin/"python3.12", libexec
    system "uv", "pip", "install", "--python", libexec/"bin/python", "."
    bin.install_symlink libexec/"bin/wechat2dot"
  end

  test do
    assert_match "2.0.0a2", shell_output("#{bin}/wechat2dot --version")
  end
end
