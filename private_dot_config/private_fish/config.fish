fish_add_path /opt/homebrew/sbin
fish_add_path /opt/homebrew/opt/zip/bin
fish_add_path /opt/homebrew/opt/apr/bin
fish_add_path /opt/homebrew/opt/curl/bin
fish_add_path /opt/homebrew/opt/ruby/bin
fish_add_path /opt/homebrew/opt/libpq/bin
fish_add_path /opt/homebrew/opt/bison/bin
fish_add_path /opt/homebrew/opt/python/bin
fish_add_path /opt/homebrew/opt/apr-util/bin
fish_add_path /opt/homebrew/opt/libressl/bin

fish_add_path /Users/yusoofsh/Library/Android/SDK/tools
fish_add_path /Users/yusoofsh/Library/Android/SDK/platform-tools
fish_add_path /Users/yusoofsh/Library/Android/SDK/cmdline-tools/latest/bin

set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH

set -gx FVM_HOME "$HOME/.fvm"
set -gx PATH "$FVM_HOME/default/bin" $PATH

if status is-interactive
    atuin init fish | source
end

zoxide init fish | source
starship init fish | source

set HB_CNF_HANDLER (brew --repository)"/Library/Taps/homebrew/homebrew-command-not-found/handler.fish"
if test -f $HB_CNF_HANDLER
   source $HB_CNF_HANDLER
end

alias cd "z"
alias c "clear"
alias cat "bat"
alias find "fd"
alias dig "dog"
alias top "btm"
alias vi "nvim"
alias vim "nvim"
alias cls "clear"
alias which "type"
alias tree "broot"
alias ping "gping"
alias python "python3"
alias code "code-insiders"
alias ls "exa --all --long --icons --tree --level=1 --no-permissions --no-user --time-style=long-iso --header --git --sort=acc --group-directories-first --binary"
