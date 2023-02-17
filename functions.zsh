push() {
    echo $?;
    git status .
    git add .
    git commit -m "fix: $1"
    git push origin HEAD
}

fix() {
    echo $?;
    git status .
    git add .
    git commit -m "fix: $1"
    git push origin HEAD
    tag=$(git describe --tags --abbrev=0)
    echo $tag
}

feat() {
    echo $?;
    git status .
    git add .
    git commit -m "feat: $1"
    git push origin HEAD
}

function sync() {
 if [ -d .git ]; then
  branch=$(git branch --show-current)
 else
  branch=$1
 fi;

 echo "Sync with branch $branch"
 git pull origin "$branch"
}

gcbr() {
    git checkout "$1"
    git pull origin "$1"
}


function homestead() {
    ( cd ~/Homestead && vagrant $* )
}

function db {
    if [ "$1" = "refresh" ]; then
        mysql -uroot -e "drop database $2; create database $2"
    elif [ "$1" = "create" ]; then
        mysql -psecret -h127.0.0.1 -uroot -e "create database $2"
    elif [ "$1" = "import" ]; then
        mysql -uroot $2 < "$3"
    elif [ "$1" = "reimport" ]; then
        db refresh $2 && mysql -uroot $2 < "$3"
    elif [ "$1" = "drop" ]; then
        mysql -uroot -e "drop database $2"
    elif [ "$1" = "list" ]; then
        mysql -uroot -e "show databases" | perl -p -e's/\|| *//g'
    fi
}

function ws {
 ./vendor/bin/pest --filter="\"$1\"" --watch
}

archive () {
   zip -r "$1".zip -i "$1" ;
}

# All the dig info
function digga() {
	dig +nocmd "$1" any +multiline +noall +answer
}


# Scrape a single webpage with all assets
function scrapeUrl() {
    wget --adjust-extension --convert-links --page-requisites --span-hosts --no-host-directories "$1"
}

function scheduler () {
    while :; do
        php artisan schedule:run
	echo "Sleeping 60 seconds..."
        sleep 60
    done
}
