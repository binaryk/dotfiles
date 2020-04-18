# Load plugin from the brew path
source $BREW_LOCATION/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

plugins=(git)

# https://github.com/bhilburn/powerlevel9k#prompt-customization

POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_SHORTEN_STRATEGY=truncate_to_last
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()

source $DOTFILES/aliases.zsh
source $DOTFILES/functions.zsh
