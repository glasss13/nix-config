{ name, email, ... }:

{
  enable = true;
  lfs = {
    enable = true;
  };
  settings = {
    user = {
      name = name;
      email = email;
    };
    alias = {
      lg = "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%D%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative";
    };
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
