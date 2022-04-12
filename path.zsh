export PATH="$HOME/.composer/vendor/bin:$PATH"

# Load Node global installed binaries
export PATH="$HOME/.node/bin:$PATH"

# Load Deno global installed binaeries
export PATH=$DENO_INSTALL/bin:$PATH

# Use project specific binaries before global ones
export PATH="node_modules/.bin:vendor/bin:$PATH"

# Setup git exclude config file
#git config --global core.excludesfile ~/.dotfiles/.gitignore_global

# Make sure coreutils are loaded before system commands
# I've disabled this for now because I only use "ls" which is
# referenced in my aliases.zsh file directly.
#export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
