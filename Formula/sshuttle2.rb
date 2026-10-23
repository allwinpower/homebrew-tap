# Made from packaging/homebrew/sshuttle2.rb.in in allwinpower/sshuttle2 by
# its release workflow. Changes here are overwritten by the next release.
class Sshuttle2 < Formula
  desc "VPN over a plain SSH login"
  homepage "https://github.com/allwinpower/sshuttle2"
  license "LGPL-2.1-or-later"

  # The version comes from the URLs.
  on_macos do
    on_arm do
      url "https://github.com/allwinpower/sshuttle2/releases/download/v0.1.1/sshuttle2-0.1.1-macos-arm64.tar.gz"
      sha256 "613e9885995d06e96006abb8c94c597e32877f20d7b47a18037dce189460b9fa"
    end
    on_intel do
      url "https://github.com/allwinpower/sshuttle2/releases/download/v0.1.1/sshuttle2-0.1.1-macos-amd64.tar.gz"
      sha256 "cafa5e3c1cd4dd5a9c02f9a52e2f90f42ac0a21aee227bed3b13627a08ead020"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/allwinpower/sshuttle2/releases/download/v0.1.1/sshuttle2-0.1.1-linux-arm64.tar.gz"
      sha256 "6fe29e8762087982ff360c3e5dbd757df0eb848f16a0f516e4c45b3626c0c732"
    end
    on_intel do
      url "https://github.com/allwinpower/sshuttle2/releases/download/v0.1.1/sshuttle2-0.1.1-linux-amd64.tar.gz"
      sha256 "46032174579efb458809c69293765c69a5c3aba99c6323f12f407aa7cc6e35a3"
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
