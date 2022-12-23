[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"

# History
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000

# Stop Beep Noise
unsetopt beep

# Plugins
plug "zap-zsh/supercharge"
plug "zsh-users/zsh-completions"
plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-syntax-highlighting"

# Aliases
alias shut="shutdown now"
alias w="nitrogen --set-zoom-fill --random ~/storage/Media/Photos/Wallpapers"

# Git
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
zstyle ':vcs_info:*' unstagedstr ' '
zstyle ':vcs_info:*' stagedstr ' '
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:git:*' formats ' %F{yellow} %b%f%F{red} %u%c%f'

PROMPT=" %B%F{cyan}%1~%f%b\$vcs_info_msg_0_ %(?.%F{green}.%F{red}) %f"
