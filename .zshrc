export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_AUTO_UPDATE_SECS=604800

function venv-ansible {
    source ~/.macos-setup/venv-ansible/bin/activate
}

function set-path {
    MACOS_VERSION=$(sw_vers -productVersion | cut -d '.' -f1,2)
    PYTHON_VERSION=3.8

    if [[ $MACOS_VERSION == 12.6 ]]; then
        PYTHON_VERSION=3.9
    fi

    export PATH="$PATH:/opt/homebrew/bin"
    export PATH="$HOME/Library/Python/$PYTHON_VERSION/bin:$PATH"
    export PATH="/opt/homebrew/opt/qt@5/bin:$PATH"
}

function backup-all {
    venv-ansible
    cd ~/.macos-setup/ansible-macos-backup
    make all
    deactivate
}

function backup-firefox {
    venv-ansible
    cd ~/.macos-setup/ansible-macos-backup
    make firefox
    deactivate
}

function macos-setup {
    venv-ansible
    cd ~/.macos-setup/ansible-macos-setup
    make run
    deactivate
}

function yt-audio {
    yt-dlp -o "%(title)s-%(id)s.%(ext)s" --audio-format m4a --audio-quality 0 --extract-audio "$1"
}

set-path

alias ll="ls -al"
alias reload="exec ${SHELL} -l"
