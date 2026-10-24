# Made from packaging/homebrew/sshuttle2.rb.in in allwinpower/sshuttle2 by
# its release workflow. Changes here are overwritten by the next release.
class Sshuttle2 < Formula
  desc "VPN over a plain SSH login"
  homepage "https://github.com/allwinpower/sshuttle2"
  license "LGPL-2.1-or-later"

  # The version comes from the URLs.
  on_macos do
    on_arm do
      url "https://github.com/allwinpower/sshuttle2/releases/download/v0.1.2/sshuttle2-0.1.2-macos-arm64.tar.gz"
      sha256 "68a287be381950afb74d4735f584fe76e662a18e12936e65ba37c6193d14ea44"
    end
    on_intel do
      url "https://github.com/allwinpower/sshuttle2/releases/download/v0.1.2/sshuttle2-0.1.2-macos-amd64.tar.gz"
      sha256 "43c3da4a32b30cc818b906a90abde0a8ec71a59fc43ca45ff154c358682286ba"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/allwinpower/sshuttle2/releases/download/v0.1.2/sshuttle2-0.1.2-linux-arm64.tar.gz"
      sha256 "6b0c5cf30c280d9940ea26a66e11be48669959064bd04c9219e56ae74f19ba1d"
    end
    on_intel do
      url "https://github.com/allwinpower/sshuttle2/releases/download/v0.1.2/sshuttle2-0.1.2-linux-amd64.tar.gz"
      sha256 "659fcf4c7d0147d6e767f557aab8cb5e699e134e9370e354f98b158e1dbb09c3"
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
