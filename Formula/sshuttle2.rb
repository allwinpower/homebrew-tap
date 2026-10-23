# Made from packaging/homebrew/sshuttle2.rb.in in allwinpower/sshuttle2 by
# its release workflow. Changes here are overwritten by the next release.
class Sshuttle2 < Formula
  desc "VPN over a plain SSH login"
  homepage "https://github.com/allwinpower/sshuttle2"
  license "LGPL-2.1-or-later"

  # The version comes from the URLs.
  on_macos do
    on_arm do
      url "https://github.com/allwinpower/sshuttle2/releases/download/v0.1.0/sshuttle2-0.1.0-macos-arm64.tar.gz"
      sha256 "342cbe2e40f316944758dde923d6d368846a5f12f0a5a8e78ea3b1ecf95eddb6"
    end
    on_intel do
      url "https://github.com/allwinpower/sshuttle2/releases/download/v0.1.0/sshuttle2-0.1.0-macos-amd64.tar.gz"
      sha256 "32e5a5bc86d2371f1a82390d69b42d1dbf256189cb36f3388b610a57e450875a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/allwinpower/sshuttle2/releases/download/v0.1.0/sshuttle2-0.1.0-linux-arm64.tar.gz"
      sha256 "1a73fcaab8d95b0755c60455d09e9f3e3c84670d5fe129765038a8add2e80771"
    end
    on_intel do
      url "https://github.com/allwinpower/sshuttle2/releases/download/v0.1.0/sshuttle2-0.1.0-linux-amd64.tar.gz"
      sha256 "13c534e2eddd1864414cbcf94c2e2e6064369327f19da4da51f4c00ce5870a7e"
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
