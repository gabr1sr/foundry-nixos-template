{ pkgs, config, inputs, ... }:

{
  imports = [ inputs.nur.nixosModules.nur ];

  packages = [
    config.nur.repos.gabr1sr.vscode-solidity-server
  ];

  cachix.enable = false;
  
  languages.solidity = {
    enable = true;
    foundry.enable = true;
  };

  pre-commit.hooks = {
    # https://github.com/0xYYY/foundry-pre-commit/blob/main/.pre-commit-hooks.yaml
    forge-fmt = {
      enable = true;
      name = "forge fmt";
      language = "system";
      entry = "forge fmt";
      pass_filenames = false;
    };

    forge-snapshot = {
      enable = true;
      name = "forge snapshot";
      language = "system";
      entry = "forge snapshot";
      pass_filenames = false;
    };
  };

  enterShell = ''
    if [ ! -e ./foundry.toml ]; then
      forge init --force
    fi
  '';

  enterTest = ''
    forge test
  '';
}
