# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
path+=('/home/void/bin/scripts')
path+=('/usr/lib/node_modules')
path+="$(yarn global dir)"
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
# export UPDATE_ZSH_DAYS=13

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
# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias vim="nvim"
alias ls="ls -hN --color=auto --group-directories-first"
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
alias l.="ls -d .*"
alias c="clear"
alias pac="sudo pacman"
alias yank="yank -- xsel -b"
alias xclip="xclip -selection clipboard"
alias wiki="$EDITOR ~/vimwiki/index.wiki"
alias todo="$EDITOR ~/vimwiki/Todo.wiki"
alias workout="$EDITOR ~/vimwiki/Workout.wiki"
alias tmuxmain="TERM=screen-255color tmux new -s main"
alias feh="feh --image-bg black -Z -."
alias andromeda="cd /run/media/void/ANDROMEDA"
alias calypso="cd /run/media/void/CALYPSO"
alias ta="tmux a -t main"
alias t="tmuxf"
alias tmux="TERM=screen-256color tmux"
alias tinit="cp ~/code/js/boilerplate-configs/.tmux ."
alias fzf='fzf-tmux'
export FZF_DEFAULT_COMMAND='fd --type f --follow --exclude={.git,node_modules}'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS="--color=hl:221,hl+:220"
export FZF_COMPLETION_TRIGGER='**'
source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh
#export MESA_GLSL_CACHE_DISABLE=true


cf() { cd "$(du ~/code --exclude={".*","node_*",misc,public} | awk '{print $2}' | sed "s|/home/void/||" | fzf | sed "s|^|$HOME/|" )" ; }
copy() { cp -v "$1" "$(awk '{print $1}'  ~/.config/bmdirs | fzf | sed "s|~|$HOME|")" ; }
cdf() { cd "$(du --exclude={"node_*","*/.*","Downloads"} | awk '{ $1 = ""; print $0; }' | sed "s|\s*./||" | fzf  )" ; }
se() { $EDITOR "$( du -a ~/.config ~/bin/scripts --exclude={coc/extensions,DevDocs,tmux/plugins,"Code*",yarn,chromium,skypeforlinux,GIMP,discord,Electron,filezilla,deluge} | awk '{print $2}' | sed "s|/home/void/\.config|>|g" | fzf | sed "s|>|/home/void/.config|")" ; }
rcd () { ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR" ; }

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
  env SSH_AUTH_SOCK=$SOCK_SYMLINK TERM=screen-256color tmux new -A -s "$SESSION_NAME"
}

bindkey -s '^o' "rcd\r"

# Edit line in vim with ctrl-e
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line
