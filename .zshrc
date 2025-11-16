export PATH="$PATH:/opt/homebrew/bin:/usr/local/bin"

export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_AUTO_UPDATE_SECS=604800

PROMPT='%F{99}%n@%f %F{114}%*%f %F{75}%~%f %F{99}>%f '

SETUP_DIR=~/.setup
SETUP_LOGS_DIR="$SETUP_DIR/logs"
SETUP_BACKUP_LOGS_DIR="$SETUP_DIR/logs/backup"

function venv-setup {
    source "$SETUP_DIR/venv-ansible/bin/activate"
}

function run-ansible-setup {
    CURR_DATE=$(date +%Y-%m-%d-%H%M%S)
    export ANSIBLE_LOG_PATH="$SETUP_LOGS_DIR/$1-$CURR_DATE.log"

    venv-setup
    cd "$SETUP_DIR/ansible-macos-setup"
    make "$1"
    deactivate
}

function run-ansible-backup {
    CURR_DATE=$(date +%Y-%m-%d-%H%M%S)
    export ANSIBLE_LOG_PATH="$SETUP_BACKUP_LOGS_DIR/$1-$CURR_DATE.log"

    venv-setup
    cd "$SETUP_DIR/ansible-macos-backup"
    make "$1"
    deactivate
}

function setup-terminal {
    run-ansible-setup terminal
}

function setup-dotfiles {
    run-ansible-setup dotfiles
}

function setup-backup {
    run-ansible-setup backup
}

function backup-all {
    run-ansible-backup all
}

function backup-firefox {
    run-ansible-backup firefox
}

function yt-audio {
    yt-dlp -o "%(title)s-%(id)s.%(ext)s" --audio-format m4a --audio-quality 0 --extract-audio "$1"
}

alias brew-zap="brew uninstall --zap --force"
alias brew-clean="brew autoremove && brew cleanup -s"
alias brew-all="brew update && brew upgrade && brew autoremove && brew cleanup -s"

alias ll="ls -al"
alias diff-all="diff -x .DS_Store -rq"
alias reload="exec ${SHELL} -l"
