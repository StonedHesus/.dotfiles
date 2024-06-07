# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="fletcherm"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(vi-mode)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
 # source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi

# opam configuration
[[ ! -r /Users/stonedhesus/.opam/opam-init/init.zsh ]] || source /Users/stonedhesus/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

# Environment variables.
export EDITOR=nvim
export LC_ALL=en_UK.UTF-8

#eval "$(starship init zsh)"
alias back="z .."
alias b="z .."
alias h="cd ~"
alias e="exa -lh"
alias et="exa -lhT"
alias ei="exa -lhi"
alias ea="exa -lha"
alias eai="exa -lhai"
alias eait="exa -lhaiT"
alias t="exa -T"
alias tl="exa -T --long"
alias c="clear"
alias showkey="read -rsn 1 key; echo -n $'\e['"$(printf "%d" "'$key")"'; echo"
alias zrc='${=EDITOR} ${ZDOTDIR:-$HOME}/.zshrc'
alias szrc='source ${ZDOTDIR:-$HOME}/.zshrc'
alias nv='${=EDITOR} ${ZDOTDIR:-$HOME}/.config/nvim'
alias wt='${=EDITOR} ${ZDOTDIR:-$HOME}/.config/wezterm'
alias l='ls -lFhG'
alias l3="z ~/University/L3"
alias ewc="z ${ZDOTDIR:-$HOME}/bin ; ./ewc"
alias ed="nvim"
alias d="cd"
alias g="z ~/Github/"
alias gcw="z ~/Github/currently-working-on/"
alias gco="z ~/Github/contributions"
alias m="mkdir"
alias fos='function _formatoml() { ocamlformat "$1" --enable-outside-detected-project > temp.ml && mv temp.ml "$1"; }; _formatoml'
alias ob="open ~/Desktop/books"
alias s="scala"
alias se="scala -explain"
alias sc="scalac"
alias nst="sbt new scala/scala3.g8"
alias p="python3"
alias pa="python3 -m dis"
alias gccs="gcc -S"
alias nf="neofetch"
alias dip="dune init project"
# TOFIX: there's an issue with the stanza when moving the contents of root, hence I will need to create a longer functionwhich will also update the `dune-project` configuration file.
alias dipr="dune init project root && for file in root/*(D); do move $file .; done && rmdir root"
alias light=osascript -e 'tell application "iTerm2" to tell current session of current window to set background color to {65535, 65535, 65535}'
alias dark=osascript -e 'tell application "iTerm2" to tell current session of current window to set background color to {0, 0, 0}'
alias ta="tar -czfv"
alias jv="/usr/libexec/java_home -V"
alias jpacks='open -a Safari "https://package-search.jetbrains.com/search?query=$1"'
alias wb="open -na 'Brave Browser'"
alias zz="z -"
source $(brew --prefix)/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /Users/stonedhesus/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Created by `pipx` on 2024-01-24 10:25:55
export PATH="$PATH:/Users/stonedhesus/.local/bin"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(zoxide init zsh)"

export LC_ALL="en_UK.UTF-8"
export LC_CTYPE="UTF-8"
export LC_TERMINAL="iTerm2"
export LANG="en_UK.UTF-8"

# oh-my-posh configuration
eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/oh-my-posh.toml)"

if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init zsh)"
fi

