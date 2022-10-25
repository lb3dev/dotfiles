export HOMEBREW_NO_ANALYTICS=1

function set-path {
    MACOS_VERSION=$(sw_vers -productVersion)
    PYTHON_VERSION=3.8

    if [[ $MACOS_VERSION == 12.6 || $MACOS_VERSION == 12.6.1 ]]; then
        PYTHON_VERSION=3.9
    fi

    export PATH="$PATH:/opt/homebrew/bin"
    export PATH="$HOME/Library/Python/$PYTHON_VERSION/bin:$PATH"
}

function bup {
    cd ~/.macos-setup/ansible-macos-backup
    make all
}

function yt-audio {
    yt-dlp -o "%(title)s-%(id)s.%(ext)s" --audio-format m4a --audio-quality 0 --extract-audio "$1"
}

set-path

alias ll="ls -al"
alias reload="exec ${SHELL} -l"
