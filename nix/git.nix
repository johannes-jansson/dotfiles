{ pkgs, config, ... }: {
  programs.gh.enable = true;
  programs.git = {
    enable = true;
    userName = "johannes-jansson";

    # Fancy diff viewer
    delta = {
      enable = true;
    };

    aliases = {
	    lg = "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit";
	    sum = "log --abbrev-commit --pretty=oneline --reverse";
      browse = "!hub browse";
      cane = "commit --amend --no-edit";
      # co = "checkout";
      poo = "push -u origin HEAD";
      # st = "status";
    };

    extraConfig = {
      core.editor = "nvim";

      github.user = "johannes-jansson";

      init.defaultBranch = "master";

      pull = {
        default = "current";
        rebase = false;
      };

      merge = {
        tool = "nvim";
        conflictstyle = "diff3";
      };

      mergeTool = {
        nvim = {
          prompt = false;
          cmd = "nvim -d $MERGED $LOCAL $BASE $REMOTE -c 'wincmd J'";
        };
      };

    };

    lfs.enable = true;

    signing.signByDefault = true;
  };
}
