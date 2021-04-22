push() {
	$branch = git rev-parse --abbrev-ref HEAD

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


search() {
    if [ $# = 1 ];
    then
        command find . -iname "*$@*"
    else
        command find "$@"
    fi
}


function homestead() {
    ( cd ~/Homestead && vagrant $* )
}
