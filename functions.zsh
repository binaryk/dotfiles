push() {
    git status .
    git add .
    git commit -m "$1"
    git push origin HEAD
}

gcbr() {
    git checkout "$1"
    git pull origin "$1"
}

search() {
    if [ $# = 1 ];
    then
        command find . -iname "*$@*"
    else
        command find "$@"
    fi
}
