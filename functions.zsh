push() {
    echo $?;
    git status .
    git add .
    git commit -m "fix: $1"
    git push origin HEAD
}

fix() {
    ## I want to automatically PR with a tag number greather than the previous one in the bug fix semver version
    git fetch --tags > /dev/null 2>&1 &

    version=$(git describe --tags --abbrev=0 || echo "0.0.1")
    last_num=${version##*.}  # Extract the last number using substring removal
    new_num=$((last_num+1))  # Increase the last number by 1 using arithmetic expansion
    new_version=${version%.*}.$new_num  # Replace the last number in the version string
    echo $new_version
    if [ "$(git rev-parse --abbrev-ref HEAD)" = "$(git remote show origin | awk '/HEAD branch/ {print $NF}')" ]; then
    git checkout -b $new_version
	else
    fi

    git status .
    git add .
    git commit -m "fix: $1"
    git push origin HEAD

    # https://cli.github.com/
    if [ -z "$1" ]; then
    	gh pr create -t $new_version -f
    else
	message=$(echo -e "## Fixed\n$1")
    	gh pr create -t $new_version -b $message
    fi
}

feat() {
    ## I want to automatically PR with a tag number greather than the previous one in the minor semver version
    git fetch --tags > /dev/null 2>&1 &
    version=$(git describe --tags --abbrev=0 || echo "0.1.0") 
    middle_num=$(echo $version | cut -d. -f2)  # Extract the middle number using cut
    new_num=$((middle_num+1))  # Increase the middle number by 1 using arithmetic expansion
    new_version=$(echo $version | sed "s/\.[0-9]*\./.$new_num./")  # Replace the middle number in the version string
    new_version="${new_version%.*}.0"
    echo $new_version
    if [ "$(git rev-parse --abbrev-ref HEAD)" = "$(git remote show origin | awk '/HEAD branch/ {print $NF}')" ]; then
    git checkout -b $new_version
	else
    fi

    git status .
    git add .
    git commit -m "feat: $1"
    git push origin HEAD

    # https://cli.github.com/
    if [ -z "$1" ]; then
    	gh pr create -t $new_version -f
    else
	message=$(echo -e "## Added\n$1")
    	gh pr create -t $new_version -b $message
    fi
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
