export HOMEBREW_NO_ANALYTICS=1

function set-path {
    MACOS_VERSION=$(sw_vers -productVersion)

    if [[ $MACOS_VERSION == 12.6 ]]; then
        export PATH="$HOME/Library/Python/3.9/bin:/opt/homebrew/bin:$PATH"
    else
        export PATH="$HOME/Library/Python/3.8/bin:/opt/homebrew/bin:$PATH"
    fi
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
