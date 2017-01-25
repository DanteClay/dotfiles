# aliases
alias code="cd $HOME/code"
alias py="python3"
alias pass="password-store"
alias godoc="go doc"
set -g godir "$HOME/go/src/github.com/danteclay"

# env
set -x GOPATH $HOME/go
set -x PATH $PATH  $HOME/go/bin

# bang bang
function bind_bang
    switch (commandline -t)[-1]
        case "!"
            commandline -t $history[1]; commandline -f repaint
        case "*"
            commandline -i !
    end
end

function fish_user_key_bindings
    bind ! bind_bang
end

# prompt
function fish_right_prompt
    __terlar_git_prompt
end

function gmusic
	nohup google-chrome-stable --user-data-dir="$HOME/.local/.cache/google-music" ^&1 > /dev/null &
end

function tocode
	ln -s (pwd) ~/code/
end
