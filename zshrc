# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export ZSH_CUSTOM=$HOME/.oh-my-zsh-custom
#
# Used later to change the customizations that cost a lot on OSX
OS=$(uname -s)

export GOOGLE_APPLICATION_CREDENTIALS=$HOME/.ssh/google-app-auth.json
export GOOGLE_FIREBASE_CREDENTIALS=$HOME/.ssh/google-firebase-auth.json

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
#ZSH_THEME="peepcode"
#ZSH_THEME="powerlevel9k/powerlevel9k"
ZSH_THEME="powerlevel10k/powerlevel10k"
#POWERLEVEL9K_MODE='awesome-patched'
POWERLEVEL9K_MODE='nerdfont-complete'
# Limit to the last two folders
POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
#POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"
#POWERLEVEL9K_SHORTEN_DIR_LENGTH=4

POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='010'
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='017'
POWERLEVEL9K_FOLDER_ICON=""
#POWERLEVEL9K_HOME_SUB_ICON="$(print_icon "HOME_ICON")"

# enable the vcs segment in general
POWERLEVEL9K_SHOW_CHANGESET=false
# # just show the 6 first characters of changeset
# POWERLEVEL9K_CHANGESET_HASH_LENGTH=6

POWERLEVEL9K_KUBECONTEXT_BACKGROUND='004'
#POWERLEVEL9K_VCS_FOREGROUND='000'
POWERLEVEL9K_VCS_BACKGROUND='022'
#POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='028'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='106'
#POWERLEVEL9K_VCS_GIT_ICON='\uF408'
#POWERLEVEL9K_VCS_GIT_GITHUB_ICON='\uF408'
POWERLEVEL9K_VCS_GIT_ICON=''
POWERLEVEL9K_VCS_GIT_GITHUB_ICON=''
POWERLEVEL9K_HIDE_BRANCH_ICON=true
POWERLEVEL9K_VCS_UNTRACKED_ICON='\u25CF'
POWERLEVEL9K_VCS_UNSTAGED_ICON='●'
POWERLEVEL9K_VCS_STAGED_ICON='✚'
POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON='↓'
POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON='↑'
POWERLEVEL9K_VCS_COMMIT_ICON="\uf417"
POWERLEVEL9K_VCS_UNTRACKED_ICON="\uf29c"
POWERLEVEL9K_VCS_STASH_ICON='⍟'
#POWERLEVEL9K_VCS_BRANCH_ICON="\uf287"
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='010'
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='017'
POWERLEVEL9K_DIR_HOME_FOREGROUND='010'
POWERLEVEL9K_DIR_HOME_BACKGROUND='017'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='010'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='010'

POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND='245'
POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND='black'

typeset -g POWERLEVEL9K_KUBECONTEXT_SHOW_ON_COMMAND='kubectl|helm|kubens|kubectx|oc|istioctl|kogito|k9s|helmfile|kind'

#POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=$''
#
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status history time)
case "$OS" in
    Darwin*) POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon context dir) ; 
             POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status history)
    ;;
    *) 
        POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon context vcs dir dir_writable kubecontext);
        POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status background_jobs command_execution_time load history disk_usage time)
    ;;
esac

# VI-Mode
# general activation
#bindkey -v
#
# set some nice hotkeys
#bindkey '^P' up-history
#bindkey '^N' down-history
#bindkey '^?' backward-delete-char
#bindkey '^h' backward-delete-char
#bindkey '^w' backward-kill-word
#bindkey '^r' history-incremental-search-backward
# Shift ->
bindkey "^[[1;2C" forward-word
# Shift <-
bindkey "^[[1;2D" backward-word
#
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
ZSH_HIGHLIGHT_PATTERNS=('rm -rf *' 'fg=white,bold,bg=red')

#
export HISTCONTROL="ignoredups;ignorespace"
export HISTIGNORE="ls:cd:cd -:pwd:exit:date::"
export HISTTIMEFORMAT='%F %T  '
#
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

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
#ZSH_CUSTOM=~/.oh-my-zsh-custom

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#
# dirhistory needs alt-right alt-left checked
#
ZSH_TMUX_AUTOSTART=true

plugins=(profiles
         dirhistory dirpersist git git-flow git-extras history per-directory-history tmux golang
         colored-man-pages zsh-autosuggestions docker docker-compose zsh-syntax-highlighting z)
autoload -U compinit && compinit

# User configuration
export SNAP=/snap
export PATH="$SNAP/bin:$HOME/.cargo/bin:$HOME/upspin/bin:$HOME/bin:/usr/local/bin":$PATH:"/usr/bin:/usr/local/sbin:/usr/sbin":$HOME/.local/bin
export MANPATH="/usr/local/man:$MANPATH:$HOME/man"

export PATH="$HOME/.arkade/bin/:$HOME/.pyenv/bin:${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

rehash

zstyle ':completion:*' rehash true

# You may need to manually set your language environment
# export LANG=en_US.UTF-8


LOCALRC=~/.zsh.rc.local
GLOBALRC=~/.zsh.rc

# Scan the rc directories for files to be run during shell initilization supressing
# errors and messages due to their being no files
#
setopt +o nomatch
startfiles=`\ls -1 $GLOBALRC/* | xargs -n 1 basename 2> /dev/null || true`
if [[ -d "$LOCALRC" ]]
then
startfiles+=`\ls -1 $LOCALRC/* 2>/dev/null| xargs -n 1 basename 2>/dev/null || true`
fi

IFS=$'\n' sorted=($(sort <<<"${startfiles[*]}" | uniq))
unset IFS
setopt -o nomatch

for i in `echo $sorted`
do
        if [[ -e $LOCALRC/$i ]]
        then
                source $LOCALRC/$i
        fi
        if [[ -e $GLOBALRC/$i ]]
        then
                source $GLOBALRC/$i
        fi
done

source $ZSH/oh-my-zsh.sh

source <(fly completion --shell zsh) || true
source <(kubectl completion zsh) || true

export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#. /usr/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh
#
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Allow paths to be used to cd avoiding the need to enter 'cd[space]'
setopt AUTO_CD

chpwd() exa -gaF

# Multi process friendly history appending
setopt APPEND_HISTORY

# 
setopt SHARE_HISTORY

# Only respecxt explicit exit commands for the shell termination
setopt IGNORE_EOF

# If Windows
if [[ "$UbuntuWindows" == "1" ]] ; then
  unsetopt BG_NICE
fi

if [[ "$UbuntuLinux" == "1" ]] ; then
    type kubectl
    if [[ $? -eq 0 ]] ;  then
        shell_type=${SHELL##*/}
        source <(kubectl completion $shell_type)
    fi
fi

eval "$(direnv hook zsh)"

# Remove an oh-my-zsh alias to allow the go lang based grv git client to be used
unalias grv

# added by travis gem
[ -f /home/kmutch/.travis/travis.sh ] && source /home/kmutch/.travis/travis.sh

# tmux support now done using the oh-my-zsh tmux plugin
#
#if [[ -n $TMUX_PANE ]]; then
#else
#    if [[ "$OSX" != "1" ]]; then
#        tmux new-session -s base \; new-window "tmux set-option -ga terminal-overrides \",$TERM:Tc\"; tmux detach"
#        tmux attach -t base
#    fi
#fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/kmutch/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/kmutch/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/kmutch/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/kmutch/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

