push() {
  git add . && git commit -am "$@" && git push origin HEAD
}

search() {
  mdfind -name $@
}
