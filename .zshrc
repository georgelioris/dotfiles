# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
path+=('/home/void/bin/scripts')
path+=('/home/void/.yarn/bin')
path+=('/home/void/.local/bin')
#path+=('/home/void/.yarn/bin')
# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="michelebologna"
ZSH_THEME="spaceship"
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
UPDATE_ZSH_DAYS=13
DISABLE_UPDATE_PROMPT=true
# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)
plugins+=(k)
plugins+=(zsh-syntax-highlighting)
plugins+=(colored-man-pages)
plugins+=(zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh
export SPACESHIP_CHAR_SYMBOL=' '
export SPACESHIP_NODE_DEFAULT_VERSION=$(node -v)
export SPACESHIP_EXEC_TIME_SHOW=false
export SPACESHIP_PACKAGE_SHOW=false
export SPACESHIP_DIR_PREFIX=""
#export SPACESHIP_VI_MODE_COLOR=grey
#export SPACESHIP_VI_MODE_INSERT=""
export SPACESHIP_PROMPT_ORDER=(
  #time          # Time stamps section
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  node          # Node.js section
  line_sep      # Line break
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)
# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-7
export VISUAL='nvim'
export EDITOR="$VISUAL"
export KEYTIMEOUT=1
# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"
export NNN_USE_EDITOR=1
export BC_ENV_ARGS=$HOME/.config/.bcrc
# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias vim="nvim"
alias ls="lsd -h --icon=never --group-dirs=first"
alias la="lsd -lAh --icon=never --group-dirs=first"
alias cp="cp -i"
alias h="cd ~/"
alias cod="cd ~/code && ls"
alias js="cd ~/code/js && ls"
alias dl="cd ~/Downloads"
alias wall="ranger ~/Pictures/Wallpapers"
alias pic="cd ~/Pictures"
alias doc="cd ~/Documents"
alias scrots="cd ~/Pictures/scrots"
alias conf="cd ~/.config"
alias confi3="$EDITOR ~/.config/i3/config"
alias confterm="$EDITOR ~/.config/alacritty/alacritty.yml"
alias confvim="$EDITOR ~/.config/nvim/init.vim"
alias confzsh="$EDITOR ~/.zshrc"
alias yt="mpsyt"
alias weather="curl wttr.in/Thessaloniki"
alias cdc="cd ~-"
alias l.="ls .* -dtl"
alias c="clear"
alias pac="sudo pacman"
alias yank="yank -- xsel -b"
alias xclip="xclip -selection clipboard"
alias wiki="$EDITOR -c Goyo ~/vimwiki/index.wiki"
alias todo="$EDITOR ~/vimwiki/Todo.wiki"
alias workout="$EDITOR ~/vimwiki/Workout.wiki"
alias feh="feh --image-bg black -. "
alias andromeda="cd /run/media/void/ANDROMEDA"
alias calypso="cd /run/media/void/CLYPSO"
alias t="tmuxf"
alias tmux="TERM=screen-256color tmux -f $HOME/.config/tmux/.tmux.conf"
alias tinit="cp ~/code/js/boilerplate-configs/.tmux ."
# alias sshpi="ssh -F ~/.ssh/config alarm@192.168.1.17"
# alias sshpi4="ssh -X -F ~/.ssh/config "
alias jctl="journalctl -p 3 -xb"
export FZF_TMUX=1
export FZF_DEFAULT_COMMAND='fd --type f --follow --exclude={.git,node_modules}'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS="--color=hl:221,hl+:220"
export FZF_COMPLETION_TRIGGER='**'
export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"
# fzf **<TAB> completion
source /usr/share/fzf/completion.zsh
# fzf CTRL-T
source /usr/share/fzf/key-bindings.zsh
#export MESA_GLSL_CACHE_DISABLE=true

paclist() { pacman -Qq | fzf --preview 'pacman -Qil {}' --layout=reverse --bind 'enter:execute(pacman -Qil {} | less)' }
ta() { tmux a -t "$(tmux ls | sed  "s/:.*//"  | fzf --reverse --height="10%" +m)" || exit ; }
tk() { tmux ls | sed  "s/:.*//"  | fzf --reverse --height="10%" | xargs -rI {} tmux kill-session -t "{}" ; }
cf() { cd "$(du ~/code --exclude={".*","node_*",misc,public,vendor} | cut -f2- | sed "s|$HOME/||" | fzf +m | sed "s|^|$HOME/|" )" || exit ; }
copy() { cp -v "$1" "$(awk '{print $1}'  ~/.config/bmdirs | fzf --reverse --height="20%" +m | sed "s|~|$HOME|")" ; }
cdf() { cd ."$(du --exclude={"node_*","*/.*","Downloads"} | cut -d'.' -f2- | fzf-tmux --reverse --height="50%" +m )" ; }
se() { DIR="$( du -a ~/.config ~/bin/scripts --exclude-from=$HOME/.fzfignore | cut -f2- | sed "s|$HOME/\.config/|>|g" | fzf +m | sed "s|>|$HOME/.config/|")"; [ $DIR ] && $EDITOR $DIR ; }
rcd() { ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR" ; }
setwall() { fd --type f . ~/Pictures/Wallpapers/ | fzfimg | xargs -I {} feh --bg-fill "{}" }
fbr() {
  local branches branch
  branches=$(git branch) &&
  branch=$(echo "$branches" | fzf --reverse --height="10%" +m) &&
  git checkout $(echo "$branch" | sed "s/.* //")
}

# Tmux Function
tmuxf() {
  emulate -L zsh

  # Make sure even pre-existing tmux sessions use the latest SSH_AUTH_SOCK.
  # (Inspired by: https://gist.github.com/lann/6771001
  local SOCK_SYMLINK=~/.ssh/ssh_auth_sock
  if [ -r "$SSH_AUTH_SOCK" -a ! -L "$SSH_AUTH_SOCK" ]; then
    ln -sf "$SSH_AUTH_SOCK" $SOCK_SYMLINK
  fi

  # If provided with args, pass them through.
  if [[ -n "$@" ]]; then
    env SSH_AUTH_SOCK=$SOCK_SYMLINK tmux "$@"
    return
  fi

  # Check for .tmux file (poor man's Tmuxinator).
  if [ -x .tmux ]; then
    # Prompt the first time we see a given .tmux file before running it.
    local DIGEST="$(openssl sha512 .tmux)"
    if ! grep -q "$DIGEST" ~/..tmux.digests 2> /dev/null; then
      cat .tmux
      read -k 1 -r \
        'REPLY?Trust (and run) this .tmux file? (t = trust, otherwise = skip) '
      echo
      if [[ $REPLY =~ ^[Tt]$ ]]; then
        echo "$DIGEST" >> ~/..tmux.digests
        ./.tmux
        return
      fi
    else
      ./.tmux
      return
    fi
  fi

  # Attach to existing session, or create one, based on current directory.
  SESSION_NAME=$(basename "$(pwd)")
  env SSH_AUTH_SOCK=$SOCK_SYMLINK tmux new -A -s "$SESSION_NAME"
}

# Extract file
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}


bindkey -s '^o' "rcd\r"
# Edit line in vim with ctrl-e
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line
