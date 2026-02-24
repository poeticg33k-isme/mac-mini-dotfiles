# Path to your oh-my-zsh configuration.
export ZSH="$HOME/.oh-my-zsh"

# --- Theme Configuration ---
ZSH_THEME="gnzh"

# --- Plugins ---
# Removed zsh-autosuggestions per your preference
plugins=(
    git 
    macos
    python 
    brew 
    zsh-syntax-highlighting 
    sudo 
    you-should-use 
    zsh-bat
)

source $ZSH/oh-my-zsh.sh

# --- Syntax Highlighting Fallback ---
# Keeps your brew-installed highlighting working
if [ -f /opt/homebrew/opt/zsh-fast-syntax-highlighting/share/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh ]; then
    source /opt/homebrew/opt/zsh-fast-syntax-highlighting/share/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
fi

# --- Clean Path ---
# Logic: Personal scripts first, then Homebrew, then System paths
export PATH="$HOME/scripts:$HOME/scripts/python:/opt/homebrew/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
export PATH="/usr/local/opt/gpg-agent/bin:/usr/local/opt/openssl/bin:$PATH"

# --- Everforest Custom Prompt (Nerd Font Icons) ---
# %F{#7fbbb3} is Everforest Blue.  is Home.  is Git.
PROMPT='%F{#7fbbb3} %f %F{cyan}%~%f $(git_prompt_info) %F{yellow}❯%f '
ZSH_THEME_GIT_PROMPT_PREFIX="%F{white}(%f%F{magenta} %f"

# --- User Configuration & Aliases ---
if [ -f ~/.aliases ]; then
    source ~/.aliases
fi

# Shell Options
unsetopt HIST_VERIFY
HIST_STAMPS="mm/dd/yyyy"

# Pressing 'ESC' then 's' will prepend sudo to the current line
bindkey -s '\es' 'asudo \e'

# Fix for Ctrl+C behavior
stty intr ^C

# --- Root-Aware Everforest Prompt ---
# %(!.red.color) is a ternary: if root, use red; else use Everforest Blue
#  = Home icon,  = Git icon
PROMPT='%F{%(!.red.#7fbbb3)} %f %F{cyan}%~%f $(git_prompt_info) %F{yellow}❯%f '

# This makes the Git branch icon also turn red when root
ZSH_THEME_GIT_PROMPT_PREFIX="%F{white}(%f%F{%(!.red.magenta)} %f"

# --- kitty tmux ----
if [[ -n "$SSH_CONNECTION" ]]; then
  if command -v tmux >/dev/null 2>&1; then
    [ -z "$TMUX" ] && tmux new -As main
  fi
fi
export EDITOR="vim"
export VISUAL="vim"
export SUDO_EDITOR="vim"

export TERM=xterm-kitty
