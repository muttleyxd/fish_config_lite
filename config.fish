## Set values
# Hide welcome message
set fish_greeting
set VIRTUAL_ENV_DISABLE_PROMPT "1"
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"

## Environment setup
# Apply .profile: use this to put fish compatible .profile stuff in
if test -f ~/.fish_profile
  source ~/.fish_profile
end

# Add ~/.local/bin to PATH
if test -d ~/.local/bin
    if not contains -- ~/.local/bin $PATH
        set -p PATH ~/.local/bin
    end
end

set -p PATH ~/.cargo/bin

## Advanced command-not-found hook
source /usr/share/doc/find-the-command/ftc.fish

## Useful aliases
# Replace ls with eza
alias ls='eza -al --color=always --group-directories-first --icons' # preferred listing
alias la='eza -a --color=always --group-directories-first --icons'  # all files and dirs
alias ll='eza -l --color=always --group-directories-first --icons'  # long format
alias lt='eza -aT --color=always --group-directories-first --icons' # tree listing
alias l.='eza -ald --color=always --group-directories-first --icons .*' # show only dotfiles

# Replace some more things with better alternatives
alias cat='bat --paging=never --style header --style snip --style changes --style header'

# Others
source ~/.config/fish/fish_command_timer.fish
set fish_command_timer_time_format '%d-%m-%Y %H:%M:%S'
set -g fish_emoji_width 1
set -g fish_ambiguous_width 1

set -xU EDITOR micro
set GIT_EDITOR micro

alias complainers='fmtnightly && cargo build --workspace && cargo test --workspace && cargo clippy --workspace --all-targets -- -W clippy::redundant_clone -W clippy::dbg_macro -D warnings'
alias acki='ack --ignore-dir=target'
alias fmtnightly='cargo +nightly fmt' 
