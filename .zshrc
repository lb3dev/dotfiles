export PATH="$PATH:/opt/homebrew/bin"

export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_AUTO_UPDATE_SECS=604800

PROMPT='%F{99}%n@%f %F{114}%*%f %F{75}%~%f %F{99}>%f '

SETUP_DIR=~/.setup
SETUP_LOGS_DIR="$SETUP_DIR/logs"

function brew-all {
    brew update && brew upgrade && brew autoremove && brew cleanup
}

function venv-ansible {
    source "$SETUP_DIR/venv-ansible/bin/activate"
}

function backup-all {
    CURR_DATE=$(date +%Y-%m-%d-%H%M%S)
    export ANSIBLE_LOG_PATH="$SETUP_LOGS_DIR/backup-$CURR_DATE.log"

    venv-ansible
    cd "$SETUP_DIR/ansible-macos-backup"
    make all
    deactivate
}

function yt-audio {
    yt-dlp -o "%(title)s-%(id)s.%(ext)s" --audio-format m4a --audio-quality 0 --extract-audio "$1"
}

alias ll="ls -al"
alias reload="exec ${SHELL} -l"
