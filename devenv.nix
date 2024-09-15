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
    forge-fmt = {
      enable = true;
      name = "forge fmt";
      language = "system";
      entry = "forge fmt";
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
