# NOTE: SOURCE ME
# NOTE: This script is intented to be sourced and not running as standalone script.

# Check if sudo is available and the script is not running as root
if [ "$EUID" -ne 0 ] && command -v sudo &> /dev/null ; then
  SUDO=sudo
else
  SUDO=""
fi

if ! command -v curl &> /dev/null ; then
    # Check for curl
    echo "curl is required but it's not installed. Please install curl and run the script again."
    echo "Try: sudo apt install -y curl"

elif ! command -v brew &> /dev/null ; then
    # Check for brew
    echo "HomeBrew is required but it's not installed. Please install HomeBrew and run the script again."
    echo 'Try: '
    echo '    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"'
    echo ""
    echo "and do not forget the post installation setup:"
    echo '    (echo; echo '"'"'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"'"'"') >> '"$HOME"'/.profile'
    echo '    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"'
    echo "and ensure your platform-specific packages are installed (Brew will tell you.)"
    echo "Then rerun this script."

else
    # Create the bin directory in the user's home if it doesn't exist
    mkdir -p $HOME/bin

    # Download pypjman to $HOME/bin
    echo "Downloading PPA to $HOME/bin..."
    curl -s https://raw.githubusercontent.com/NawaMan/PythonProjectAssistant/main/ppa -o $HOME/bin/ppa

    # Change to bash if zsh does not exist.
    SHELL=zsh
    SHELLRC=~/.zshrc
    if ! command -v zsh &> /dev/null ; then
        if ! command -v sed &> /dev/null ; then $SUDO apt install sed ; fi
        sed -i '1s/.*/#!\/usr\/bin\/env bash/' $HOME/bin/ppa
        SHELL=bash
        SHELLRC=~/.bashrc
    fi

    echo "Make ppa executable"
    chmod +x $HOME/bin/ppa

    echo "Add an alias to the ppa command to $SHELLRC"
    echo "alias ppa='$HOME/bin/ppa'" >> "$SHELLRC"
    source "$SHELLRC"

    # Check for pyenv
    if ! command -v pyenv &> /dev/null ; then
        echo "pyenv not found, installing..."
        brew install pyenv
        echo 'if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi' >> "$SHELLRC"
        source "$SHELLRC"
    else 
        echo "pyenv is already installed."
    fi

    # Check for pipenv
    if ! command -v pipenv &> /dev/null ; then
        echo "pipenv not found, installing..."
        brew install pipenv
    else
        echo "pipenv is already installed."
    fi

    echo "Installation completed. You can now use the 'ppa' command."
fi
