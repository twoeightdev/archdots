# Elapsed time set in `RPROMPT`
zmodload zsh/datetime
autoload -U add-zsh-hook

_preexec() {
    preexec_time=${EPOCHREALTIME}
}

_precmd() {
    if (( preexec_time )); then
        local -rF elapsed_time=$(( EPOCHREALTIME - preexec_time ))
        local -rF s=$(( elapsed_time%60 ))
        local -ri elapsed_s=${elapsed_time}
        local -ri m=$(( (elapsed_s/60)%60 ))
        local -ri h=$(( elapsed_s/3600 ))

        if (( h > 0 )); then
            printf -v prompt_time '%ih%im' ${h} ${m}
        elif (( m > 0 )); then
            printf -v prompt_time '%im%is' ${m} ${s}
        elif (( s >= 10 )); then
            printf -v prompt_time '%.2fs' ${s}
        elif (( s >= 1 )); then
            printf -v prompt_time '%.2fs' ${s}
        else
            printf -v prompt_time '%ims' $(( s*1000 ))
        fi
        tprompt="%F{167}[$prompt_time]%f"
        unset preexec_time
    else
        unset prompt_time
    fi
}
add-zsh-hook preexec _preexec
add-zsh-hook precmd _precmd

# Prompt with git and branch name
autoload -U colors && colors
autoload -Uz vcs_info
setopt nopromptbang prompt{cr,percent,sp,subst}
setopt prompt_subst

_promptvcs() {
    vcs_info
    zstyle ':vcs_info:git*' formats "%B%F{142}on %F{66}  %F{124}%b "

    echo -e -n "\x1b[\x33 q"
    PROMPT="%B%F{124}[%f%F{214}%n%f%F{142}@%f%F{66}%M %f%F{132}%~ %f${vcs_info_msg_0_}%F{124}]%f$%b "
    RPROMPT="${tprompt}"
}
add-zsh-hook precmd _promptvcs

set -k
stty stop undef

setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_all_dups
setopt hist_verify
setopt share_history
setopt complete_aliases
setopt auto_menu
setopt always_to_end
setopt complete_in_word
setopt glob_dots
setopt autocd
setopt extended_glob
setopt interactive_comments

# automatically escape urls special characters
autoload -Uz url-quote-magic bracketed-paste-magic
zle -N self-insert url-quote-magic
zle -N bracketed-paste bracketed-paste-magic

# Basic tab completion
autoload -U compinit && compinit -u
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' special-dirs true
zstyle ':completion:*' ignored-patterns '.'
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|=*' 'l:|=* r:|=*'
zmodload zsh/complist

# Command not found
function command_not_found_handler() {
    print -P "command not found: %F{red}$0%f" >&2
    return 127
}

# exclude garbage in history
function hist() {
    [[ "$#1" -lt 7 \
        || "$1" = "run-help "* \
        || "$1" = "cd "* \
        || "$1" = "man "* \
        || "$1" = "h "* \
        || "$1" = "~ "* ]]
            return $(( 1 - $? ))
}

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Vim keys in tab completion
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes
function zle-keymap-select() {
case $KEYMAP in
    # block
    vicmd) echo -ne '\e[1 q';;
    # beam
    viins|main) echo -ne '\e[5 q';;
esac
}
zle -N zle-keymap-select

# initiate `vi insert` as keymap
# can be removed if `bindkey -V` has been set elsewhere
zle-line-init() { zle -K viins && echo -ne "\e[5 q" }
zle -N zle-line-init

# use beam cursor on startup
echo -ne '\e[5 q'

# use beam cursor for each new prompt
preexec() { echo -ne '\e[5 q' ;}

# Use lf to jump in directories with ctrl-o
lfcd() {
    tmp="$(mktemp -uq)"
    trap 'rm -f $tmp >/dev/null 2>&1 &&
        trap - HUP INT QUIT TERM PWR EXIT' HUP INT QUIT TERM PWR EXIT
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
        ls -AhN --color=auto --group-directories-first
    fi
}
bindkey -s "^o" "^ulfcd\n"

# Edit line in vim with ctrl-e
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line
bindkey -M vicmd '^e' edit-command-line

# Load aliases and shortcuts if it exist
[ -f "$XDG_CONFIG_HOME/shell/shrc" ] && source "$XDG_CONFIG_HOME/shell/shrc"
[ -f "$XDG_CONFIG_HOME/shell/aliasrc" ] && source "$XDG_CONFIG_HOME/shell/aliasrc"
[ -f "$XDG_CONFIG_HOME/shell/zshdirrc" ] && source "$XDG_CONFIG_HOME/shell/zshdirrc"

# fzf
if [ ! -d ~/.config/fzf ]; then
    git clone --depth 1 https://github.com/junegunn/fzf ~/.config/fzf
    ~/.config/fzf/install --no-bash --no-fish --xdg --all
fi

if [[ -f "${XDG_CONFIG_HOME:-$HOME/.config}"/fzf/fzf.zsh ]]; then
    source "${XDG_CONFIG_HOME:-$HOME/.config}"/fzf/fzf.zsh
fi

# Search for file in $HOME directory with fzf and open with $EDITOR
e() { rg $HOME --files | sort -u | fzf -m | xargs -r $EDITOR; }

# Search directory in $HOME and cd to that directory with fzf
j() { cd "$(rg $HOME -0 --files | xargs -0 dirname | sort -u | fzf)" && ls -A }

# zsh-syntax-highlighting
if [ ! -d $ZPLUG/zsh-syntax-highlighting ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting $ZPLUG/zsh-syntax-highlighting
fi

typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[alias]='fg=blue'
ZSH_HIGHLIGHT_STYLES[assign]='none'
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='none'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=blue'
ZSH_HIGHLIGHT_STYLES[command]='fg=blue'
ZSH_HIGHLIGHT_STYLES[commandseparator]='none'
ZSH_HIGHLIGHT_STYLES[default]='none'
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=green'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[function]='fg=blue'
ZSH_HIGHLIGHT_STYLES[globbing]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[hashed-command]='fg=blue'
ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=green'
ZSH_HIGHLIGHT_STYLES[links]='none'
ZSH_HIGHLIGHT_STYLES[path]='none'
ZSH_HIGHLIGHT_STYLES[path_approx]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[path_prefix]='none'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=blue'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=blue'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=green'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=red'

source $ZPLUG/zsh-syntax-highlighting//zsh-syntax-highlighting.plugin.zsh
