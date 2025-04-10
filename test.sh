#!/bin/sh

git filter-branch --env-filter -f '

an="$GIT_AUTHOR_NAME"
am="$GIT_AUTHOR_EMAIL"
cn="$GIT_COMMITTER_NAME"
cm="$GIT_COMMITTER_EMAIL"

cn="lulzshadowwalker"
cm="lulzshadowwalker@gmail.com"
an="lulzshadowwalker"
am="lulzshadowwalker@gmail.com"

export GIT_AUTHOR_NAME="$an"
export GIT_AUTHOR_EMAIL="$am"
export GIT_COMMITTER_NAME="$cn"
export GIT_COMMITTER_EMAIL="$cm"
'
