export PATH="$PATH:/opt/homebrew/bin"

export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_AUTO_UPDATE_SECS=604800

PROMPT='%F{99}%n@%f %F{114}%*%f %F{75}%~%f %F{99}>%f '

SETUP_DIR=~/.setup
SETUP_LOGS_DIR="$SETUP_DIR/logs"
SETUP_BACKUP_LOGS_DIR="$SETUP_DIR/logs/backup"

function setup-ansible-setup {
    CURR_DATE=$(date +%Y-%m-%d-%H%M%S)
    export ANSIBLE_LOG_PATH="$SETUP_LOGS_DIR/ansible-$CURR_DATE.log"
    source "$SETUP_DIR/venv-ansible/bin/activate"
    cd "$SETUP_DIR/ansible-macos-setup"
}

function setup-ansible-backup {
    CURR_DATE=$(date +%Y-%m-%d-%H%M%S)
    export ANSIBLE_LOG_PATH="$SETUP_BACKUP_LOGS_DIR/backup-$CURR_DATE.log"
    source "$SETUP_DIR/venv-ansible/bin/activate"
    cd "$SETUP_DIR/ansible-macos-backup"
}

function setup-dotfiles {
    setup-ansible-setup
    make dotfiles
    deactivate
}

function backup-all {
    setup-ansible-backup
    make all
    deactivate
}

function backup-firefox {
    setup-ansible-backup
    make firefox
    deactivate
}

function yt-audio {
    yt-dlp -o "%(title)s-%(id)s.%(ext)s" --audio-format m4a --audio-quality 0 --extract-audio "$1"
}

alias brew-zap="brew uninstall --zap"
alias brew-clean="brew autoremove && brew cleanup -s"
alias brew-all="brew update && brew upgrade && brew autoremove && brew cleanup -s"

alias ll="ls -al"
alias diff-all="diff -x .DS_Store -rq"
alias reload="exec ${SHELL} -l"
