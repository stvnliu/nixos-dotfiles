{config, lib, pkgs, ...}: {
    programs.git = {
        enable = true;
        userName = "Zhongheng Liu";
        userEmail = "z.liu@outlook.com.gr";
        extraConfig = {
            commit.gpgsign = true;
            gpg.format = "ssh";
            gpg.ssh.allowedSignersFile = "~/.ssh/allowed_signers";
            user.signingkey = "~/.ssh/id_ed25519.pub";
            credential.helper = "${
            pkgs.git.override { withLibsecret = true; }
            }/bin/git-credential-libsecret";
        };
    };
}