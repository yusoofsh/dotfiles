fish_add_path /opt/homebrew/sbin
fish_add_path /opt/homebrew/opt/zip/bin
fish_add_path /opt/homebrew/opt/apr/bin
fish_add_path /opt/homebrew/opt/curl/bin
fish_add_path /opt/homebrew/opt/ruby/bin
fish_add_path /opt/homebrew/opt/libpq/bin
fish_add_path /opt/homebrew/opt/bison/bin
fish_add_path /opt/homebrew/opt/swift/bin
fish_add_path /opt/homebrew/opt/apr-util/bin
fish_add_path /opt/homebrew/opt/libressl/bin
fish_add_path /Users/yusoofsh/Library/Android/SDK/tools
fish_add_path /Users/yusoofsh/Library/Android/SDK/platform-tools
fish_add_path /Users/yusoofsh/Library/Android/SDK/cmdline-tools/latest/bin

set -gx BUN_INSTALL "$HOME/.bun"
set -gx FVM_HOME "$HOME/.fvm"
set -gx JENV_ROOT "$HOME/.jenv"
set -gx PNPM_HOME "$HOME/Library/pnpm"
set -gx PUB_CACHE "$HOME/.pub-cache"
set -gx PYENV_ROOT "$HOME/.pyenv"
set -gx SPOOFDPI_HOME "$HOME/.spoof-dpi"
set -gx VOLTA_HOME "$HOME/.volta"

set -gx PATH "$BUN_INSTALL/bin" $PATH
set -gx PATH "$FVM_HOME/default/bin" $PATH
set -gx PATH "$JENV_ROOT/bin" $PATH
set -gx PATH "$PNPM_HOME" $PATH
set -gx PATH "$PUB_CACHE/bin" $PATH
set -gx PATH "$PYENV_ROOT/bin" $PATH
set -gx PATH "$SPOOFDPI_HOME/bin" $PATH
set -gx PATH "$VOLTA_HOME/bin" $PATH

set -gx fish_greeting
set -gx ATUIN_NOBIND true
set -gx ENHANCD_COMMAND ecd
set -gx ENHANCD_FILTER peco:fzy

zoxide init fish | source
starship init fish | source

if status is-interactive
    atuin init fish | source
    pyenv init - | source
    # jenv init - | source
end

if status is-login
    pyenv init --path | source
end

set HB_CNF_HANDLER (brew --repository)"/Library/Taps/homebrew/homebrew-command-not-found/handler.fish"
if test -f $HB_CNF_HANDLER
    source $HB_CNF_HANDLER
end

if test -d (brew --prefix)"/share/fish/completions"
    set -gx fish_complete_path $fish_complete_path (brew --prefix)/share/fish/completions
end

if test -d (brew --prefix)"/share/fish/vendor_completions.d"
    set -gx fish_complete_path $fish_complete_path (brew --prefix)/share/fish/vendor_completions.d
end

alias c clear
alias cat bat
alias find fd
alias dig dog
alias top btm
alias vi nvim
alias vim nvim
alias cls clear
alias which type
alias tree broot
alias ping gping
alias curl curlie
alias code code-insiders
alias man "man $argv 2> /dev/null"
alias brew "env PATH=(string replace (pyenv root)/shims '' $PATH) brew"
alias ls "exa --all --long --icons --tree --level=1 --no-permissions --no-user --time-style=long-iso --git --sort=name --group-directories-first --binary"
alias up "mas upgrade; brew update; brew upgrade; brew autoremove; brew cleanup; volta install node@lts node@latest npm@latest yarn@latest firebase-tools@latest node-gyp@latest pnpm@latest serve@latest ynpx@latest nodemon@latest ni@latest qnm@latest; flutter upgrade"

