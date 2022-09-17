export HOMEBREW_NO_ANALYTICS=1

function setPath {
    MACOS_VERSION=$(sw_vers -productVersion)

    if [[ $MACOS_VERSION == 12.6 ]]; then
        export PATH="$HOME/Library/Python/3.9/bin:/opt/homebrew/bin:$PATH"
    else
        export PATH="$HOME/Library/Python/3.8/bin:/opt/homebrew/bin:$PATH"
    fi
}

setPath