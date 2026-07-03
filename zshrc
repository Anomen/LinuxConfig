# ---------- Homebrew prefix ----------
BREW_PREFIX="$(brew --prefix)"

# ---------- Powerlevel10k ----------
source "$BREW_PREFIX/share/powerlevel10k/powerlevel10k.zsh-theme"
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# ---------- History ----------
HISTFILE="$HOME/.zhistory"
HISTSIZE=10000
SAVEHIST=10000

setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY
setopt EXTENDED_HISTORY

# ---------- Completion system ----------
autoload -Uz compinit
mkdir -p "$HOME/.cache/zsh"
compinit -d "$HOME/.cache/zsh/zcompdump"

zmodload zsh/complist

# Case-insensitive and forgiving completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' '+r:|[._-]=* r:|=*'
zstyle ':completion:*' menu no
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# ---------- fzf key-bindings ONLY ----------
# Do NOT source completion.zsh — fzf-tab replaces it!
[[ -f "$BREW_PREFIX/opt/fzf/shell/key-bindings.zsh" ]] && source "$BREW_PREFIX/opt/fzf/shell/key-bindings.zsh"

# ---------- zsh-autosuggestions ----------
source "$BREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
ZSH_AUTOSUGGEST_USE_ASYNC=true

## ---------- fzf-tab ----------
## Load fzf-tab AFTER compinit and fzf key-bindings
#source "$BREW_PREFIX/opt/fzf-tab/share/fzf-tab/fzf-tab.zsh"
#
## Base flags — NO --preview-window here, so commands like ssh get a clean full-width list
#FZF_TAB_FLAGS=(
#    --height=60% --layout=reverse --border
#    --bind 'ctrl-c:execute-silent(printf "\033_Ga=d\033\\" > /dev/tty)+abort'
#    --bind 'esc:execute-silent(printf "\033_Ga=d\033\\" > /dev/tty)+abort'
#    --bind 'enter:execute-silent(printf "\033_Ga=d\033\\" > /dev/tty)+accept'
#)
#
## Apply base flags globally
#zstyle ':fzf-tab:*' switch-group '<' '>'
#zstyle ':fzf-tab:*' fzf-flags $FZF_TAB_FLAGS
#
## Only these commands get the preview window
#zstyle ':fzf-tab:complete:(cd|ls|ll|la|lt|z|cat|bat|nvim|vim|chafa|rm|cp|mv|open):*' fzf-flags $FZF_TAB_FLAGS --preview-window=right:60%
#
## Preview script only for file/directory commands
#zstyle ':fzf-tab:complete:(cd|ls|ll|la|lt|z|cat|bat|nvim|vim|chafa|rm|cp|mv|open):*' fzf-preview '
#if [[ -d "$realpath" ]]; then
#    eza --color=always --icons=always --group-directories-first -1 "$realpath"
#elif [[ -f "$realpath" ]]; then
#    if [[ "$realpath" == *.png || "$realpath" == *.jpg || "$realpath" == *.jpeg || "$realpath" == *.gif || "$realpath" == *.webp || "$realpath" == *.svg ]]; then
#        printf "\033_Ga=d\033\\" > /dev/tty
#        chafa -f kitty -s ${FZF_PREVIEW_COLUMNS}x${FZF_PREVIEW_LINES} "$realpath"
#    else
#        bat --style=numbers --color=always --line-range=:200 "$realpath"
#    fi
#fi
#'
#
## ---------- Standalone Ctrl+T Previews ----------
#export FZF_CTRL_T_OPTS="--preview '
#if [[ \"{}\" == *.png || \"{}\" == *.jpg || \"{}\" == *.jpeg || \"{}\" == *.gif || \"{}\" == *.webp || \"{}\" == *.svg ]]; then
#    printf \"\033_Ga=d\033\\\\\" > /dev/tty
#    chafa -f kitty -s \${FZF_PREVIEW_COLUMNS}x\${FZF_PREVIEW_LINES} \"{}\"
#else
#    bat --color=always --style=numbers --line-range=:200 \"{}\"
#fi
#' --preview-window=right:60% \
#--bind 'ctrl-c:execute-silent(printf \"\033_Ga=d\033\\\\\" > /dev/tty)+abort' \
#--bind 'esc:execute-silent(printf \"\033_Ga=d\033\\\\\" > /dev/tty)+abort' \
#--bind 'enter:execute-silent(printf \"\033_Ga=d\033\\\\\" > /dev/tty)+accept'"

# ---------- Syntax highlighting ----------
# Keep this near the end
source "$BREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# ---------- Better history search with arrow keys ----------
autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search
bindkey "${terminfo[kcud1]}" down-line-or-beginning-search

# Fallback bindings
bindkey '^[[A' up-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search

# ---------- Atuin ----------
# Keeps Ctrl+R integration, but avoids taking over Up arrow
eval "$(atuin init zsh --disable-up-arrow)"

# ---------- Zoxide ----------
eval "$(zoxide init zsh)"

# ---------- Aliases ----------
alias ls='eza --icons=always --group-directories-first'
alias ll='eza -lah --icons=always --group-directories-first'
alias la='eza -la --icons=always --group-directories-first'
alias lt='eza --tree --icons=always'

