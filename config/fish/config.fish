# Path to your oh-my-fish.
set fish_path $HOME/.oh-my-fish
set -gx TMUX_POWERLINE_PATCHED_FONT_IN_USE "false"
set -gx TF_DIFF_COMMAND " diff %1 %2"
set -gx LC_ALL en_US.UTF-8
set -gx TERM rxvt-unicode-256color
set -gx COLORTERM rxvt-unicode-256color
set fish_function_path $fish_function_path "/home/kmutch/devel/powerline-develop/powerline/bindings/fish"
powerline-setup

function tmux_directory_title 

if [ "$PWD" != "$LPWD" ] 
    set LPWD "$PWD" 
    set INPUT $PWD 
    set SUBSTRING (eval echo $INPUT| awk '{ print substr( $0, length($0) - 19, length($0) ) }') 
    tmux rename-window "..$SUBSTRING" 
    end 
end 


function fish_title
    tmux has-session  ^/dev/null
    if [ $status = 0 ]
        # Set the tmux window title, depending on whether we are running something, or just prompting function fish_title 
        if [ "fish" != $_ ] 
            tmux rename-window "$_ $argv" 
        else 
            tmux_directory_title
        end 
    end

    if [ "fish" != $_ ] 
        echo "$_ $argv" 
    else 
        set INPUT $PWD
        set SUBSTRING (eval echo $INPUT| awk '{ print substr( $0, length($0) - 19, length($0) ) }')
        echo "$SUBSTRING"

    end

end

#
set -gx JAVA_HOME /opt/jdk1.8.0_05/
set -gx JGRADLE_HOME /opt/gradle/latest

set PATH $PATH $JGRADLE_HOME/bin

if status --is-login
        set PATH $PATH /usr/bin /sbin /home/kmutch/devel/TEE-CLC-12.0.1
end

# Theme
#set fish_theme robbyrussell

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-fish/plugins/*)
# Custom plugins may be added to ~/.oh-my-fish/custom/plugins/
# Example format: set fish_plugins autojump bundler
set fish_plugins tmux sublime rvm

# Path to your custom folder (default path is $FISH/custom)
#set fish_custom $HOME/dotfiles/oh-my-fish

# Load oh-my-fish configuration.
. $fish_path/oh-my-fish.fish



set PATH $PATH /usr/local/heroku/bin
