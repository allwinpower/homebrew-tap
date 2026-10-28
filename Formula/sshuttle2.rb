# Made from packaging/homebrew/sshuttle2.rb.in in allwinpower/sshuttle2 by
# its release workflow. Changes here are overwritten by the next release.
class Sshuttle2 < Formula
  desc "VPN over a plain SSH login"
  homepage "https://github.com/allwinpower/sshuttle2"
  license "LGPL-2.1-or-later"

  # The version comes from the URLs.
  on_macos do
    on_arm do
      url "https://github.com/allwinpower/sshuttle2/releases/download/v0.3.0/sshuttle2-0.3.0-macos-arm64.tar.gz"
      sha256 "5d03fe1caa301f249f257f79f1f44f4b4f46914e9b51bc8b978c89f59181bdc9"
    end
    on_intel do
      url "https://github.com/allwinpower/sshuttle2/releases/download/v0.3.0/sshuttle2-0.3.0-macos-amd64.tar.gz"
      sha256 "8bfd30f0ac0a46df5e294bf3eacb77dc8541ae488b156de8bcb306c7bf2ecde5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/allwinpower/sshuttle2/releases/download/v0.3.0/sshuttle2-0.3.0-linux-arm64.tar.gz"
      sha256 "f77552b5898d03b390b5b49cc340ea0254f2ace0700d3efa6060145231ae7ae7"
    end
    on_intel do
      url "https://github.com/allwinpower/sshuttle2/releases/download/v0.3.0/sshuttle2-0.3.0-linux-amd64.tar.gz"
      sha256 "6d4ba65eb3d5e6478e13360af61756b7ad39e3655eaa9c3670bc0b224378629d"
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
