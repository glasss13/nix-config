{ name, email, ... }:

{
  enable = true;
  userName = name;
  userEmail = email;
  delta.enable = true;
  lfs = {
    enable = true;
  };
  aliases = {
    lg = "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%D%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative";
  };
  extraConfig = {
    core = {
      editor = "nvim";
    };
  };
  ignores = [
    ".vscode"
    ".tool-versions"
    ".DS_Store"
  ];
}
