#  Commit everything
function commit() {
  commitMessage="$*"

  git add .

  if [ "$commitMessage" = "" ]; then
     diff_input=$(echo "=== Summary ===" && git diff --cached --stat && echo -e "\n=== Diff (truncated if large) ===" && git diff --cached | head -c 50000)
     commitMessage=$(echo "$diff_input" | claude -p "Write a single-line commit message for this diff. Output ONLY the message, no quotes, no explanation, no markdown.")

     git commit -m "$commitMessage"
     return
  fi

  eval "git commit -a -m '${commitMessage}'"
}

push() {
    echo $?;
    git status .
    git add .
    git commit -m "fix: $1"
    git push origin HEAD
}

fix() {
    ## I want to automatically PR with a tag number greather than the previous one in the bug fix semver version
    git fetch --all > /dev/null 2>&1 &

    version=$(git describe --tags `git rev-list --tags --max-count=1` || echo "0.0.1")
    last_num=${version##*.}  # Extract the last number using substring removal
    new_num=$((last_num+1))  # Increase the last number by 1 using arithmetic expansion
    new_version=${version%.*}.$new_num  # Replace the last number in the version string
    echo $new_version

    current_branch=$(git rev-parse --abbrev-ref HEAD)
    if [[ "$current_branch" =~ ^(master|main|staging|dev|develop)$ ]]; then
        git checkout -b $new_version
    fi

    git status .
    git add .

    # If no argument provided, auto-generate commit message
    if [ -z "$1" ]; then
        diff_input=$(echo "=== Summary ===" && git diff --cached --stat && echo -e "\n=== Diff (truncated if large) ===" && git diff --cached | head -c 50000)
        commitMessage=$(echo "$diff_input" | claude -p "Write a single-line commit message for this diff. Output ONLY the message, no quotes, no explanation, no markdown.")
        git commit -m "fix: $commitMessage"
    else
        git commit -m "fix: $1"
    fi

    git push origin HEAD

    # Detect base branch
    base_branch=""
    for branch in master main staging dev develop; do
        if git show-ref --verify --quiet refs/remotes/origin/$branch; then
            base_branch=$branch
            break
        fi
    done

    # Generate PR title and description using Claude based on commits
    commits=$(git log origin/$base_branch..HEAD --pretty=format:"%s" --reverse)
    pr_input=$(echo "=== Commits ===" && echo "$commits")
    pr_data=$(echo "$pr_input" | claude -p "Based on these commits, generate a PR title and description. Format: First line is the title (short, under 70 chars), then a blank line, then the description with bullet points of what was changed. Output ONLY the formatted text, no quotes, no markdown code blocks.")

    # Extract title (first line) and description (rest)
    pr_title=$(echo "$pr_data" | head -n 1)
    pr_description=$(echo "$pr_data" | tail -n +3)

    gh pr create -t "$pr_title" -b "$pr_description"
}

feat() {
    ## I want to automatically PR with a tag number greather than the previous one in the minor semver version
    git fetch --all
    version=$(git describe --tags `git rev-list --tags --max-count=1` || echo "0.1.0")
    middle_num=$(echo $version | cut -d. -f2)  # Extract the middle number using cut
    new_num=$((middle_num+1))  # Increase the middle number by 1 using arithmetic expansion
    new_version=$(echo $version | sed "s/\.[0-9]*\./.$new_num./")  # Replace the middle number in the version string
    new_version="${new_version%.*}.0"
    echo $new_version

    current_branch=$(git rev-parse --abbrev-ref HEAD)
    if [[ "$current_branch" =~ ^(master|main|staging|dev|develop)$ ]]; then
        git checkout -b $new_version
    fi

    git status .
    git add .

    # If no argument provided, auto-generate commit message
    if [ -z "$1" ]; then
        diff_input=$(echo "=== Summary ===" && git diff --cached --stat && echo -e "\n=== Diff (truncated if large) ===" && git diff --cached | head -c 50000)
        commitMessage=$(echo "$diff_input" | claude -p "Write a single-line commit message for this diff. Output ONLY the message, no quotes, no explanation, no markdown.")
        git commit -m "feat: $commitMessage"
    else
        git commit -m "feat: $1"
    fi

    git push origin HEAD

    # Detect base branch
    base_branch=""
    for branch in master main staging dev develop; do
        if git show-ref --verify --quiet refs/remotes/origin/$branch; then
            base_branch=$branch
            break
        fi
    done

    # Generate PR title and description using Claude based on commits
    commits=$(git log origin/$base_branch..HEAD --pretty=format:"%s" --reverse)
    pr_input=$(echo "=== Commits ===" && echo "$commits")
    pr_data=$(echo "$pr_input" | claude -p "Based on these commits, generate a PR title and description. Format: First line is the title (short, under 70 chars), then a blank line, then the description with bullet points of what was changed. Output ONLY the formatted text, no quotes, no markdown code blocks.")

    # Extract title (first line) and description (rest)
    pr_title=$(echo "$pr_data" | head -n 1)
    pr_description=$(echo "$pr_data" | tail -n +3)

    gh pr create -t "$pr_title" -b "$pr_description"
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


