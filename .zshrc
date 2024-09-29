export PATH="$PATH:/opt/homebrew/bin"

export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_AUTO_UPDATE_SECS=604800

PROMPT='%F{99}%n@%f %F{114}%*%f %F{75}%~%f %F{99}>%f '

SETUP_DIR=~/.setup

function brew-all {
    brew update && brew upgrade && brew autoremove && brew cleanup
}

function venv-ansible {
    source "$SETUP_DIR/venv-ansible/bin/activate"
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

alias ll="ls -al"
alias reload="exec ${SHELL} -l"
