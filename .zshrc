export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_AUTO_UPDATE_SECS=604800

SETUP_DIR=~/.setup

function brew-all {
    brew update && brew upgrade && brew autoremove && brew cleanup
}

function venv-ansible {
    source "$SETUP_DIR/venv-ansible/bin/activate"
}

function set-path {
    MACOS_VERSION=$(sw_vers -productVersion | cut -d '.' -f1,2)
    BASE_MACOS_VERSION="12.5"
    PYTHON_VERSION=3.8

    # Python 3.9 is the default version installed with macOS 12.5+
    if [[ $(echo -e "$MACOS_VERSION\n$BASE_MACOS_VERSION" | sort -V | tail -1) == "$MACOS_VERSION" ]]; then
        PYTHON_VERSION=3.9
    fi

    export PATH="$PATH:/opt/homebrew/bin"
    export PATH="$HOME/Library/Python/$PYTHON_VERSION/bin:$PATH"
}

function backup-all {
    venv-ansible
    cd "$SETUP_DIR/ansible-macos-backup"
    make all
    deactivate
}

function backup-firefox {
    venv-ansible
    cd "$SETUP_DIR/ansible-macos-backup"
    make firefox
    deactivate
}

function yt-audio {
    yt-dlp -o "%(title)s-%(id)s.%(ext)s" --audio-format m4a --audio-quality 0 --extract-audio "$1"
}

set-path

alias ll="ls -al"
alias reload="exec ${SHELL} -l"
