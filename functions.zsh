push() {
    git status .
    git add .
    git commit -m "$1"
    git push origin HEAD
}

search() {
    if [ $# = 1 ];
    then
        command find . -iname "*$@*"
    else
        command find "$@"
    fi
}
