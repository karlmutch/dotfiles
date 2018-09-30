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
ZSH_THEME="powerlevel9k/powerlevel9k"
#POWERLEVEL9K_MODE='awesome-patched'
case "$OS" in
    Darwin*) POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir) ;;
    *) POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context vcs dir) ;;
esac
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status history)

# Limit to the last two folders
POWERLEVEL9K_SHORTEN_DIR_LENGTH=3

POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='010'
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='017'
POWERLEVEL9K_FOLDER_ICON=""
#POWERLEVEL9K_HOME_SUB_ICON="$(print_icon "HOME_ICON")"

# enable the vcs segment in general
POWERLEVEL9K_SHOW_CHANGESET=false
# # just show the 6 first characters of changeset
# POWERLEVEL9K_CHANGESET_HASH_LENGTH=6

#POWERLEVEL9K_VCS_FOREGROUND='000'
POWERLEVEL9K_VCS_BACKGROUND='022'
#POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='028'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='106'

POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='010'
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='017'
POWERLEVEL9K_DIR_HOME_FOREGROUND='010'
POWERLEVEL9K_DIR_HOME_BACKGROUND='017'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='010'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='010'

POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND='245'
POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND='black'

#POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=$''
#
case "$OS" in
    Darwin*) POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir) ; 
             POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status history)
    ;;
    *) 
        POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context vcs dir dir_writable);
        POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status background_jobs command_execution_time load)
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
plugins=(profiles git git-flow golang colored-man-pages history per-directory-history zsh-autosuggestions dirhistory dirpersist docker docker-compose zsh-syntax-highlighting z)
autoload -U compinit && compinit

# User configuration

export PATH="$HOME/.cargo/bin:$HOME/upspin/bin:$HOME/bin:/usr/local/bin":$PATH:"/usr/bin:/usr/local/sbin:/usr/sbin":$HOME/.local/bin
export MANPATH="/usr/local/man:$MANPATH:$HOME/man"

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

# If Windows
if [[ "$UbuntuWindows" == "1" ]] ; then
  unsetopt BG_NICE
fi

eval "$(direnv hook zsh)"

# Remove an oh-my-zsh alias to allow the go lang based grv git client to be used
unalias grv

# added by travis gem
[ -f /home/kmutch/.travis/travis.sh ] && source /home/kmutch/.travis/travis.sh

if [[ -n $TMUX_PANE ]]; then
else
    if [[ "$OSX" != "1" ]]; then
        tmux new-session -s base \; new-window "tmux set-option -ga terminal-overrides \",$TERM:Tc\"; tmux detach"
        tmux attach -t base
    fi
fi
