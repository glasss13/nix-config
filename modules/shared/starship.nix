{ lib, ... }:

{
  enable = true;
  settings = {
    add_newline = false;
    format = lib.concatStrings [
      "$username"
      "$hostname"
      "$directory"
      "$git_branch"
      "$git_commit"
      "$git_state"
      "$git_status"
      "$line_break"
      "$time"
      "$character"
    ];

    username = {
      disabled = false;
      style_user = "green bold dimmed";
      style_root = "black bold";
      format = "[$user]($style) ";
    };

    hostname = {
      disabled = false;
      ssh_only = false;
      detect_env_vars = [
        "SSH_CONNECTION"
        "SSH_CLIENT"
        "SSH_TTY"
        "REX_SESSION"
      ];
      format = "on [$hostname](red) ";
    };

    directory = {
      disabled = false;
      style = "cyan bold dimmed";
    };

    git_branch = {
      disabled = false;
      style = "bold purple dimmed";
    };

    git_commit = {
      disabled = false;
    };

    git_state = {
      disabled = false;
    };

    git_status = {
      disabled = false;
      style = "red";
    };

    time = {
      disabled = false;
      style = "bold gray";
      format = "[\\[$time\\]]($style) ";
    };
  };
}
