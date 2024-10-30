{
  "$schema" = "https://starship.rs/config-schema.json";
  add_newline = false;
  continuation_prompt = "[](#007ACC) ";
  format = ''
    $directory$git_branch$git_commit$username$hostname$status$fill$cmd_duration$time$shell
    [](#007ACC) '';
  cmd_duration = {
    min_time = 500;
    show_milliseconds = true;
    format = "[ $duration](#FFD700) ";
    min_time_to_notify = 500;
  };
  directory = {
    format = "[$path](#FFFFFF) ";
  };
  fill = {
    symbol = " ";
  };
  time = {
    format = "[$time](#61D6D6) ";
    disabled = false;
  };
  git_branch = {
    format = "[$branch(:$remote_branch)](#C2C206) ";
  };
  git_commit = {
    format = "[$tag](#C2C206) ";
    only_detached = false;
    tag_disabled = false;
    tag_max_candidates = 1;
  };
  shell = {
    format = "[$indicator](#FFFFFF)";
    disabled = false;
    bash_indicator = "";
    zsh_indicator = "";
    pwsh_indicator = "";
  };
  status = {
    format = "[$common_meaning](#C94A16) ";
    disabled = false;
  };
  username = {
    format = "[$user]($style)";
  };
  hostname = {
    ssh_symbol = "@";
    format = "[$ssh_symbol$hostname]($style)";
  };
}
