{ inputs, outputs, lib, config, pkgs, ... }: {
  # Add stuff for your user as you see fit:
  # programs.neovim.enable = true;
  home.packages = with pkgs; [

    # Packages for Ansible
    ansible
    ansible-lint
    glibcLocales
    python3
    python311Packages.dnspython
    python311Packages.mitogen # https://www.linkedin.com/pulse/how-speed-up-ansible-playbooks-drastically-lionel-gurret          # ❯ python -c "import mitogen; print(mitogen.__file__)"
    python311Packages.pykerberos
    python311Packages.pip
    python311Packages.pyspnego
    python311Packages.pywinrm
    python311Packages.requests
    sshpass

    # Packages for Terraform
    aws-azure-login
    awscli2
    terraform
    terragrunt
    nodejs

    # Packages for Vault access
    google-cloud-sdk
    vault-bin

    # Packages for Packer
    packer
    xorriso

    # Utilities
    go-task

  ];
}
