push() {
    echo $?;
    git status .
    git add .
    git commit -m "$1"
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
        mysql -uroot -e "create database $2"
    elif [ "$1" = "drop" ]; then
        mysql -uroot -e "drop database $2"
    elif [ "$1" = "list" ]; then
        mysql -uroot -e "show databases" | perl -p -e's/\|| *//g'
    fi
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
