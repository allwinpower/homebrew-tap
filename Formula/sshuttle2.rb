# Made from packaging/homebrew/sshuttle2.rb.in in allwinpower/sshuttle2 by
# its release workflow. Changes here are overwritten by the next release.
class Sshuttle2 < Formula
  desc "VPN over a plain SSH login"
  homepage "https://github.com/allwinpower/sshuttle2"
  license "LGPL-2.1-or-later"

  # The version comes from the URLs.
  on_macos do
    on_arm do
      url "https://github.com/allwinpower/sshuttle2/releases/download/v0.2.0/sshuttle2-0.2.0-macos-arm64.tar.gz"
      sha256 "83fb1e6794190315f995258a3a9d949f5922185af843ea129849ec2eb7186a8b"
    end
    on_intel do
      url "https://github.com/allwinpower/sshuttle2/releases/download/v0.2.0/sshuttle2-0.2.0-macos-amd64.tar.gz"
      sha256 "4b3d5c8c1ea01bda4a1125358bbc8ab228abb5dbbb51958449a9dcfe4ec1f2fb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/allwinpower/sshuttle2/releases/download/v0.2.0/sshuttle2-0.2.0-linux-arm64.tar.gz"
      sha256 "e807c9e3a081d187386443e0cc7987bce4eb58a2d252ac0322f6f3cef8190361"
    end
    on_intel do
      url "https://github.com/allwinpower/sshuttle2/releases/download/v0.2.0/sshuttle2-0.2.0-linux-amd64.tar.gz"
      sha256 "397685436f39608bf6208888d58dad19e51b9140fed24fd56c8b5e56d3b3cf57"
    end
  end

  def install
    bin.install "sshuttle2"
  end

  def caveats
    <<~EOS
      Routing traffic (pf, nft or tun mode) asks for your password, because
      the firewall rules need root. A SOCKS5 proxy needs no root:
        sshuttle2 -r user@host --socks5 127.0.0.1:1080
      On Linux, nft mode needs the system's nft command (package nftables).
    EOS
  end

  test do
    assert_match "sshuttle2 #{version}", shell_output("#{bin}/sshuttle2 --version")
  end
end
