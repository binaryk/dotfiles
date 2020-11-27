# Shortcuts
alias copyssh="pbcopy < $HOME/.ssh/id_rsa.pub"
alias reload="source $HOME/.zshrc"
alias reloaddns="dscacheutil -flushcache && sudo killall -HUP mDNSResponder"
alias ll="/usr/local/opt/coreutils/libexec/gnubin/ls -AhlFo --color --group-directories-first"
alias phpstorm='open -a /Applications/PhpStorm.app "`pwd`"'
alias shrug="echo '¯\_(ツ)_/¯' | pbcopy"
alias aliases="vi $DOTFILES/aliases.zsh"
alias c="clear"

# Directories
alias home="cd $HOME"
alias dots="cd $DOTFILES"
alias library="cd $HOME/Library"
alias sites="cd $HOME/Sites"
alias lara="sites && cd laravel/"
alias work="sites && cd work/"
alias binar="sites && cd binarcode/"
alias school="sites && cd school/"
alias h="sites && cd homestead/"

# Laravel
alias a="php artisan"
alias ams="php artisan migrate:fresh --seed"
alias tests="php artisan test"
alias migrate="php artisan migrate"
alias rollback="php artisan migrate:rollback"
alias log="rm -rf ./storage/logs/laravel.log && touch ./storage/logs/laravel.log && tail -f ./storage/logs/laravel.log"

# PHP
alias php74="/usr/local/Cellar/php@7.4/7.4.13/bin/php"
alias php72="/usr/local/Cellar/php@7.2/7.2.26/bin/php"
alias cfresh="rm -rf vendor/ composer.lock && composer i"
alias watch="phpunit-watcher watch --filter="
alias w="phpunit-watcher watch --filter="
alias cr="composer require"
alias cup="composer update"
alias p='./vendor/bin/phpunit'

# JS
alias nfresh="rm -rf node_modules/ package-lock.json && npm install"

# Vagrant
alias v="vagrant global-status"
alias vup="vagrant up"
alias vhalt="vagrant halt"
alias vssh="vagrant ssh"
alias vreload="vagrant reload"
alias vpreload="vagrant reload --provision"
alias vrebuild="vagrant destroy --force && vagrant up"

# Docker
alias docker-composer="docker-compose"
#alias dstop="docker stop $(docker ps -a -q)"
#alias dpurgecontainers="dstop && docker rm $(docker ps -a -q)"
#alias dpurgeimages="docker rmi $(docker images -q)"
#dbuild() { docker build -t=$1 .; }
#dbash() { docker exec -it $(docker ps -aqf "name=$1") bash; }

# Git
alias nah='git reset --hard HEAD; git clean -df'
alias gst="git status"
alias gb="git branch"
alias gc="git checkout"
alias gl="git log --oneline --decorate --color"
alias amend="git add . && git commit --amend --no-edit"
alias commit="git add . && git commit -m"
alias diff="git diff"
alias force="git push --force"
alias nuke="git clean -df && git reset --hard"
alias pop="git stash pop"
alias pull="git pull"
alias resolve="git add . && git commit --no-edit"
alias stash="git stash -u"
alias unstage="git restore --staged ."
alias wip="commit wip"
alias gcn="git checkout -b"
alias gcm="git checkout master && git pull origin master"
alias gplmm="git pull origin main"
alias gcmm="git checkout main && git pull origin main"
alias gcs="git checkout staging && git pull origin staging"
alias gpls="git pull origin staging"
alias gplm="git pull origin master"
alias gcd="git checkout development && git pull origin development"
alias gph="git push origin HEAD"
alias gplh="git pull origin HEAD"
alias gcdd="git checkout develop && git pull origin develop"
alias gfa="git fetch --all"
alias gtrigger="git commit --allow-empty -m 'wakey wakey GitHub Actions'"
alias glog="git --no-pager log --all --color=always --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' | less -r -X +/[^/]HEAD"

# LSD
alias ls="lsd"
alias l="ls -l"
alias la="ls -a"
alias lla="ls -la"
alias lt="ls --tree"
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias diff='diff --color=auto'

# Files
alias about="neofetch"
alias vi="vim"
alias start-redis="launchctl load ~/Library/LaunchAgents/homebrew.mxcl.redis.plist"

# Composer
alias composer="php -d memory_limit=-1 /usr/local/bin/composer"

source $DOTFILES/aliases.private.zsh

# Port
alias killme="lsof -n -i4TCP:"

