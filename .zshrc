[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"

# History
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000

# Stop Beep Noise
unsetopt beep

# Enable Vim Mode
# bindkey -v
# export KEYTIMEOUT=1

# Plugins
plug "zap-zsh/supercharge"
plug "zsh-users/zsh-completions"
plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-syntax-highlighting"
plug "zap-zsh/vim"

# Aliases
alias shut="shutdown now"
alias w="nitrogen --set-zoom-fill --random ~/storage/Media/Photos/Wallpapers"

# Prompt With git integration
autoload -Uz vcs_info
autoload -U colors && colors

zstyle ':vcs_info:*' enable git

precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst


zstyle ':vcs_info:git*+set-message:*' hooks git-untracked
# 
+vi-git-untracked(){
    if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
        git status --porcelain | grep '??' &> /dev/null ; then
        hook_com[staged]+='!' # signify new files with a bang
    fi
}

zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:git:*' formats " %{$fg[blue]%}(%{$fg[red]%}%m%u%c%{$fg[yellow]%}%{$fg[magenta]%} %b%{$fg[blue]%})%{$reset_color%}"

PROMPT=" %B%F{cyan}%1~%f%b\$vcs_info_msg_0_ %(?:%{$fg_bold[green]%} :%{$fg_bold[red]%} )%{$reset_color%}"
