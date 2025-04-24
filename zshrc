#### FIG ENV VARIABLES ####
# Please make sure this block is at the start of this file.
[ -s ~/.fig/shell/pre.sh ] && source ~/.fig/shell/pre.sh
#### END FIG ENV VARIABLES ####
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

# Allow gpg2 to retrieve the password for gpg keys used to verify checkins
export GPG_TTY=$(tty)

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
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_DIR_MAX_LENGTH=6

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

POWERLEVEL9K_VCS_SHORTEN_LENGTH=12
POWERLEVEL9K_VCS_SHORTEN_MIN_LENGTH=12
POWERLEVEL9K_VCS_SHORTEN_STRATEGY="truncate_middle"

#POWERLEVEL9K_VIRTUALENV_GENERIC_NAMES=()
#POWERLEVEL9K_VIRTUALENV_SHOW_WITH_PYENV=true
POWERLEVEL9K_VIRTUALENV_SHOW_PYTHON_VERSION=false
#POWERLEVEL9K_VIRTUALENV_GENERIC_NAMES=(virtualenv venv .venv env .venv-ci)
#POWERLEVEL9K_VIRTUALENV_CONTENT_EXPANSION=
POWERLEVEL9K_VIRTUALENV_VISUAL_IDENTIFIER_EXPANSION=''
VIRTUAL_ENV_DISABLE_PROMPT=1
#POWERLEVEL9K_VIRTUALENV_LEFT_DELIMITER=
#POWERLEVEL9K_VIRTUALENV_RIGHT_DELIMITER=

# Hide `pyenv` segment if its content has no dots ('.').
#POWERLEVEL9K_PYENV_CONTENT_EXPANSION='${(M)P9K_CONTENT:#*.*}'
#POWERLEVEL9K_PYENV_CONTENT_EXPANSION='${P9K_CONTENT}${${P9K_PYENV_PYTHON_VERSION:#$P9K_CONTENT}:+ $P9K_PYENV_PYTHON_VERSION}'
#POWERLEVEL9K_PYENV_VISUAL_IDENTIFIER_EXPANSION='${${(M)P9K_CONTENT:#*.*}:+${P9K_VISUAL_IDENTIFIER// }}'

#POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=$''
#
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status history time)
case "$OS" in
    Darwin*) POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon context dir) ; 
             POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status history)
    ;;
    *) 
        POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon context vcs dir dir_writable kubecontext);
        POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status virtualenv background_jobs command_execution_time load history disk_usage timewarrior time)
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

# User configuration
export SNAP=/snap
export PATH="/usr/local/bin:$SNAP/bin:$HOME/.cargo/bin:$HOME/upspin/bin:$HOME/bin":$PATH:"/usr/bin:/usr/local/sbin:/usr/sbin":$HOME/.local/bin
export MANPATH="/usr/local/man:$MANPATH:$HOME/man"

export PATH="$HOME/.arkade/bin/:$HOME/.pyenv/bin:${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

export RIPGREP_CONFIG_PATH=$HOME/.ripgreprc

rehash

if grep -qE "(orbstack)" /proc/version &> /dev/null ; then
    export OrbStack=1
else
    export OrbStack=
fi

if [[ "$OrbStack" == "1" ]] ; then
    plugins=(profiles
             dirhistory dirpersist git git-flow git-extras history per-directory-history golang
             colored-man-pages zsh-autosuggestions docker docker-compose zsh-syntax-highlighting z)
else
    case "$OS" in
        Darwin*) 
            plugins=(profiles
                    dirhistory dirpersist git git-flow git-extras history per-directory-history golang
                    colored-man-pages zsh-autosuggestions docker docker-compose zsh-syntax-highlighting z)
        ;;
        *)
            plugins=(profiles
                    dirhistory dirpersist git git-flow git-extras history per-directory-history tmux golang
                    colored-man-pages zsh-autosuggestions docker docker-compose zsh-syntax-highlighting z)
        ;;
    esac
fi

autoload -U compinit && compinit

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

chpwd() eza -gaF

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
    type kubectl > /dev/null
    if [[ $? -eq 0 ]] ;  then
        shell_type=${SHELL##*/}
        source <(kubectl completion $shell_type)
    fi
fi

if [[ "$UbuntuLinux" == "1" ]] ; then
    type fly > /dev/null
    if [[ $? -eq 0 ]] ;  then
        shell_type=${SHELL##*/}
        source <(fly completion --shell $shell_type)
    fi
fi

if [[ "$UbuntuLinux" == "1" ]] ; then
    type eksctl > /dev/null
    if [[ $? -eq 0 ]] ;  then
        shell_type=${SHELL##*/}
        source <(eksctl completion $shell_type)
    fi
fi

if [[ "$UbuntuLinux" == "1" ]] ; then
    type nerdctl > /dev/null
    if [[ $? -eq 0 ]] ;  then
        shell_type=${SHELL##*/}
        source <(nerdctl completion $shell_type)
    fi
fi

eval "$(direnv hook zsh)"

# Remove an oh-my-zsh alias to allow the go lang based grv git client to be used
unalias grv

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


#### FIG ENV VARIABLES ####
# Please make sure this block is at the end of this file.
[ -s ~/.fig/fig.sh ] && source ~/.fig/fig.sh
#### END FIG ENV VARIABLES ####

# add Pulumi to the PATH
export PATH=$PATH:/home/karlmutch/.pulumi/bin

# >>> juliaup initialize >>>

# !! Contents within this block are managed by juliaup !!

path=('/home/karlmutch/.juliaup/bin' $path)
export PATH

# <<< juliaup initialize <<<
#
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi

export PATH=$PATH:$HOME/.pulumi/bin
eval "$(/data/home/karl/.local/bin/mise activate zsh)"


# >>> juliaup initialize >>>

# !! Contents within this block are managed by juliaup !!

path=('/data/home/karl/.juliaup/bin' $path)
export PATH

# <<< juliaup initialize <<<

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# OPS config
export OPS_DIR="$HOME/.ops"
export PATH="$HOME/.ops/bin:$PATH"
source "$HOME/.ops/scripts/bash_completion.sh"
autoload bashcompinit
