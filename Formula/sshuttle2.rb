# Made from packaging/homebrew/sshuttle2.rb.in in allwinpower/sshuttle2 by
# its release workflow. Changes here are overwritten by the next release.
class Sshuttle2 < Formula
  desc "VPN over a plain SSH login"
  homepage "https://github.com/allwinpower/sshuttle2"
  license "LGPL-2.1-or-later"

  # The version comes from the URLs.
  on_macos do
    on_arm do
      url "https://github.com/allwinpower/sshuttle2/releases/download/v0.3.1/sshuttle2-0.3.1-macos-arm64.tar.gz"
      sha256 "1ffdfeaf9e866a3db32994cde9c43e1d5e6bb5189f89b7a37f54cb78aa4ba4e2"
    end
    on_intel do
      url "https://github.com/allwinpower/sshuttle2/releases/download/v0.3.1/sshuttle2-0.3.1-macos-amd64.tar.gz"
      sha256 "1c948928225e0f43cdd4ccd3ab210be96926bfb034e33a25f41f5210273d6d88"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/allwinpower/sshuttle2/releases/download/v0.3.1/sshuttle2-0.3.1-linux-arm64.tar.gz"
      sha256 "012b7751de058a582b3840271c7d01b09db99ed4cbac3b5139775085cae5b38f"
    end
    on_intel do
      url "https://github.com/allwinpower/sshuttle2/releases/download/v0.3.1/sshuttle2-0.3.1-linux-amd64.tar.gz"
      sha256 "345d7b047d26d9b31a642a6b62200f148c4c93e792592359fa864ca7c0035de0"
    end
  end

  def install
    bin.install "sshuttle2"
    man1.install "doc/sshuttle2.1"
    bash_completion.install "complete/sshuttle2.bash" => "sshuttle2"
    zsh_completion.install "complete/_sshuttle2"
    fish_completion.install "complete/sshuttle2.fish"
  end

  def caveats
    <<~EOS
      Routing traffic asks for your password, because the tun device, the
      routes and the firewall rules need root. A SOCKS5 proxy needs no root:
        sshuttle2 user@host --socks5 127.0.0.1:1080
      On Linux, nft mode needs the nft command (nftables).
    EOS
  end

  test do
    assert_match "sshuttle2 #{version}", shell_output("#{bin}/sshuttle2 --version")
  end
end
