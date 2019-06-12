# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
path+=('/home/void/bin/scripts')
export PATH
# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="michelebologna"

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

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8
export EDITOR='nvim'
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
alias wall="cd ~/Pictures/Wallpapers"
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
alias tmux="TERM=screen-256color tmux -f ~/.config/tmux/.tmux.conf"
alias feh="feh --image-bg black -Z -."
export FZF_DEFAULT_OPTS="--color=hl:221,hl+:220"
#export MESA_GLSL_CACHE_DISABLE=true


cf() { cd "$(du ~/code --exclude="node_*" --exclude=".*" --exclude={misc,public} | awk '{print $2}' | sed "s|/home/void/||" | fzf | sed "s|^|$HOME/|" )" ; }
copy() { cp -v "$1" "$(awk '{print $1}'  ~/.config/bmdirs | fzf | sed "s|~|$HOME|")" ; }
cdf() { cd "$(awk '{print $1}'  ~/.config/bmdirs | fzf | sed "s|~|$HOME|")" ; }
se() { $EDITOR "$( du -a ~/.config ~/bin/scripts --exclude="Code*" --exclude={yarn,chromium,skypeforlinux,GIMP,discord,Electron,filezilla,deluge} | awk '{print $2}' | sed "s|/home/void/\.config|>|g" | fzf | sed "s|>|/home/void/.config|")" ; }
